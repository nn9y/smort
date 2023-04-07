from smort.src.tools.utils import escape, random_string
from smort.src.execute.Solver import Solver


def create_test_list(script, cmds, folder, seeds, name):
    """
    Generate tests for script and solver configs.
    """
    test_list = []
    testcase = "%s/%s-%s-%s.smt2" % (
        folder,
        escape("-".join(seeds)),
        name,
        random_string(),
    )
    with open(testcase, "w") as testcase_writer:
        testcase_writer.write(script.__str__())

    for cmd in cmds:
        test_list.append((cmd, testcase))
    return test_list

