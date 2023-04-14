from smort.src.translate.tools.Term import *
from smort.src.translate.theory.SMTLIBv2Sorts import *
from smort.src.translate.theory.SMTLIBv2Theories import *
from smort.src.translate.smtlibv2.cnf_conversion import *


def test_not_term():
    a = Var(Identifier('a'), sort=BOOL, global_free=True)
    not_a = not_term(a)
    assert str(not_a) == '(not a)'
    assert not_a.global_free == a.global_free 


def test_elimi_implies():
    # simple
    a = Var(Identifier('a'), sort=BOOL, global_free=True)
    b = Var(Identifier('b'), sort=BOOL, global_free=True)
    t = Expr(Identifier('=>'), subterms=[a, b], sort=BOOL)
    assert str(t) == '(=> a b)'
    eliminate_implies(t)
    assert str(t) == '(or (not a) b)'
    t_or = Expr(
        name=BOOLEAN_OR,
        subterms=[not_term(a), b],
        sort=BOOL
    )
    assert t == t_or
    # nested
    # (= (= P (=> Q S)) (=> M N))
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('='), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('='), subterms=[p_q2s, m2n], sort=BOOL)
    assert str(p_q2s_m2n) == '(= (= P (=> Q S)) (=> M N))'
    eliminate_implies(p_q2s_m2n)
    assert str(p_q2s_m2n) == '(= (= P (or (not Q) S)) (or (not M) N))'


def test_move_nots():
    # (not (= (= P (=> Q S)) (=> M N)))
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('='), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('='), subterms=[p_q2s, m2n], sort=BOOL)
    not_p_q2s_m2n = Expr(Identifier('not'), subterms=[p_q2s_m2n], sort=BOOL)
    assert str(not_p_q2s_m2n) == '(not (= (= P (=> Q S)) (=> M N)))'
    eliminate_implies(not_p_q2s_m2n)
    assert str(not_p_q2s_m2n) == '(not (= (= P (or (not Q) S)) (or (not M) N)))'
    move_NOTs_inwards(not_p_q2s_m2n)
    assert str(not_p_q2s_m2n) == '(not (= (= P (or (not Q) S)) (or (not M) N)))'

    # (not (or (or P (=> Q S)) (=> M N)))
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('or'), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('or'), subterms=[p_q2s, m2n], sort=BOOL)
    not_p_q2s_m2n = Expr(Identifier('not'), subterms=[p_q2s_m2n], sort=BOOL)
    assert str(not_p_q2s_m2n) == '(not (or (or P (=> Q S)) (=> M N)))'
    eliminate_implies(not_p_q2s_m2n)
    assert str(not_p_q2s_m2n) == '(not (or (or P (or (not Q) S)) (or (not M) N)))'
    move_NOTs_inwards(not_p_q2s_m2n)
    assert str(not_p_q2s_m2n) == '(and (and (not P) (and Q (not S))) (and M (not N)))'

    # (not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) 
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('or'), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('or'), subterms=[p_q2s, m2n], sort=BOOL)
    forall_p_q2s_m2n = Quantifier(
        name='Q1',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=p_q2s_m2n,
        sort=BOOL
    )
    not_forall_p_q2s_m2n = Expr(
        name=BOOLEAN_NOT,
        subterms=[forall_p_q2s_m2n],
        sort=BOOL
    )
    assert str(not_forall_p_q2s_m2n) == '(not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N))))'
    eliminate_implies(not_forall_p_q2s_m2n)
    assert str(not_forall_p_q2s_m2n) == '(not (forall ((x Bool)) (or (or P (or (not Q) S)) (or (not M) N))))'
    move_NOTs_inwards(not_forall_p_q2s_m2n)
    assert str(not_forall_p_q2s_m2n) == '(exists ((x Bool)) (and (and (not P) (and Q (not S))) (and M (not N))))'

    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    not_p = Expr(
        name=BOOLEAN_NOT,
        subterms=[p],
        sort=BOOL,
    )
    not_not_p = Expr(
        name=BOOLEAN_NOT,
        subterms=[not_p],
        sort=BOOL,
    )
    not_not_not_p = Expr(
        name=BOOLEAN_NOT,
        subterms=[not_not_p],
        sort=BOOL,
    )
    not_not_not_not_p = Expr(
        name=BOOLEAN_NOT,
        subterms=[not_not_not_p],
        sort=BOOL,
    )
    move_NOTs_inwards(not_not_not_not_p)
    assert str(not_not_not_not_p) == 'P'


