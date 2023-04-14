import random
import copy

from smort.src.translate.tools.Term import(
    Var,
    Expr
)
from smort.src.translate.theory.SMTLIBv2Sorts import (
    BOOL,
    INT,
    REAL,
    STRING,
)
from smort.src.translate.theory.SMTLIBv2Theories import (
    BOOLEAN_NOT,
    BOOLEAN_AND,
    BOOLEAN_OR,
    BOOLEAN_IMPLIES,
    BOOLEAN_XOR,
)
from smort.src.translate.theory.constants import random_constant_value

from extensions.operators import *



def live_predicate_injection_over(formulas):
    return live_predicate_injection(formulas, BOOLEAN_OR)


def live_predicate_injection_under(formulas):
    return live_predicate_injection(formulas, BOOLEAN_AND)


def live_predicate_injection(formulas, op):
    formula = formulas[0]
    available_sorts = list(support_sorts & formula.global_sorts)
    if len(available_sorts) == 0:
        return formula[0]
    processed_formula = copy.deepcopy(formula)
    cnf_term = processed_formula.assert_merged.term
    for i, c in enumerate(cnf_term.clauses):
        for j, l in enumerate(c.literals):
            sort = random.choice(available_sorts)
            phi = generate_formula_sinppet(processed_formula, sort)
            literal = Expr(
                name=op,
                subterms=[l, phi],
                sort=BOOL
            )
            cnf_term.clauses[i].literals[j].__dict__ = copy.deepcopy(literal.__dict__)
    return processed_formula


def generate_formula_sinppet(formula, sort):
    op = random.choice([
        None,
        BOOLEAN_NOT,
        BOOLEAN_AND,
        BOOLEAN_OR,
        BOOLEAN_IMPLIES,
        BOOLEAN_XOR,
    ])
    if not op:
        return generate_atom(formula, sort)
    elif op == BOOLEAN_NOT:
        l = generate_atom(formula, sort)
        return Expr(name=op, subterms=[l], sort=BOOL)
    else:
        l1 = generate_atom(formula, sort)
        l2 = generate_atom(formula, sort)
        return Expr(name=op, subterms=[l1, l2], sort=BOOL)


def generate_atom(formula, sort):
    if sort == INT:
        choices = INT_COMPARE_OPERATORS
    if sort == REAL:
        choices = REAL_COMPARE_OPERATORS
    if sort == STRING:
        choices = STRING_COMPARE_OPERATORS
    else:
        choices = []
    op = random.choice(choices)
    t1 = generate_term(formula, sort)
    t2 = generate_term(formula, sort)
    return Expr(
        name=op,
        subterms=[t1, t2],
        sort=BOOL,
    )


def generate_term(formula, sort):
    if sort == INT:
        choices = INT_ARITH_OPERATORS
    if sort == REAL:
        choices = REAL_ARITH_OPERATORS
    if sort == STRING:
        choices = STRING_ARITH_OPERATORS
    else:
        choices = []
    op = random.choice(choices)
    v1 = random_select_from_global_vars(formula.global_vars, sort) 
    if logic_is_linear(formula.logic) and is_linear_operator(op, sort):
        v2 = random_constant_value(sort) 
    else:
        v2 = random_select_from_global_vars(formula.global_vars, sort)
    return Expr(
        name=op,
        subterms=[v1, v2],
        sort=sort,
    )


def random_select_from_global_vars(global_vars, sort):
    choices = [var for var, var_sort in global_vars.items() if var_sort == sort]
    var_id = Identifier(random.choice(choices))
    return Var(
        name=var_id,
        sort=sort,
        global_free=True
    )


def logic_is_linear(logic: str):
    return 'L' in logic


def is_linear_operator(op, sort):
    if sort == INT:
        return op in LINEAR_INT_ARITH_OPERATORS
    if sort == REAL:
        return op in LINEAR_REAL_ARITH_OPERATORS
    else:
        return True

