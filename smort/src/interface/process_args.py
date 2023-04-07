from smort.config.configs import *
from smort.src.sys.exitcodes import ERR_USAGE
from smort.src.sys.utils import create_folder, get_all_seed_files 


def check_solver_clis(solver_clis):
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


def check_incremental(args):
    if args.incremental:
        args.multiple_templates = True 
        args.multiple_substs = True 


def process(arg_parser):
    args = arg_parser.parse_args()
    if not (args.sat_seeds or args.unsat_seeds):
        arg_parser.error("no seed file/folder specified")

    args.SOLVER_CLIS = check_solver_clis(args.SOLVER_CLIS)
    check_timeout(args.timeout)
    check_iterations(args.iterations)
    check_incremental(args)
    folder_path_list = [args.bugfolder, args.logfolder, args.scratchfolder]
    for folder_path in folder_path_list:
        create_folder(folder_path)
    args.sat_seeds = get_all_seed_files(args.sat_seeds)
    args.unsat_seeds = get_all_seed_files(args.unsat_seeds)

    return args
