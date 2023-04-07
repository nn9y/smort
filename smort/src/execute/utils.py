import re

from smort.src.translate.smtmr.MetamorphicRelation import Status


def grep_checksat_result(stdout):
    """
    Grep the check-sat result from the stdout of a solver.
    """
    for line in stdout.splitlines():
        if re.search("^unsat$", line, flags=re.MULTILINE):
            return Status.UNSAT
        elif re.search("^sat$", line, flags=re.MULTILINE):
            return Status.SAT
        elif re.search("^unknown$", line, flags=re.MULTILINE):
            return Status.UNKNOWN
    return None