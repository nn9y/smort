import copy

from smort.src.tools.utils import prefix_symbol
from smort.src.translate.tools.Sort import Identifier 
from smort.src.translate.tools.Term import TermType, Var, Expr, LetBinding, QUANT_FORALL, QUANT_EXISTS
from smort.src.translate.theory.SMTLIBv2Sorts import BOOL
from smort.src.translate.theory.SMTLIBv2Theories import (
    BOOLEAN_NOT, BOOLEAN_IMPLIES, BOOLEAN_AND, BOOLEAN_OR, BOOLEAN_IF_THEN_ELSE
)
from smort.src.translate.smtlibv2.CNFTerm import Clause, CNFTerm 
from smort.src.translate.smtlibv2.Script import DeclareFun
from smort.src.translate.smtlibv2.ADT import get_tester_id_of_constructor



def Term2CNFTerm(t):
    """
    Convert a Term t to CNFTerm object

    :returns: list of DeclFun objects, CNFTerm object
    """
    # eliminate all match then let terms 
    eliminate_match(t)
    eliminate_let(t) 
    # convert term to CNF
    new_declfuns = first_order2CNF(t)

    if (t.term_type == TermType.EXPR) and (t.name == BOOLEAN_AND):
        clauses = []
        for s in t.subterms:
            if (s.term_type == TermType.EXPR) and (s.name == BOOLEAN_OR):
                literals = [l for l in s.subterms]
            else:
                literals = [s]
            c = Clause(literals)
            clauses.append(c)
    else:
        clauses = [Clause([t])]
    
    return new_declfuns, CNFTerm(clauses)


def eliminate_match(term):
    for s in term.subterms:
        eliminate_match(s)
    # match term couldn't be nested in match cases
    if term.term_type == TermType.MATCH:
        # move single variable pattern to last one
        var_pattern = None
        for i, pt in enumerate(term.match_cases):
            p, _ = pt
            if not p.constructor_name:
                var_pattern = term.match_cases.pop(i) 
                break
        if var_pattern:
            term.match_cases.append(var_pattern)
        # convert to nested ite experssions
        match_term = term.subterms[0]
        adt = match_term.sort
        inner_term = None
        for p, t in reversed(term.match_cases):
            if p.constructor_name:
                tester_id = get_tester_id_of_constructor(p.constructor_name)
                if_term = Expr(
                    name=tester_id,
                    subterms=[copy.deepcopy(match_term)],
                    sort=t.sort,
                )
                if_term.bound_vars = term.bound_vars
                if len(p.var_list) > 0:
                    # (let ((var match_term)...) t) 
                    var_bindings = []
                    selectors = adt.selectors_of_constructor[p.constructor_name]
                    for i, var in enumerate(p.var_list):
                        si = selectors[i]
                        expr = Expr(
                            name=si.name,
                            subterms=[copy.deepcopy(match_term)],
                            sort=si.output,
                        )
                        expr.bound_vars = term.bound_vars
                        var_bindings.append([var, expr])
                    e = LetBinding(
                        var_bindings=var_bindings,
                        let_term=t,
                        sort=t.sort,
                        local_free_vars=t.local_free_vars
                    )
                    e.bound_vars = match_term.bound_vars
                else:
                    # nullary constructor
                    e = t
            else:
                var = p.var_list[0]
                e = LetBinding(
                    var_bindings=[[var, copy.deepcopy(match_term)]],
                    let_term=t,
                    sort=t.sort,
                    local_free_vars=t.local_free_vars
                )
                e.bound_vars = match_term.bound_vars
            if inner_term:
                # assume no single variable pattern in middle
                this_term = Expr(
                    name=BOOLEAN_IF_THEN_ELSE,
                    subterms=[if_term, e, inner_term],
                    sort=e.sort,
                )
                this_term.bound_vars = term.bound_vars
                inner_term = this_term
            else:
                inner_term = e
        term.__dict__ = copy.deepcopy(inner_term.__dict__)