def test_stand_quant():
    # (or 
    # (not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) 
    # (exists ((x Bool)) (and x P))
    # )
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('or'), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('or'), subterms=[p_q2s, m2n], sort=BOOL)
    forall_p_q2s_m2n = Quantifier(
        name='Q1',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=p_q2s_m2n,
        sort=BOOL
    )
    not_forall_p_q2s_m2n = Expr(
        name=BOOLEAN_NOT,
        subterms=[forall_p_q2s_m2n],
        sort=BOOL
    )
    # local var x
    x = Var(Identifier('x'), sort=BOOL)
    x_p = Expr(BOOLEAN_AND, subterms=[x, p], sort=BOOL) 
    exists_x_p = Quantifier(
        name='Q2',
        quantifier=QUANT_EXISTS,
        sorted_vars=[['x', BOOL]],
        quantified_term=x_p,
        sort=BOOL
    )
    final_term = Expr(
        name=BOOLEAN_OR,
        subterms=[not_forall_p_q2s_m2n, exists_x_p],
        sort=BOOL
    )
    smtlibv2_str ='(or \
(not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) \
(exists ((x Bool)) (and x P)))'
    assert str(final_term) == smtlibv2_str 
    eliminate_implies(final_term)
    smtlibv2_str ='(or \
(not (forall ((x Bool)) (or (or P (or (not Q) S)) (or (not M) N)))) \
(exists ((x Bool)) (and x P)))'
    assert str(final_term) == smtlibv2_str 
    move_NOTs_inwards(final_term)
    smtlibv2_str ='(or \
(exists ((x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((x Bool)) (and x P)))'
    assert str(final_term) == smtlibv2_str 
    standardize_quantifiers(final_term)
    smtlibv2_str ='(or \
(exists ((Q1_x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((Q2_x Bool)) (and Q2_x P)))'
    assert str(final_term) == smtlibv2_str 

    # override renaming
    # (forall ((x Bool)) 
    # (or 
    # (not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) 
    # (exists ((x Bool)) (and x P))
    # )
    # )
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('or'), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('or'), subterms=[p_q2s, m2n], sort=BOOL)
    forall_p_q2s_m2n = Quantifier(
        name='Q1',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=p_q2s_m2n,
        sort=BOOL
    )
    not_forall_p_q2s_m2n = Expr(
        name=BOOLEAN_NOT,
        subterms=[forall_p_q2s_m2n],
        sort=BOOL
    )
    # local var x
    x = Var(Identifier('x'), sort=BOOL)
    x_p = Expr(BOOLEAN_AND, subterms=[x, p], sort=BOOL) 
    exists_x_p = Quantifier(
        name='Q2',
        quantifier=QUANT_EXISTS,
        sorted_vars=[['x', BOOL]],
        quantified_term=x_p,
        sort=BOOL
    )
    final_term = Expr(
        name=BOOLEAN_OR,
        subterms=[not_forall_p_q2s_m2n, exists_x_p],
        sort=BOOL
    )
    forall_final = Quantifier(
        name='Q3',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=final_term,
        sort=BOOL
    )
    smtlibv2_str ='(forall ((x Bool)) (or \
(not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    eliminate_implies(forall_final)
    smtlibv2_str ='(forall ((x Bool)) (or \
(not (forall ((x Bool)) (or (or P (or (not Q) S)) (or (not M) N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    move_NOTs_inwards(forall_final)
    smtlibv2_str ='(forall ((x Bool)) (or \
(exists ((x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    standardize_quantifiers(forall_final)
    smtlibv2_str ='(forall ((Q3_x Bool)) (or \
(exists ((Q1_Q3_x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((Q2_Q3_x Bool)) (and Q2_Q3_x P))))'
    assert str(forall_final) == smtlibv2_str


