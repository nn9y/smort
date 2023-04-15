from smort.src.translate.smtlibv2.translate import *
from smort.src.translate.smtlibv2.Script import *


def test_prefix():
    file = '/home/yang/Projects/smort/tests/testcases/testprefix/0.smt2'
    script = translate_script_file(file, 10000000)
    script.prefix_sigs('seed1_')
    print(script)


if __name__ == '__main__':
    test_prefix()