def eliminate_let(term):
    for s in term.subterms:
        eliminate_let(s)
    if term.term_type == TermType.LET:
        for v, t in term.var_bindings:
            eliminate_let(t)
            replace_var_by_term(term.subterms[0], v, t)
        term.__dict__ = copy.deepcopy(term.subterms[0].__dict__)


def first_order2CNF(fot):
    """
    convert a Term from first-order logic to CNF
    """
    # 1. Convert to negation normal form (NNF)
    #   Eliminate implications (and equivalences): repeatedly
    eliminate_implies(fot) 
    #   Move NOTs inwards by repeatedly applying De Morgan's law
    move_NOTs_inwards(fot) 
    # 2. Standardize variables
    #   Standardize variables apart by renaming them: each quantifier should use a different variable
    standardize_quantifiers(fot)
    # 3. Skolemize the statement
    #   Move quantifiers outwards: repeatedly move QF terms in
    move_quantifiers_outwards(fot)
    #   Eliminated all existential quantifiers: repeatedly replace (forall x_1, ..., x_n (exists y P(y))) with
    #       (forall x_1, ..., x_n P(f(x_1, ..., x_n)))
    #   This is the only step that preserves only satisfiability
    #       rather than equivalence
    new_declfuns = eliminate_exists(fot, [])
    # 4. (Ignore: invalid in SMT-LIB) Drop all universal quantifiers
    # 5. Distribute ORs inwards over ANDs: repeatedly
    distribute_ORs_inwards_ANDs(fot)

    return new_declfuns


def eliminate_implies(fot):
    if (fot.term_type == TermType.EXPR) and (fot.name == BOOLEAN_IMPLIES):
        # P -> Q ==> (not P) or Q
        p, _ = fot.subterms
        fot.subterms[0] = not_term(p)
        fot.name = BOOLEAN_OR
    for s in fot.subterms:
        eliminate_implies(s)


def move_NOTs_inwards(fot):
    while (fot.term_type == TermType.EXPR) and (fot.name == BOOLEAN_NOT):
        t = fot.subterms[0]
        if t.term_type == TermType.QUANT:
            # not (forall(x...) P(x...)) ==> (exists(x...) (not P(x...)))
            # not (exists(x...) P(x...)) ==> (forall(x...) (not P(x...)))
            fot.term_type = TermType.QUANT
            fot.quantifier = QUANT_FORALL if t.quantifier == QUANT_EXISTS else QUANT_EXISTS 
            fot.sorted_vars = t.sorted_vars
            fot.name = t.name # unique name of each quantifier
            fot.subterms = [not_term(t.subterms[0])]
            # local free vars are the same because original fot is an Expr, and has only one subterm
            fot.bound_vars = t.bound_vars
        elif t.term_type == TermType.EXPR:
            if (t.name == BOOLEAN_AND) or (t.name == BOOLEAN_OR):
                # not (P or Q...) ==> ((not P) and (not Q)...)
                # not (P and Q...) ==> ((not P) or (not Q)...)
                fot.subterms = [not_term(s) for s in t.subterms]
                fot.name = BOOLEAN_AND if t.name == BOOLEAN_OR else BOOLEAN_OR 
                # local free vars and bound vars are the same because:
                #   original fot is an Expr
                #   t is the only subterm of original fot
                #   t is an Expr
            elif t.name == BOOLEAN_NOT:
                # not not P ==> P 
                fot.__dict__ = copy.deepcopy(t.subterms[0].__dict__)
            else:
                break
        else:
            break
    for s in fot.subterms:
        move_NOTs_inwards(s)


def not_term(t):
    not_t = Expr(name=BOOLEAN_NOT, subterms=[t], sort=BOOL)
    not_t.bound_vars = t.bound_vars
    return not_t


def standardize_quantifiers(fot):
    if fot.term_type == TermType.QUANT:
        for s in fot.subterms:
            prefix_variables_in_scope(s, fot)
            prefix_quant_vars(fot)
    for s in fot.subterms:
        standardize_quantifiers(s)


