import os
import re
import copy
import time
import shutil
import random
import signal
import pathlib

from smort.src.base.utils import list2str, random_string, plain, escape
from smort.src.base.exitcodes import OK_BUGS, OK_NOBUGS, ERR_EXHAUSTED_DISK
from smort.src.core.BugType import BugType
from smort.src.core.Statistic import *
from smort.src.core.Solver import Solver, SolverResult
from smort.src.core.returncodes import * 
from smort.src.core.utils import (
    get_seeds_tuples,
    grep_result,
    admissible_seed_size,
    in_crash_list,
    in_duplicate_list,
    in_ignore_list,
)
from smort.src.core.logger import (
    init_logging,
    log_strategy_num_seeds,
    log_generation_attempt,
    log_finished_generations,
    log_crash_trigger,
    log_ignore_list_mutant,
    log_duplicate_trigger,
    log_segfault_trigger,
    log_solver_timeout,
    log_soundness_trigger,
    log_invalid_mutant,
    log_skip_seed_mutator,
    log_skip_seed_test,
    log_processing_seeds,
    log_debug,
    log_error,
)

from smort.src.translate.smtmr.MetamorphicRelation import Status
from smort.src.translate.smtmr.translate import translate_mr_file
from smort.src.translate.smtlibv2.translate import translate_script_file
from smort.src.mutator.Mutator import Mutator


MAX_TIMEOUTS = 32


