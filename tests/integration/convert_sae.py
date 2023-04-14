import sys
import copy

from smort.src.translate.smtmr.translate import *
from smort.src.translate.tools.Term import *
from smort.src.translate.theory.SMTLIBv2Theories import *


def main(argv):
    sat_mr = translate_mr_file(argv[1], 10, False)
    unsat_mr = copy.deepcopy(sat_mr)
    for subst_template in unsat_mr.subst_templates:
        term, repl = subst_template.repl_pairs[0]
        revert_not(term, repl)
    print(unsat_mr)


def revert_not(term, repl):
    if term.term_type == TermType.EXPR and term.name == BOOLEAN_NOT:
        term.__dict__ = copy.deepcopy(term.subterms[0].__dict__)
        repl.__dict__ = copy.deepcopy(repl.subterms[0].__dict__)
    else:
        not_term = Expr(
            name=BOOLEAN_NOT,
            subterms=[term],
            sort=BOOL
        )
        term.__dict__ = copy.deepcopy(not_term.__dict__)
        not_repl = Expr(
            name=BOOLEAN_NOT,
            subterms=[term],
            sort=BOOL
        )
        repl.__dict__ = copy.deepcopy(not_repl.__dict__)


if __name__ == "__main__":
    main(sys.argv)