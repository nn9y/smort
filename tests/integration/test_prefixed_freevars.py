from smort.src.translate.smtlibv2.translate import *
from smort.src.translate.smtlibv2.Script import *


def print_term_free_vars(t, f):
    f.write(f"term={t}, bound_vars={t.bound_vars}, local_free_vars={t.local_free_vars}\n\n")
    for s in t.subterms:
        print_term_free_vars(s, f)

def test_prefixed_freevars(f):
    file = '/home/yang/Projects/smort/tests/testcases/testnia/sat/1.smt2'
    script = translate_script_file(file, 10000000)
    script.merge_asserts()
    script.prefix_sigs('seed_')
    print_term_free_vars(script.assert_merged.term, f) 



if __name__ == '__main__':
    file = open('/home/yang/Projects/smort/tests/results/test_prefixed_freevars.txt', 'w')
    test_prefixed_freevars(file)
    file.close()