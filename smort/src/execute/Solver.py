import subprocess

from smort.src.sys.exitcodes import ERR_USAGE
from smort.src.execute.returncodes import *
from smort.src.translate.smtmr.MetamorphicRelation import Status


class Solver:
    """
    Class to call SMT solvers 
    """

    def __init__(self, cli):
        # command
        self.cli = cli 

    def solve(self, file, timeout, debug=False):
        try:
            cmd = self.cli.split(" ") + [file]
            if debug:
                print("cmd: " + " ".join(cmd), flush=True)
            output = subprocess.run(
                cmd,
                timeout=timeout,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                shell=False,
            )

        except subprocess.TimeoutExpired as te:
            if te.stdout and te.stderr:
                stdout = te.stdout.decode()
                stderr = te.stderr.decode()
            else:
                stdout = ""
                stderr = ""
            return stdout, stderr, TIMEOUT 

        except ValueError:
            stdout = ""
            stderr = ""
            return stdout, stderr, SUCCESS 

        except FileNotFoundError:
            print(f'error: solver "{cmd[0]}" not found', flush=True)
            exit(ERR_USAGE)

        stdout = output.stdout.decode()
        stderr = output.stderr.decode()
        returncode = output.returncode

        if debug:
            print(f"output: {stdout}\n{stderr}")

        return stdout, stderr, returncode