def prefix_variables_in_scope(t, quant):
    if t.term_type == TermType.VAR:
        var_symbol = str(t.name)
        for i, sv in enumerate(quant.sorted_vars):
            var, sort = sv
            if (var_symbol == var) and (t.sort == sort):
                # rename this var
                t.name = Identifier(prefix_symbol(f"{quant.name}_", var_symbol), t.name.indices)
    elif t.term_type == TermType.QUANT:
        for i, svi in enumerate(quant.sorted_vars):
            vari, sorti = svi
            for j, svj in enumerate(t.sorted_vars):
                varj, sortj = svj 
                if (vari == varj) and (sorti == sortj):
                    # find duplicated var name and sort
                    # rename corresponding item in t's sorted vars,
                    #   local free vars and bound vars,
                    # so that it can override the variable later
                    prefixed_varj = prefix_symbol(f"{quant.name}_", varj)
                    t.sorted_vars[j][0] = prefixed_varj 
                    if varj in t.local_free_vars:
                        del t.local_free_vars[varj]
                    t.local_free_vars[prefixed_varj] = sortj
                    if varj in t.bound_vars:
                        del t.bound_vars[varj]
                    t.bound_vars[prefixed_varj] = sortj
    for s in t.subterms:
        prefix_variables_in_scope(s, quant)


def prefix_quant_vars(quant):
    for i, sv in enumerate(quant.sorted_vars):
        var, _ = sv
        quant.sorted_vars[i][0] = prefix_symbol(f"{quant.name}_", var)


def move_quantifiers_outwards(fot):
    if fot.term_type == TermType.EXPR:
        op = fot.name
        if (op == BOOLEAN_AND) or (op == BOOLEAN_OR):
            # P... and (forall(x...) Q(x...)) and ... ==> (forall(x...) P... and Q(x...) and ...)
            # P... or (forall(x...) Q(x...)) or ... ==> (forall(x...) P... or Q(x...) or ...)
            # P... and (exists(x...) Q(x...)) and ... ==> (exists(x...) P... and Q(x...) and ...)
            # P... or (exists(x...) Q(x...)) or ... ==> (exists(x...) P... or Q(x...) or ...)
            # all other terms merge to the first quant
            q = None
            for s in fot.subterms:
                if s.term_type == TermType.QUANT:
                    q = s
                    break
            if q:
                expr_subterms = []
                expr_local_free_vars = {}
                expr_bound_vars = q.subterms[0].bound_vars 
                for s in fot.subterms:
                    # no need to update subterms' local free vars and bound vars
                    # because q.sorted_vars won't exists in them
                    if s == q:
                        expr_subterms.append(s.subterms[0])
                        expr_local_free_vars.update(s.subterms[0].local_free_vars)
                    else:
                        expr_subterms.append(s)
                        expr_local_free_vars.update(s.local_free_vars)
                expr = Expr(
                    name=op,
                    subterms=expr_subterms,
                    sort=BOOL,
                )
                expr.bound_vars = expr_bound_vars
                fot.term_type = TermType.QUANT
                fot.name = q.name
                fot.quantifier = q.quantifier
                fot.sorted_vars = q.sorted_vars
                fot.subterms = [expr]
                # local free vars and bound vars are the same
    for s in fot.subterms:
        move_quantifiers_outwards(s)


def eliminate_exists(fot, forall_sorted_vars):
    new_declfuns = []
    if fot.term_type == TermType.QUANT:
        while fot.quantifier == QUANT_EXISTS: 
            input_sort_list = []
            input_var_list = []
            local_free_vars = {}
            for var, sort in forall_sorted_vars:
                input_sort_list.append(sort)
                input_var_list.append(
                    Var(
                        name=Identifier(var),
                        sort=sort,
                        qual_id=False,
                        global_free=False,
                    )
                )
                local_free_vars[var] = sort
            for var, sort in fot.sorted_vars:
                fun_name = var
                new_declfuns.append(DeclareFun(fun_name, input_sort_list, sort))
                term = Expr(
                    name=fun_name,
                    subterms=input_var_list,
                    sort=sort,
                )
                replace_var_by_term(fot.subterms[0], var, term)
            fot.__dict__ = copy.deepcopy(fot.subterms[0].__dict__)
        if fot.quantifier == QUANT_FORALL: 
            forall_sorted_vars += fot.sorted_vars
    for s in fot.subterms:
        new_declfuns.extend(eliminate_exists(s, copy.deepcopy(forall_sorted_vars)))
    return new_declfuns


