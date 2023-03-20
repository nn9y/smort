import random
import re
import pathlib

from smort.config.configs import crash_list, duplicate_list, ignore_list
from smort.src.base.utils import in_list, cartesian_product
from smort.src.core.Solver import SolverResult
from src.translate.smtmr.MetamorphicRelation import Status


def in_crash_list(stdout, stderr):
    return in_list(stdout, stderr, crash_list)


def in_duplicate_list(stdout, stderr):
    return in_list(stdout, stderr, duplicate_list)


def in_ignore_list(stdout, stderr):
    return in_list(stdout, stderr, ignore_list)


def admissible_seed_size(seed, file_size_limit):
    """
    Checks if seed size is below file_size_limit.
    :returns: True if that is the case and False otherwise.
    """
    seed_size_in_bytes = pathlib.Path(seed).stat().st_size
    if seed_size_in_bytes >= file_size_limit:
        return False
    return True


def grep_result(stdout):
    """
    Grep the query result from the stdout of a solver.
    """
    result = SolverResult()
    for line in stdout.splitlines():
        if re.search("^unsat$", line, flags=re.MULTILINE):
            result.append(Status.UNSAT)
        elif re.search("^sat$", line, flags=re.MULTILINE):
            result.append(Status.SAT)
        elif re.search("^unknown$", line, flags=re.MULTILINE):
            result.append(Status.UNKNOWN)
    return None 


def get_seeds_tuples(sat_seeds_path, unsat_seeds_path, mr, randomize=False):
    """
    Get cartesian product of seeds' alternative list according to seeds' statisfiability 
    :returns: list of seeds tuples, index of seed symbol in each tuple
    """
    seeds_alter_list = []
    idx = 0
    index_in_tuple = {}
    sat_count = 0
    unsat_count = 0
    for symbol, status in mr.seeds.items():
        if status == Status.SAT:
            seeds_alter_list.append(sat_seeds_path)
            sat_count += 1
        elif status == Status.UNSAT:
            seeds_alter_list.append(unsat_seeds_path)
            unsat_count += 1
        else:
            print("TODO")
            assert False
        index_in_tuple[symbol] = idx
        idx += 1
    
    if sat_count > len(sat_seeds_path):
        print("TODO")
        assert False
    if unsat_count > len(unsat_seeds_path):
        print("TODO")
        assert False

    seeds_tuples = cartesian_product(*seeds_alter_list) 

    if randomize:
        random.shuffle(seeds_tuples)

    return seeds_tuples, index_in_tuple


# def init_oracle(args):
#     """
#     Initialize the oracle. For SemanticFusion the oracle is either sat or
#     unsat. For TypeAwareOpMutation the oracle is unknown
#     """
#     if args.oracle == "unknown":
#         return SolverResult(SolverQueryResult.UNKNOWN)
#     elif args.oracle == "sat":
#         return SolverResult(SolverQueryResult.SAT)
#     elif args.oracle == "unsat":
#         return SolverResult(SolverQueryResult.UNSAT)
#     assert False