def test_move_quant_out():
    # (forall ((x Bool)) 
    # (or 
    # (not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) 
    # (exists ((x Bool)) (and x P))
    # )
    # )
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('or'), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('or'), subterms=[p_q2s, m2n], sort=BOOL)
    forall_p_q2s_m2n = Quantifier(
        name='Q1',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=p_q2s_m2n,
        sort=BOOL
    )
    not_forall_p_q2s_m2n = Expr(
        name=BOOLEAN_NOT,
        subterms=[forall_p_q2s_m2n],
        sort=BOOL
    )
    # local var x
    x = Var(Identifier('x'), sort=BOOL)
    x_p = Expr(BOOLEAN_AND, subterms=[x, p], sort=BOOL) 
    exists_x_p = Quantifier(
        name='Q2',
        quantifier=QUANT_EXISTS,
        sorted_vars=[['x', BOOL]],
        quantified_term=x_p,
        sort=BOOL
    )
    final_term = Expr(
        name=BOOLEAN_OR,
        subterms=[not_forall_p_q2s_m2n, exists_x_p],
        sort=BOOL
    )
    forall_final = Quantifier(
        name='Q3',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=final_term,
        sort=BOOL
    )
    smtlibv2_str ='(forall ((x Bool)) (or \
(not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    eliminate_implies(forall_final)
    smtlibv2_str ='(forall ((x Bool)) (or \
(not (forall ((x Bool)) (or (or P (or (not Q) S)) (or (not M) N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    move_NOTs_inwards(forall_final)
    smtlibv2_str ='(forall ((x Bool)) (or \
(exists ((x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    standardize_quantifiers(forall_final)
    smtlibv2_str ='(forall ((Q3_x Bool)) (or \
(exists ((Q1_Q3_x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((Q2_Q3_x Bool)) (and Q2_Q3_x P))))'
    assert str(forall_final) == smtlibv2_str 
    move_quantifiers_outwards(forall_final)
    # ==>
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(exists ((Q1_Q3_x Bool)) (or (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((Q2_Q3_x Bool)) (and Q2_Q3_x P)))))'
    # ==>
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(exists ((Q1_Q3_x Bool)) (exists ((Q2_Q3_x Bool)) \
(or (and (and (not P) (and Q (not S))) (and M (not N))) \
(and Q2_Q3_x P)))))'
    assert str(forall_final) == smtlibv2_str 


