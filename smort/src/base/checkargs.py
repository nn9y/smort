from pathlib import Path

from smort.config.configs import *
from smort.src.base.exitcodes import ERR_USAGE
from smort.src.base.utils import create_folder, get_seeds

path = Path(__file__)
srcdir = str(path.parent.absolute().parent)

#sys.path.insert(1, os.getcwd() + "/.smtmr")

def check_solver_clis(solver_clis):
    solver_clis = [] 
    if solver_clis == "":
        if len(solvers) == 0:
            print("error: no solver specified", flush=True)
            exit(ERR_USAGE)
        solver_clis = solvers
    else:
        solver_clis = solver_clis.split(";") + solvers
    return solver_clis


def check_timeout(timeout):
    if timeout <= 0:
        print("error: timeout should be a positive number",
              flush=True)
        exit(ERR_USAGE)


def check_iterations(iterations):
    if iterations <= 0:
        print("error: iterations should be a positive number",
              flush=True)
        exit(ERR_USAGE)


def run_checks(parser):
    args = parser.parse_args()
    if not (args.SAT_SEEDS or args.UNSAT_SEEDS):
        parser.error("no seed file/folder specified")

    args.SOLVER_CLIS = check_solver_clis(args.SOLVER_CLIS)
    check_timeout(args.timeout)
    check_iterations(args.iterations)
    folder_path_list = [args.bugfolder, args.logfolder, args.scratchfolder]
    for folder_path in folder_path_list:
        create_folder(folder_path)
    args.SAT_SEEDS = get_seeds(args.SAT_SEEDS)
    args.UNSAT_SEEDS = get_seeds(args.UNSAT_SEEDS)

    return args
