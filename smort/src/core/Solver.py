import subprocess

from smort.src.base.exitcodes import ERR_USAGE
from smort.src.core.returncodes import *
from smort.src.translate.smtmr.MetamorphicRelation import Status


class SolverResult:
    """
    Class to store the result of multiple solver check-sat queries.
    **Reserved for incremental benchmarks**
    :res_list a list of multiple "Status" items
    """

    def __init__(self, result=None):
        self.res_list = []
        if result:
            self.res_list.append(result)
    
    def is_empty(self):
        return len(self.res_list) == 0 

    def append(self, result):
        self.res_list.append(result)

    def equals(self, rhs):
        if isinstance(rhs, Status):
            # TODO
            #return (len(self.res_list) == 1) and (self.res_list[0] == rhs)
            return self.res_list[-1] == rhs
        if isinstance(rhs, SolverResult):
            if len(self.res_list) != len(rhs.res_list):
                return False
            for index in range(0, len(self.res_list)):
                if (
                    (self.res_list[index] != Status.UNKNOWN)
                    and (rhs.res_list[index] != Status.UNKNOWN)
                    and (self.res_list[index] != rhs.res_list[index])
                ):
                    return False
            return True
        return False

    def __str__(self):
        return "\n".join([r.value for r in self.res_list])
    
    def __repr__(self):
        return self.__str__()


class Solver:
    """
    Class to call SMT solvers 
    :client a string of solver client command with command line arguments 
    """

    def __init__(self, client):
        self.client = client 

    def solve(self, file, timeout, debug=False):
        try:
            cmd = self.client.split(" ") + [file]
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