def test_elimi_exists():
    # (forall ((x Bool)) 
    # (or 
    # (not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) 
    # (exists ((x Bool)) (and x P))
    # )
    # )
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('or'), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('or'), subterms=[p_q2s, m2n], sort=BOOL)
    forall_p_q2s_m2n = Quantifier(
        name='Q1',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=p_q2s_m2n,
        sort=BOOL
    )
    not_forall_p_q2s_m2n = Expr(
        name=BOOLEAN_NOT,
        subterms=[forall_p_q2s_m2n],
        sort=BOOL
    )
    # local var x
    x = Var(Identifier('x'), sort=BOOL)
    x_p = Expr(BOOLEAN_AND, subterms=[x, p], sort=BOOL) 
    exists_x_p = Quantifier(
        name='Q2',
        quantifier=QUANT_EXISTS,
        sorted_vars=[['x', BOOL]],
        quantified_term=x_p,
        sort=BOOL
    )
    final_term = Expr(
        name=BOOLEAN_OR,
        subterms=[not_forall_p_q2s_m2n, exists_x_p],
        sort=BOOL
    )
    forall_final = Quantifier(
        name='Q3',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=final_term,
        sort=BOOL
    )
    smtlibv2_str ='(forall ((x Bool)) (or \
(not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    eliminate_implies(forall_final)
    smtlibv2_str ='(forall ((x Bool)) (or \
(not (forall ((x Bool)) (or (or P (or (not Q) S)) (or (not M) N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    move_NOTs_inwards(forall_final)
    smtlibv2_str ='(forall ((x Bool)) (or \
(exists ((x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    standardize_quantifiers(forall_final)
    smtlibv2_str ='(forall ((Q3_x Bool)) (or \
(exists ((Q1_Q3_x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((Q2_Q3_x Bool)) (and Q2_Q3_x P))))'
    assert str(forall_final) == smtlibv2_str 
    move_quantifiers_outwards(forall_final)
    # ==>
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(exists ((Q1_Q3_x Bool)) (or (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((Q2_Q3_x Bool)) (and Q2_Q3_x P)))))'
    # ==>
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(exists ((Q1_Q3_x Bool)) (exists ((Q2_Q3_x Bool)) \
(or (and (and (not P) (and Q (not S))) (and M (not N))) \
(and Q2_Q3_x P)))))'
    assert str(forall_final) == smtlibv2_str
    declfuns = eliminate_exists(forall_final, [])
    # ==>
    # declare-fun Q1_Q3_x (Bool) Bool
    # (Q1_Q3_x Q3_x)
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(exists ((Q2_Q3_x Bool)) \
(or (and (and (not P) (and Q (not S))) (and M (not N))) \
(and Q2_Q3_x P))))'
    # ==>
    # declare-fun Q1_Q3_x (Bool) Bool
    # (Q1_Q3_x Q3_x)
    # declare-fun Q2_Q3_x (Bool) Bool
    # (Q2_Q3_x Q3_x)
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(or (and (and (not P) (and Q (not S))) (and M (not N))) \
(and (Q2_Q3_x Q3_x) P)))'
    assert str(forall_final) == smtlibv2_str


