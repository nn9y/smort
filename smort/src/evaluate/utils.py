import re
import signal

from smort.config.configs import crash_list, duplicate_list, ignore_list
from smort.src.tools.utils import in_list
from smort.src.execute.returncodes import *
from smort.src.evaluate.testcodes import *
from smort.src.translate.smtmr.MetamorphicRelation import Status


def in_crash_list(stdout, stderr):
    return in_list(stdout, stderr, crash_list)


def in_duplicate_list(stdout, stderr):
    return in_list(stdout, stderr, duplicate_list)


def in_ignore_list(stdout, stderr):
    return in_list(stdout, stderr, ignore_list)


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


def evaluate_test(stdout, stderr, exitcode, oracle):
    if in_crash_list(stdout, stderr):
        if not in_duplicate_list(stdout, stderr):
            return TEST_CRASH
        else:
            return TEST_DUP
    else:
        if in_ignore_list(stdout, stderr):
            return TEST_IGNORE
        if exitcode != SUCCESS:
            if exitcode == -signal.SIGSEGV or exitcode == SEGFAULT:
                return TEST_SEGFAULT
            elif exitcode == TIMEOUT:
                return TEST_TIMEOUT
        result = grep_checksat_result(stdout)
        if result == None:
            return TEST_INVALID
        else:
            # a valid test
            if result != oracle:
                # soundness bug
                return TEST_SOUNDNESS
            return TEST_PASS