import sys
import argparse
from pathlib import Path

from smort.config.configs import file_size_limit
from smort.src.base.exitcodes import *


class ArgParser(argparse.ArgumentParser):
    def error(self, msg):
        self.exit(
            ERR_USAGE,
            f"error: {msg}\nFor a listing of options, use {self.prog} --help.\n"
        )


def add_args(parser, current_dir):
    parser.add_argument(
        "SOLVER_CLIS",
        metavar="solver_clis",
        help="SMT solver clis"
    )
    parser.add_argument(
        "METAMORPHIC_REL",
        nargs=1,
        metavar="path_to_file",
        help="SMTMR config file"
    )
    parser.add_argument(
        "--sat",
        nargs="*",
        metavar="path_to_file/folder",
        help="sat SMT-LIB files or folders"
    )
    parser.add_argument(
        "--unsat",
        nargs="*",
        metavar="path_to_file/folder",
        help="unsat SMT-LIB files or folders"
    )
    parser.add_argument(
        "-m",
        "--method_path",
        metavar="path_to_package",
        help="extended methods package"
    )
    parser.add_argument(
        "-b",
        "--bugfolder",
        metavar="path_to_folder",
        default=current_dir+"/bugs",
        help="bugs found"
    )
    parser.add_argument(
        "-l",
        "--logfolder",
        metavar="path_to_folder",
        default=current_dir+"/logs",
        help="tool logs"
    )
    parser.add_argument(
        "-s",
        "--scratchfolder",
        metavar="path_to_folder",
        default=current_dir+"/scratchs",
        help="generated SMT-LIB mutant scratch files"
    )
    # parser.add_argument(
    #     "-h",
    #     "--help",
    #     action="help",
    #     default=argparse.SUPPRESS,
    # )
    parser.add_argument(
        "-t",
        "--timeout",
        default=8,
        metavar="seconds",
        type=int,
        help="TODO"
    )
    parser.add_argument(
        "-k",
        "--keep-mutants",
        action="store_true",
        help="do not remove mutant scratch files"
    )
    parser.add_argument(
        "-q",
        "--quiet",
        action="store_true",
        help="do not print statistics and other output"
    )
    parser.add_argument(
        "-n",
        "--no-log",
        action="store_true",
        help="disable logging"
    )
    parser.add_argument(
        "-L",
        "--file-size-limit",
        metavar="num_bytes",
        default=file_size_limit,
        type=int,
        help=f"file size limit on seed formula in bytes (default: {file_size_limit})"
    )
    parser.add_argument(
        "-i",
        "--iterations",
        default=30,
        metavar="<N>",
        type=int,
        help="num of iterations in each mutant generation"
    )
    parser.add_argument(
        "-r",
        "--randomize",
        action='store_true',
        help="randomize processing order of the seeds"
    )
 

def build_parser(current_dir):
    parser = ArgParser(
        description="",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    add_args(parser, current_dir)

    return parser
