header = "fuzzer for SMT solvers using metamorphic relations"

usage = """usage: smtmr [-h] [-b path_to_folder] [-l path_to_folder] [-s path_to_folder]
             [-t seconds] [-k] [-q] [-n] [-L num_bytes] [-i <N>] [-r]
             solver_clients [path_to_file/folder ...] [path_to_file/folder ...]
             path_to_file
"""

short_description = """short

"""

long_description = """long

"""

options = """
options:
  -h, --help            show this help message and exit
  -b path_to_folder, --bugfolder path_to_folder
                        bugs found
  -l path_to_folder, --logfolder path_to_folder
                        tool logs
  -s path_to_folder, --scratchfolder path_to_folder
                        generated SMT-LIB mutant scratch files
  -t seconds, --timeout seconds
                        TODO
  -k, --keep-mutants    do not remove mutant scratch files
  -q, --quiet           do not print statistics and other output
  -n, --no-log          disable logging
  -L num_bytes, --file-size-limit num_bytes
                        file size limit on seed formula in bytes (default: 100000)
  -i <N>, --iterations <N>
                        num of iterations in each mutant generation
  -r, --randomize       randomize processing order of the seeds
"""