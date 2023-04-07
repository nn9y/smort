import argparse

from smort.src.tools.escapes import WARNING, NOTICE, NC
from smort.config.configs import filesize, iterations, timeout
from smort.src.sys.exitcodes import *


class ArgParser(argparse.ArgumentParser):
    def error(self, msg):
        self.exit(
            ERR_USAGE,
            f"error: {msg}\nFor a listing of options, use {self.prog} --help.\n"
        )



def add_args(arg_parser, current_dir):
    """
    current_dir: directory where the tool is invoked
    """
    # positional parameters
    arg_parser.add_argument(
        "SOLVER_CLIS",
        metavar="solver_clis",
        help="SMT solver commands, separated by ';'"
    )
    arg_parser.add_argument(
        "MR_PATH",
        metavar="path_to_file",
        help="SMTMR config file"
    )
    # keyword parameters
    arg_parser.add_argument(
        "--sat-seeds",
        nargs="*",
        metavar="path_to_files/folders",
        help="sat SMTLIBv2 files or folders"
    )
    arg_parser.add_argument(
        "--unsat-seeds",
        nargs="*",
        metavar="path_to_files/folders",
        help="unsat SMTLIBv2 files or folders"
    )
    arg_parser.add_argument(
        "-m",
        "--method-path",
        metavar="path_to_folder",
        help="extended methods package"
    )
    arg_parser.add_argument(
        "-b",
        "--bugfolder",
        metavar="path_to_folder",
        default=current_dir+"/bugs",
        help="bug reports (default: <current_dir>/bugs/)"
    )
    arg_parser.add_argument(
        "-l",
        "--logfolder",
        metavar="path_to_folder",
        default=current_dir+"/logs",
        help="log files (default: <current_dir>/logs/)"
    )
    arg_parser.add_argument(
        "-s",
        "--scratchfolder",
        metavar="path_to_folder",
        default=current_dir+"/scratchs",
        help="SMTLIBv2 files of generated test cases (default: <current_dir>/scratchs/)"
    )
    # arg_parser.add_argument(
    #     "-h",
    #     "--help",
    #     action="help",
    #     default=argparse.SUPPRESS,
    # )
    arg_parser.add_argument(
        "-mt",
        "--multiple-templates",
        action="store_true",
        help="generate multiple templates in one generation"
    )
    arg_parser.add_argument(
        "-ms",
        "--multiple-substs",
        action="store_true",
        help="generate multiple substitutions in one generation"
    )
    arg_parser.add_argument(
        "-in",
        "--incremental",
        action="store_true",
        help=f"generate morphs incrementally in one iteration. {WARNING}If this option is enabled, '-mt' and '-ms' are enabled automatically{NC}"
    )
    # arg_parser.add_argument(
    #     "-rf",
    #     "--refind",
    #     action="store_true",
    #     help=f"re-find terms that can be replaced in each generation. {NOTICE}If the '-in' option is disabled, this option is ignored{NC}"
    # )
    arg_parser.add_argument(
        "-i",
        "--iterations",
        default=iterations,
        metavar="<N>",
        type=int,
        help=f"number of iterations for each seed formula tuple (default: {iterations})"
    )
    arg_parser.add_argument(
        "-t",
        "--timeout",
        default=timeout,
        type=int,
        metavar="seconds",
        help="timeout limit of an SMT solver on each test case"
    )
    arg_parser.add_argument(
        "-k",
        "--keep-morphs",
        action="store_true",
        help="do not remove temporary scratch files"
    )
    arg_parser.add_argument(
        "-q",
        "--quiet",
        action="store_true",
        help="do not print statistics and other output"
    )
    arg_parser.add_argument(
        "-nl",
        "--no-log",
        action="store_true",
        help="disable logging"
    )
    arg_parser.add_argument(
        "-fs",
        "--file-size",
        metavar="num_of_bytes",
        default=filesize,
        type=int,
        help=f"file size limit on seed formula in bytes (default: {filesize})"
    )
    arg_parser.add_argument(
        "-r",
        "--randomize",
        action='store_true',
        help="randomize processing order of the seed tuples"
    )


def build_argparser(current_dir):
    arg_parser = ArgParser(
        description="",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        #add_help=False,
    )
    add_args(arg_parser, current_dir)

    return arg_parser
