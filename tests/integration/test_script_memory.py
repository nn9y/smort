import sys

from smort.src.translate.smtlibv2.translate import *


filename = '/home/yang/Projects/smort/tests/testcases53.smt2'
script = translate_script_file(filename, 100)

print(sys.getsizeof(script))