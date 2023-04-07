import random
import pathlib

from smort.src.sys.exitcodes import ERR_USAGE
from smort.src.tools.utils import cartesian_product
from smort.src.translate.smtmr.MetamorphicRelation import Status


def admissible_seed_size(seed, file_size):
    """
    Checks if seed size is below file_size.
    :returns: True if that is the case and False otherwise.
    """
    seed_size_in_bytes = pathlib.Path(seed).stat().st_size
    if seed_size_in_bytes >= file_size:
        return False
    return True


def get_seeds_tuples(sat_seed_paths, unsat_seed_paths, mr, randomize=False):
    """
    Get cartesian product of seeds' alternative list according to seeds' statisfiability 
    :returns: list of seeds tuples, index of seed symbol in each tuple
    """
    seeds_alter_list = []
    sat_seeds = 0
    unsat_seeds = 0
    for status in mr.seed_status_list:
        if status == Status.SAT:
            seeds_alter_list.append(sat_seed_paths)
            sat_seeds += 1
        elif status == Status.UNSAT:
            seeds_alter_list.append(unsat_seed_paths)
            unsat_seeds += 1
        else:
            print(f"unsupported status '{status}'")
            exit(ERR_USAGE)

    seeds_tuples = cartesian_product(*seeds_alter_list) 

    sat_seeds_len = len(sat_seed_paths) if sat_seed_paths else 0
    unsat_seeds_len = len(unsat_seed_paths) if unsat_seed_paths else 0

    if sat_seeds > sat_seeds_len:
        print(f"number of sat files provided is less than minimum requirements")
        exit(ERR_USAGE)
    if unsat_seeds > unsat_seeds_len:
        print(f"number of unsat files provided is less than minimum requirements")
        exit(ERR_USAGE)

    if randomize:
        random.shuffle(seeds_tuples)

    return seeds_tuples