def test_distribute():
        # (forall ((x Bool)) 
    # (or 
    # (not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) 
    # (exists ((x Bool)) (and x P))
    # )
    # )
    p = Var(Identifier('P'), sort=BOOL, global_free=True)
    q = Var(Identifier('Q'), sort=BOOL, global_free=True)
    s = Var(Identifier('S'), sort=BOOL, global_free=True)
    m = Var(Identifier('M'), sort=BOOL, global_free=True)
    n = Var(Identifier('N'), sort=BOOL, global_free=True)
    q2s = Expr(Identifier('=>'), subterms=[q, s], sort=BOOL)
    p_q2s = Expr(Identifier('or'), subterms=[p, q2s], sort=BOOL)
    m2n = Expr(Identifier('=>'), subterms=[m, n], sort=BOOL)
    p_q2s_m2n = Expr(Identifier('or'), subterms=[p_q2s, m2n], sort=BOOL)
    forall_p_q2s_m2n = Quantifier(
        name='Q1',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=p_q2s_m2n,
        sort=BOOL
    )
    not_forall_p_q2s_m2n = Expr(
        name=BOOLEAN_NOT,
        subterms=[forall_p_q2s_m2n],
        sort=BOOL
    )
    # local var x
    x = Var(Identifier('x'), sort=BOOL)
    x_p = Expr(BOOLEAN_AND, subterms=[x, p], sort=BOOL) 
    exists_x_p = Quantifier(
        name='Q2',
        quantifier=QUANT_EXISTS,
        sorted_vars=[['x', BOOL]],
        quantified_term=x_p,
        sort=BOOL
    )
    final_term = Expr(
        name=BOOLEAN_OR,
        subterms=[not_forall_p_q2s_m2n, exists_x_p],
        sort=BOOL
    )
    forall_final = Quantifier(
        name='Q3',
        quantifier=QUANT_FORALL,
        sorted_vars=[['x', BOOL]],
        quantified_term=final_term,
        sort=BOOL
    )
    smtlibv2_str ='(forall ((x Bool)) (or \
(not (forall ((x Bool)) (or (or P (=> Q S)) (=> M N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    eliminate_implies(forall_final)
    smtlibv2_str ='(forall ((x Bool)) (or \
(not (forall ((x Bool)) (or (or P (or (not Q) S)) (or (not M) N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    move_NOTs_inwards(forall_final)
    smtlibv2_str ='(forall ((x Bool)) (or \
(exists ((x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((x Bool)) (and x P))))'
    assert str(forall_final) == smtlibv2_str 
    standardize_quantifiers(forall_final)
    smtlibv2_str ='(forall ((Q3_x Bool)) (or \
(exists ((Q1_Q3_x Bool)) (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((Q2_Q3_x Bool)) (and Q2_Q3_x P))))'
    assert str(forall_final) == smtlibv2_str 
    move_quantifiers_outwards(forall_final)
    # ==>
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(exists ((Q1_Q3_x Bool)) (or (and (and (not P) (and Q (not S))) (and M (not N)))) \
(exists ((Q2_Q3_x Bool)) (and Q2_Q3_x P)))))'
    # ==>
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(exists ((Q1_Q3_x Bool)) (exists ((Q2_Q3_x Bool)) \
(or (and (and (not P) (and Q (not S))) (and M (not N))) \
(and Q2_Q3_x P)))))'
    assert str(forall_final) == smtlibv2_str
    declfuns = eliminate_exists(forall_final, [])
    # ==>
    # declare-fun Q1_Q3_x (Bool) Bool
    # (Q1_Q3_x Q3_x)
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(exists ((Q2_Q3_x Bool)) \
(or (and (and (not P) (and Q (not S))) (and M (not N))) \
(and Q2_Q3_x P))))'
    # ==>
    # declare-fun Q1_Q3_x (Bool) Bool
    # (Q1_Q3_x Q3_x)
    # declare-fun Q2_Q3_x (Bool) Bool
    # (Q2_Q3_x Q3_x)
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(or (and (and (not P) (and Q (not S))) (and M (not N))) \
(and (Q2_Q3_x Q3_x) P)))'
    assert str(forall_final) == smtlibv2_str
    distribute_ORs_inwards_ANDs(forall_final)
    smtlibv2_str = '(forall ((Q3_x Bool)) \
(and \
(or (Q2_Q3_x Q3_x) (not P)) \
(or P (not P)) \
(or (Q2_Q3_x Q3_x) Q) (or P Q) \
(or (Q2_Q3_x Q3_x) (not S)) \
(or P (not S)) \
(or (Q2_Q3_x Q3_x) M) \
(or P M) \
(or (Q2_Q3_x Q3_x) \
(not N)) \
(or P (not N))))'
    assert str(forall_final) == smtlibv2_str


def test_expand_operator():
    a = Var(name=Identifier('a'), sort=BOOL)
    b = Var(name=Identifier('b'), sort=BOOL)
    c = Var(name=Identifier('c'), sort=BOOL)
    d = Var(name=Identifier('d'), sort=BOOL)
    or_c_d = Expr(
        name=BOOLEAN_OR,
        subterms=[c, d],
        sort=BOOL,
    )
    expr = Expr(
        name=BOOLEAN_AND,
        subterms=[
            Expr(
                name=BOOLEAN_AND,
                subterms=[a, b],
                sort=BOOL,
            ),
            or_c_d,
        ],
        sort=BOOL
    )
    terms = expand_operator(expr, BOOLEAN_AND)
    assert terms == [a, b, or_c_d]


