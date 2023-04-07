import subprocess

from smort.src.sys.exitcodes import ERR_USAGE
from smort.src.execute.returncodes import *


class Solver:
    def __init__(self, cmd):
        # command
        self.cmd = cmd 

    def solve(self, file, timeout, debug=False):
        stdout = ""
        stderr = ""
        try:
            cmd = self.cmd.split(" ") + [file]
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
            return stdout, stderr, TIMEOUT 

        except ValueError:
            return stdout, stderr, SUCCESS 

        except FileNotFoundError:
            print(f"error: solver '{cmd[0]}' not found", flush=True)
            exit(ERR_USAGE)

        stdout = output.stdout.decode()
        stderr = output.stderr.decode()
        returncode = output.returncode

        if debug:
            print(f"output: {stdout}\n{stderr}")

        return stdout, stderr, returncode
