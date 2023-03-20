import logging
import datetime

from logging.handlers import RotatingFileHandler

from smort.src.base.utils import list2str

RED = "\033[91m"
BOLD = "\033[1m"
WARNING = "\033[91m"
ENDC = "\033[0m"


def init_logging(prefix, quiet_mode, name, args, max_bytes=1024*1024, backup_count=5):
    filename = (
        args.logfolder
        + "/"
        +
        datetime.datetime.now().strftime(prefix + "-%Y-%m-%d-%M:%S-%p")
        + "-"
        + str(name)
        + ".log"
    )
    logging.basicConfig(
        handlers=[
            RotatingFileHandler(filename=filename,
                                maxBytes=max_bytes, backupCount=backup_count)
        ],
        format="%(asctime)s %(message)s",
        datefmt="[%Y/%m/%d %I:%M:%S %p]",
        level=logging.DEBUG,
    )

    if not quiet_mode:
        console = logging.StreamHandler()
        formatter = logging.Formatter(
            "%(asctime)s %(message)s", datefmt="[%Y/%m/%d %I:%M:%S %p]"
        )
        console.setLevel(logging.INFO)  # INFO WARNING ERROR CRITICAL
        console.setFormatter(formatter)
        logging.getLogger().addHandler(console)


def log_num_targets_seeds(targets, seeds_tuples): 
    logging.info(
        f"{len(targets)} testing targets, {len(seeds_tuples)} seeds tuples"
    )


def log_processing_seeds(seeds_tuple):
    logging.debug(f"Processing seed {list2str(seeds_tuple, 1, ', ')}")


def log_generation_attempt(iterations):
    logging.debug(
        f"Attempting to generate {iterations} mutants"
    )


def log_finished_generations(successful_gens, unsuccessful_gens):
    logging.debug(
        f"Finished generations: {successful_gens} successful, \
{unsuccessful_gens} unsuccessful"
    )


def log_soundness_trigger(iterations, i, path):
    logging.debug(
        f"{i}/{iterations} Soundness bug! Stop testing on this seed."
    )
    logging.info(BOLD + WARNING + "Detected soundness bug! " + path + ENDC)


def log_crash_trigger(path):
    logging.debug("Crash! Stop testing on this seed.")
    logging.info(BOLD + WARNING + "Detected crash bug: " + path + ENDC)


def log_duplicate_trigger():
    logging.debug("Duplicate. Stop testing on this seed.")


def log_segfault_trigger(iterations, path, i):
    logging.debug(
        f"{i}/{iterations} Segfault! Stop testing on this seed."
    )
    logging.info(BOLD + WARNING + "Detected segfault: " + path + ENDC)


def log_ignore_list_mutant(solver_client):
    logging.debug(f"Invalid mutant:ignore_list. solver={solver_client}")


def log_solver_timeout(iterations, solver_client, i):
    logging.debug(
        f"{i}/{iterations}  Solver timeout occurred. solver={solver_client}"
    )


def log_invalid_mutant(iterations, i):
    logging.debug(
        f"{i}/{iterations} Invalid mutant:no '^sat$' or '^unsat$' in output."
    )


def log_skip_seed_mutator(iterations, i):
    logging.debug(
        f"{i}/{iterations} Mutator indicated to skip the seed."
    )


def log_skip_seed_test(iterations, i):
    logging.debug(
        f"{i}/{iterations} Fuzzer::test indicated to skip the seed."
    )


def log_debug(msg):
    logging.debug(msg)


def log_error(msg):
    logging.error(msg)
