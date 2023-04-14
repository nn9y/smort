import os
import time
import logging
import random
import pathlib
import copy

from smort.src.tools.utils import random_string
from smort.src.sys.exitcodes import ERR_USAGE
from smort.src.report.Statistic import *
from smort.src.execute.Solver import Solver
from smort.src.execute.returncodes import * 
from smort.src.core.utils import * 
from smort.src.report.log import * 
from smort.src.report.report_bug import report_bug
from smort.src.execute.utils import create_test_list
from smort.src.evaluate.testcodes import * 
from smort.src.evaluate.utils import evaluate_test
from smort.src.translate.smtmr.translate import translate_mr_file
from smort.src.translate.smtlibv2.translate import translate_script_file
from smort.src.generate.Generator import Generator


class Tester:
    def __init__(self, args):
        self.args = args
        self.timeout_count_limit = self.args.iterations
        self.mr = translate_mr_file(self.args.MR_PATH, 10, False)
        if len(self.mr.methods) > 0 and (not self.args.methods_path):
            print("method declared in mr file, but no path to methods provided in command args")
            exit(ERR_USAGE)
        self.oracle = self.mr.get_oracle()
        self.statistic = Statistic()
        self.generator = None
        self.scripts = {}
        self.last_time = time.time()
        self.start_time = time.time()
        self.first_status_bar_printed = False
        self.name = random_string()
        self.timeout_of_current_seeds = 0

        config_logging("smort", self.args.quiet, self.name, self.args.logfolder)

    def process_seed(self, seed):
        if seed in self.scripts:
            script = self.scripts[seed]
        else:
            if not admissible_seed_size(seed, self.args.file_size):
                self.statistic.invalid_seeds += 1
                logging.debug(f"Skip invalid seed: exceeds max file size: {self.args.file_size}")
                return None
            script = translate_script_file(seed, 10, silent=False)
            script.merge_asserts()
            self.scripts[seed] = script
        self.currentseeds.append(pathlib.Path(seed).stem)

        if not script:
            self.statistic.invalid_seeds += 1
            logging.debug(f"Skipping invalid seed: error in translating script: {seed}")
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

    def run_test(self):
        """
        Core testing loop: 
        1. fetches seeds group at random from the seed corpus
        2. instantiates a generator according to metamorphic relations
        3. generates `self.args.iterations` many iterations per seeds group.
        """
        seeds_tuples = get_seeds_tuples(self.args.sat_seeds, self.args.unsat_seeds, self.mr, self.args.randomize)
        log_num_targets_seeds(self.args.SOLVER_CMDS, seeds_tuples)

        while len(seeds_tuples) != 0:
            scripts = self.get_script_group(seeds_tuples)
            for script in scripts:
                if not script:
                    continue

            self.generator = Generator(scripts, self.mr, self.args)
            if (len(self.generator.valid_index_list) == 0) and (len(self.mr.methods) == 0):
                log_iterations_attempt(0)
            else:
                log_iterations_attempt(self.args.iterations)

                solver_cmds = copy.deepcopy(self.args.SOLVER_CMDS)
                self.timeout_of_current_seeds = 0
                total_iterations = 0
                total_generations = 0
                for i in range(self.args.iterations):
                    self.printbar()
                    generate_further = True
                    end_iteration = False
                    gens = 0
                    while not end_iteration:
                        morph, end_iteration = self.generator.generate()
                        gens += 1
                        total_generations += 1
                        generate_further, testfile = self.test(solver_cmds, morph, i+1, gens)
                        if (len(solver_cmds) == 0) or (not generate_further):
                            log_skip_seeds_group(self.args.iterations, i+1, gens)
                            break
                        self.statistic.morphs += 1
                        if not self.args.keep_morphs and testfile:
                            os.remove(testfile)
                    total_iterations += 1
                    if not generate_further:
                        # break outer loop
                        break

                log_finished_iterations(total_iterations)
                log_finished_generations(total_generations)

        self.terminate()
    
    def test(self, solver_cmds, script, iteration, generation):
        """
        Tests the solvers on the provided script.
        Checks for crashes, segfaults, invalid models and soundness issues, ignores duplicates.
        Stores bug triggers in ./bugs along with .record files for bug reproduction.

        :returns:   continue generating morphs using current seeds, testfile (generated script file)
        """
        test_list = create_test_list(script, solver_cmds, self.args.testfolder, self.currentseeds, self.name)
        testfile = None
        for solver_cmd, testfile in test_list:
            # execute testing
            solver = Solver(solver_cmd)
            self.statistic.solver_calls += 1
            stdout, stderr, exitcode = solver.solve(
                testfile, self.args.timeout
            )
            # evaluate testing
            testcode = evaluate_test(stdout, stderr, exitcode, self.oracle)
            if testcode == TEST_CRASH:
                self.statistic.effective_calls += 1
                self.statistic.crashes += 1
                path = report_bug(
                    script, self.args.bugfolder, 'crash', solver_cmd, self.currentseeds, stdout, stderr
                )
                solver_cmds.remove(solver_cmd)
                log_bug_trigger('Crash', self.args.iterations, iteration, generation, path)
                return (True, testfile)  
            elif testcode == TEST_DUP:
                self.statistic.duplicates += 1
                log_duplicate_trigger()
                return (False, testfile)  
            elif testcode == TEST_IGNORE:
                self.statistic.invalid_morphs += 1
                log_ignore_morph(solver_cmd)
            elif testcode == TEST_SEGFAULT:
                self.statistic.effective_calls += 1
                self.statistic.crashes += 1
                path = report_bug(
                    script, self.args.bugfolder, 'segfault', solver_cmd, self.currentseeds, stdout, stderr
                )
                solver_cmds.remove(solver_cmd)
                log_bug_trigger('Segfault', self.args.iterations, iteration, generation, path)
                return (True, testfile)
            elif testcode == TEST_TIMEOUT:
                self.statistic.timeout += 1
                self.timeout_of_current_seeds += 1
                log_solver_timeout(self.args, solver_cmd, iteration, generation)
                if self.timeout_of_current_seeds >= self.timeout_count_limit:
                    return (False, testfile)
            elif testcode == TEST_INVALID:
                self.statistic.invalid_morphs += 1
                log_invalid_test(self.args, iteration, generation)
            elif testcode == TEST_SOUNDNESS:
                self.statistic.effective_calls += 1
                self.statistic.soundness += 1
                path = report_bug(
                    script, self.args.bugfolder, 'soundness', solver_cmd, self.currentseeds, stdout, stderr
                )
                log_bug_trigger('Soundness', self.args.iterations, iteration, generation, path)
                solver_cmds.remove(solver_cmd)
                return (True, testfile)  # Stop testing.
            elif testcode == TEST_PASS:
                self.statistic.effective_calls += 1

        return (True, testfile)

    def printsummary_exit(self, quiet):
        if not quiet:
            self.statistic.printsummary()
        self.statistic.check_bugs()
    
    def printbar(self):
        if not self.first_status_bar_printed\
           and time.time() - self.last_time >= 1:
            self.statistic.printbar()
            self.last_time = time.time()
            self.first_status_bar_printed = True

        if time.time() - self.last_time >= 2.0:
            self.statistic.printbar()
            self.last_time = time.time()

    def terminate(self):
        print("All seeds groups processed", flush=True)
        self.printsummary_exit(self.args.quiet)

    def __del__(self):
        for fn in os.listdir(self.args.testfolder):
            if self.name in fn:
                os.remove(os.path.join(self.args.testfolder, fn))