class Fuzzer:
    def __init__(self, args):
        self.args = args

        self.mr = translate_mr_file(self.args.METAMORPHIC_REL, MAX_TIMEOUTS, False)

        self.oracle = self.mr.get_oracle()

        self.statistic = Statistic()
        self.generator = None
        self.last_time = time.time()
        self.start_time = time.time()
        self.first_status_bar_printed = False
        self.name = random_string()
        self.timeout_of_current_seed = 0

        init_logging("SMTMR", self.args.quiet, self.name, self.args)

    def process_seed(self, seed):
        if not admissible_seed_size(seed, self.args.file_size_limit):
            self.statistic.invalid_seeds += 1
            log_debug(f"Skip invalid seed: exceeds max file size: {self.args.file_size_limit}")
            return None

        self.currentseeds.append(pathlib.Path(seed).stem)
        script = translate_script_file(seed, silent=False)

        if not script:
            self.statistic.invalid_seeds += 1
            log_debug(f"Skipping invalid seed: error in translating script: {seed}")
            return None

        return script
    
    def get_script_group(self, seeds_tuples):
        seed_tuple = seeds_tuples.pop(random.randrange(len(seeds_tuples)))
        log_processing_seeds(seed_tuple)
        self.statistic.total_seeds += len(seed_tuple)
        self.currentseeds = []
        scripts = []
        for seed in seed_tuple:
            script = self.process_seed(seed)
            scripts.append(script)
        return scripts

    def max_timeouts_reached(self):
        if self.timeout_of_current_seed >= MAX_TIMEOUTS:
            return True
        return False

    def run(self):
        """
        Core fuzzing loop. The procedure: 
        1. fetches seeds at random from the seed corpus
        2. instantiates a mutator according to metamorphic relations
        3. generates `self.args.iterations` many iterations per seeds group.
        """
        seeds_tuples, index_in_tuple = get_seeds_tuples(self.args.SAT_SEEDS, self.args.UNSAT_SEEDS, self.mr, self.args.randomize)

        log_strategy_num_seeds(self.args.SOLVER_CLIS, seeds_tuples)

        while len(seeds_tuples) != 0:
            # TODO?
            # translate all script first 
            # store in a map
            # test memory usage
            scripts = self.get_script_group()
            # invalid script exisits
            for script in scripts:
                if not script:
                    continue
            # script1, _, script2, _ = self.get_script_pair(seeds)
            # if not script1 or not script2:
            #     continue
            self.mutator = Mutator(scripts, self.mr, self.args.method_path)

            # else:
            #     assert False

            log_generation_attempt(self.args.iterations)

            unsuccessful_gens = 0
            successful_gens = 0
            self.timeout_of_current_seed = 0
            for i in range(self.args.iterations):
                self.print_stats()
                mutant, success, skip_seed = self.mutator.mutate()

                # Reason for unsuccessful generation: randomness in the
                # mutator to more efficiently generate mutants.
                if not success:
                    self.statistic.unsuccessful_generations += 1
                    unsuccessful_gens += 1
                    continue  # Go to next iteration.

                successful_gens += 1

                # Reason for mutator to skip a seed: no random components, i.e.
                # mutant would be the same for all iterations and hence just
                # waste time.
                if skip_seed:
                    log_skip_seed_mutator(self.args.iterations, i)
                    break  # Continue to next seed.

                (mutate_further, scratchfile) = self.test(mutant, i + 1)
                if not mutate_further:  # Continue to next seed.
                    log_skip_seed_test(self.args.iterations, i)
                    break  # Continue to next seed.

                self.statistic.mutants += 1
                if not self.args.keep_mutants:
                    os.remove(scratchfile)

            log_finished_generations(successful_gens, unsuccessful_gens)

        self.terminate()

    def create_testbook(self, script):
        """
        Generate a "testbook" for script and solver configs.

        script:     Generated SMT-LIB Script object 
        :returns:   list containing with cli and testcases pairs
        """
        testbook = []
        testcase = "%s/%s-%s-%s.smt2" % (
            self.args.scratchfolder,
            escape("-".join(self.currentseeds)),
            self.name,
            random_string(),
        )
        with open(testcase, "w") as testcase_writer:
            testcase_writer.write(script.__str__())

        for cli in self.args.SOLVER_CLIS:
            testbook.append((cli, testcase))
        return testbook

    def test(self, script, iteration):
        """
        Tests the solvers on the provided script.
        Checks for crashes, segfaults, invalid models and soundness issues,
            ignores duplicates.
        Stores bug triggers in ./bugs along with .record files for bug reproduction.

        script:     Generated SMT-LIB Script Object
        iteration:  number of current iteration (used for logging)
        :returns:   continue or not (False if the testing on the script should be stopped
                    and True otherwise), scratchfile (generated script file)
        """
        testbook = self.create_testbook(script)
        scratchfile = None

        for testitem in testbook:
            # TODO
            # what if stop when all cli triggered bug or iteration stop
            solver_cli, scratchfile = testitem

            solver = Solver(solver_cli)
            self.statistic.solver_calls += 1
            stdout, stderr, exitcode = solver.solve(
                scratchfile, self.args.timeout
            )

            if self.max_timeouts_reached():
                return (False, scratchfile)

            # Match stdout and stderr against the crash list
            # which contains various crash messages
            # such as assertion errors, check failure, invalid models, etc.
            if in_crash_list(stdout, stderr):

                # Match stdout and stderr against the duplicate list
                # to prevent catching duplicate bug triggers.
                if not in_duplicate_list(stdout, stderr):
                    self.statistic.effective_calls += 1
                    self.statistic.crashes += 1
                    bug_script_path = self.report(
                        script, BugType.CRASH, solver_cli, stdout, stderr
                    )
                    log_crash_trigger(bug_script_path)
                else:
                    self.statistic.duplicates += 1
                    log_duplicate_trigger()
                # Find a crash (or duplicated) bug, Stop testing
                return (False, scratchfile)  
            else:
                # Check whether the solver call produced errors
                # by matching stdout and stderr against the ignore list
                if in_ignore_list(stdout, stderr):
                    log_ignore_list_mutant(solver_cli)
                    self.statistic.invalid_mutants += 1
                    continue  # Continue to the next solver.

                if exitcode != SUCCESS:
                    # Check whether the solver crashed with a segfault.
                    if exitcode == -signal.SIGSEGV or exitcode == SEGFAULT:
                        self.statistic.effective_calls += 1
                        self.statistic.crashes += 1
                        path = self.report(
                            script, BugType.SEGFAULT, solver_cli, stdout, stderr
                        )
                        log_segfault_trigger(self.args, path, iteration)
                        return False  # Stop testing.

                    # Check whether the solver timed out.
                    elif exitcode == TIMEOUT:
                        self.statistic.timeout += 1
                        self.timeout_of_current_seed += 1
                        log_solver_timeout(self.args, solver_cli, iteration)
                        continue  # Continue to the next solver.

                    # Check whether a "command not found" error occurred.
                    elif exitcode == COMMAND_NOT_FOUND:
                        continue  # Continue to the next solver.

                result = grep_result(stdout)
                # Check if the stdout contains a valid solver query result,
                if result.is_empty():
                    self.statistic.invalid_mutants += 1
                    log_invalid_mutant(self.args, iteration)
                    continue  # Continue to the next solver.
                else:
                    # Grep for '^sat$', '^unsat$', and '^unknown$' to produce
                    # the output (including '^unknown$' to also deal with
                    # incremental benchmarks) for comparing with the oracle
                    # for soundness bugs.
                    self.statistic.effective_calls += 1
                    # Comparing with the oracle (yinyang) or with other
                    # non-erroneous solver runs (opfuzz) for soundness bugs.
                    if not result.equals(self.oracle):
                        self.statistic.soundness += 1
                        # Produce a bug report if the query result differs from the pre-set oracle of mutant
                        path = self.report(
                            script, BugType.INCORRECT, solver_cli,
                            stdout, stderr
                        )
                        log_soundness_trigger(self.args.iterations, iteration, path)
                        return (False, scratchfile)  # Stop testing.

        return (True, scratchfile)  # Continue to next seed.

    def report(self, script, bugtype, cli, stdout, stderr):
        """
        Report a bug

        script: SMT-LIB script file which triggers the bug
        :return:
        """
        plain_cli = plain(cli)
        # bug filename format:
        # <{crash, wrong, invalid_model}><solver_cli><seeds>.<random-str>.<{smt2, record}>
        fn_format = "%s/%s-%s-%s-%s" % (
            self.args.bugsfolder,
            bugtype, 
            plain_cli,
            escape(list2str(self.currentseeds, separator='-')),
            random_string(),
        )

        report = fn_format + ".smt2"
        try:
            with open(report, "w") as report_writer:
                report_writer.write(script.__str__())
        except Exception:
            log_error("error: couldn't copy scratchfile to bugfolder.") 
            exit(ERR_EXHAUSTED_DISK)

        record = fn_format + ".record"
        try:
            with open(record, "w") as record_writer:
                record_writer.write(f"command: {cli}\nstderr:\n{stderr}stdout:\n{stdout}")
        except Exception:
            log_error("error: couldn't save recordfile to bugfolder.") 
            exit(ERR_EXHAUSTED_DISK)

        return report

    def check_bugs(self):
        if self.statistic.crashes + self.statistic.soundness == 0:
            exit(OK_NOBUGS)
        exit(OK_BUGS)

    def printsum_exit(self, quiet):
        if not quiet:
            self.statistic.printsum()
        self.check_bugs()
    
    def printbar(self):
        if not self.first_status_bar_printed\
           and time.time() - self.last_time >= 1:
            self.statistic.printbar(self.start_time)
            self.last_time = time.time()
            self.first_status_bar_printed = True

        if time.time() - self.last_time >= 2.0:
            self.statistic.printbar(self.start_time)
            self.last_time = time.time()

    def terminate(self):
        print("All seeds processed", flush=True)
        self.printsum_exit(self.args.quiet)

    def __del__(self):
        for fn in os.listdir(self.args.scratchfolder):
            if self.name in fn:
                os.remove(os.path.join(self.args.scratchfolder, fn))