def replace_var_by_term(t, var, term):
    if (t.term_type == TermType.VAR) and (str(t.name) == var):
        bound_vars = t.bound_vars
        t.__dict__ = copy.deepcopy(term.__dict__)
        t.bound_vars = bound_vars
    for s in t.subterms:
        if s.term_type == TermType.QUANT:
            svars = [v for v, _ in s.sorted_vars]
        elif s.term_type == TermType.LET:
            svars = [v for v, _ in s.var_bindings]
        else:
            svars = []
        if var in svars:
            # var is overrided in s
            continue
        replace_var_by_term(s, var, term)


def distribute_ORs_inwards_ANDs(fot):
    for s in fot.subterms:
        distribute_ORs_inwards_ANDs(s)
    if fot.term_type == TermType.EXPR:
        if fot.name == BOOLEAN_AND:
            terms = expand_operator(fot, BOOLEAN_AND) 
            fot.subterms = terms
        elif fot.name == BOOLEAN_OR:
            # expand all ORs first
            # (P or K or M) or ... ===> P or K or M or ...
            terms = expand_operator(fot, BOOLEAN_OR)
            # P or (C1 and C2 and ...) or K... ==>
            # (P or expand(C1)) and (P or (expand(C2)) and ...) or K... ==>
            # ...
            find_and = False
            i = 0
            while i < len(terms):
                s = terms[i]
                if (s.term_type == TermType.EXPR) and (s.name == BOOLEAN_AND):
                    find_and = True
                    # try distribute with neighbor
                    valid = True
                    while(valid):
                        if i-1 >= 0:
                            k = i-1
                        elif i+1 < len(terms):
                            k = i+1
                        else:
                            valid = False
                            break
                        p = terms[k]
                        p_subterms = [p]
                        if (p.term_type == TermType.EXPR) and (p.name == BOOLEAN_AND):
                            p_subterms = p.subterms
                        or_terms = []
                        for t in s.subterms:
                            for q in p_subterms:
                                or_term = Expr(
                                    name=BOOLEAN_OR,
                                    subterms=[q, t],
                                    sort=BOOL,
                                )
                                or_term.bound_vars = fot.bound_vars
                                or_terms.append(or_term)
                        and_term = Expr(
                            name=BOOLEAN_AND,
                            subterms=or_terms,
                            sort=BOOL,
                        )
                        and_term.bound_vars = fot.bound_vars
                        terms[i].__dict__ = copy.deepcopy(and_term.__dict__)
                        terms.pop(k)
                        if k == i-1:
                            i -= 1
                i += 1
            if find_and:
                fot.__dict__ = copy.deepcopy(terms[0].__dict__)
            else:
                fot.subterms = terms


def expand_operator(fot, operator):
    if fot.name == operator:
        terms = []
        for s in fot.subterms:
            terms.extend(expand_operator(s, operator))
        return terms
    else:
        return [fot]


def CNFTerm2Term(t):
    """
    Convert a CNFTerm t to Term object
    """

    if len(t.clauses) > 1:
        clauses = []
        for c in t.clauses:
            if len(c.literals) > 1:
                literals = [l for l in c.literals]
                clause = Expr(
                    name=BOOLEAN_OR,
                    subterms=literals,
                    sort=BOOL
                )
            elif len(c.literals) == 1:
                clause = c.literals[0]
            else:
                continue
            clauses.append(clause)
        return Expr(
            name=BOOLEAN_AND,
            subterms=clauses,
            sort=BOOL
        )
    elif len(t.clauses) == 1:
        c = t.clauses[0]
        if len(c.literals) > 1:
            literals = [l for l in c.literals]
            return Expr(
                name=BOOLEAN_OR,
                subterms=literals,
                sort=BOOL
            )
        elif len(c.literals) == 1:
            return c.literals[0]
    return None

