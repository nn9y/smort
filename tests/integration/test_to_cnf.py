from smort.src.translate.smtlibv2.Script import *
from smort.src.translate.smtlibv2.cnf_conversion import *
from smort.src.translate.smtlibv2.translate import translate_script_file


def visit_term(term, occs):
    if id(term) not in occs:
        occs.append(id(term))
    for s in term.subterms:
        if id(s) in occs:
            print('---')
            print(f"IN:{term} -> {s}")
            print('---')
        visit_term(s, occs)


file_path = '/home/yang/Projects/yinyang/semantic-fusion-seeds/BV/sat/177.smt2'

script = translate_script_file(file_path, 100)
print(script)

occs = []
for cmd in script.commands:
    if isinstance(cmd, Assert):
        term = cmd.term
        for c in term.clauses:
            for l in c.literals:
                visit_term(l, occs)

