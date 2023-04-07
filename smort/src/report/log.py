import logging
import datetime

from logging.handlers import RotatingFileHandler

from smort.src.tools.utils import list2str
from smort.src.tools.escapes import BOLD, WARNING, NOTICE, NC 


def config_logging(prefix, quiet_mode, name, folder, max_bytes=2048, backup_count=10):
    # logfile
    time = datetime.datetime.now().strftime(prefix + "-%Y-%m-%d-%H:%M:%S")
    #filename = f"{folder}/{time}-{name}.log"
    filename = f"{folder}/{time}.log"
    logformat = "%(asctime)s %(levelname)s: %(message)s"
    dateformat = "[%Y-%m-%d %H:%M:%S]"
    logging.basicConfig(
        handlers=[
            RotatingFileHandler(filename=filename,
                                maxBytes=max_bytes, backupCount=backup_count)
        ],
        format=logformat,
        datefmt=dateformat,
        level=logging.DEBUG,    # all levels
    )

    if not quiet_mode:
        # also log to console
        console = logging.StreamHandler()
        formatter = logging.Formatter(
            fmt=logformat, datefmt=dateformat
        )
        console.setLevel(logging.INFO)  # do not print DEBUG log to console 
        console.setFormatter(formatter)
        logging.getLogger().addHandler(console)


def log_num_targets_seeds(targets, seeds_tuples): 
    logging.info(
        f"{len(targets)} testing targets, {len(seeds_tuples)} seeds groups"
    )


def log_processing_seeds(seeds_tuple):
    logging.debug(f"Processing seed {list2str(seeds_tuple, separator=', ')}.")


def log_iterations_attempt(iterations):
    logging.debug(
        f"Attempting to execute {iterations} iterations of morphs generating."
    )


def log_finished_iterations(iterations):
    logging.debug(
        f"Iterations finished: {iterations}."
    )


def log_finished_generations(generations):
    logging.debug(
        f"Generations finished: {generations}."
    )


def log_bug_trigger(trigger_type, iterations, i, g, path=None):
    logging.debug(
        f"In {i}/{iterations}, #{g}: {trigger_type}! Stop testing on this seeds group."
    )
    logging.info(f"{BOLD}{WARNING}Detected {trigger_type} bug! {path}{NC}")


def log_duplicate_trigger():
    # TODO
    # duplicated?
    logging.debug("Duplicate. Stop testing on this seed.")


def log_ignore_morph(solver_cmd):
    logging.debug(f"Invalid morph: in ignore list. command: {solver_cmd}")


def log_solver_timeout(iterations, solver_cmd, i, g):
    logging.debug(
        f"In {i}/{iterations}, #{g}: Solver timeout occurred. command: {solver_cmd}"
    )


def log_invalid_test(iterations, i, g):
    logging.debug(
        f"In {i}/{iterations}, #{g} Invalid morph: no result of (check-sat) in output."
    )
    logging.info(f"{BOLD}{NOTICE}Invalid morph: no result of (check-sat) in output{NC}")


def log_skip_seeds_group(iterations, i, g):
    logging.debug(
        f"In {i}/{iterations}, #{g} skip the seeds group, stop generating."
    )
