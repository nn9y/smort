import pytest

from smort.src.translate.tools.Ast import * 
from smort.src.translate.theory.Fun import sort_with_arity
from smort.src.translate.theory.SMTLIBv2Sorts import * 
from smort.src.translate.theory.utils import numeral_greater_than_x 


def test_identifier():
    id1 = Identifier("id1", ["ax", "ab"])
    id1_str = "(_ id1 ax ab)"
    assert str(id1) == id1_str
    id1 = Identifier("id1", [1, "ab"])
    id1_str = "(_ id1 1 ab)"
    assert str(id1) == id1_str
    id1 = Identifier("id1")
    id1_str = "id1"
    assert str(id1) == id1_str
    id1 = Identifier("id1", {"len": 2})
    id2 = Identifier("id1", [1, 2])
    assert id1.same_indexed_type(id2)
    assert id2.same_indexed_type(id1)
    id1 = Identifier("id1", {"len": 3})
    id2 = Identifier("id1", ['a', 1, 2])
    assert id1.same_indexed_type(id2)
    assert id2.same_indexed_type(id1)
    id1 = Identifier("id1", {"len": 3})
    id2 = Identifier("id1", [1, 2])
    assert not id1.same_indexed_type(id2)
    id1 = Identifier("id1", [1, 2, 3])
    id2 = Sort("id1", [1, 2, 3]) 
    assert not id1.same_indexed_type(id2)
    id1 = Identifier("id1", {"len": 3})
    id2 = Identifier("id2", ['a', 1, 2])
    assert not id1.same_indexed_type(id2)
    assert not id2.same_indexed_type(id1)
    id1 = Identifier("id1", {"len": 2})
    id2 = Identifier("id1", {"len": 2})
    assert id1 == id2
    id1 = Identifier("id1", [1, 2])
    id2 = Identifier("id1", [1, 2])
    assert id1 == id2
    id1 = Identifier("id1", [1])
    id2 = Identifier("id1", [1, 2])
    assert id1 != id2
    id1 = Identifier("id1", {"len": 2})
    id2 = Identifier("id1", [1, 2])
    assert id1 != id2
    id1 = Identifier("id1", [1, 2])
    id2 = Sort("id1", [1, 2]) 
    assert id1 != id2
    id1 = Identifier("id1", {"len": 2})
    id2 = Identifier("id1", [1, 2])
    id3 = id1.get_indexed_instance([1, 2])
    assert id3 == id2 
    id1 = Identifier("id1", [1, 2])
    idx = id1
    id2 = Identifier("id1", [1, 2])
    id3 = id1.get_indexed_instance([1, 2])
    assert id3 == id2 
    assert id1 is idx
    assert not (id1 is id3)
    id1 = Identifier("id1", {'len': 2})
    id3 = id1.get_indexed_instance([1, 2], numeral_greater_than_x(1, 2))
    assert id3 == None 
    id1 = Identifier("id1", {'len': 2})
    id2 = Identifier("id1", [1, 2])
    id3 = id1.get_indexed_instance([1, 2], numeral_greater_than_x(0, 2))
    assert id3 == id2 



def test_sort():
    s1 = Sort(Identifier("s1"))
    s2 = Sort(Identifier("s2"))
    s3 = Sort(Identifier("s3"), [s1, s2])
    _s3 = Sort(Identifier("s3"), [s1, s2])
    s4 = Sort(Identifier("s4"), [s1, s2])
    s5 = Sort(Identifier("s3", [1]), [s1, s2])
    s6 = Sort(Identifier("s3"), [s2])
    assert str(s3) == "(s3 s1 s2)"
    assert s3 == _s3
    assert s3 != s4
    assert s3 != s5
    assert s3 != s6
    assert repr(s3) == "(s3 s1 s2)"
    s4 = Sort(Identifier("s3"), [s2, s2])
    assert not s4.same_indexed_type(s3)
    assert not s3.same_indexed_type(s4)
    s4 = Sort(Identifier("s3"), ['a', s2])
    assert s4.same_indexed_type(s3)
    assert s3.same_indexed_type(s4)
    assert s4.same_type(s3)
    assert s3.same_type(s4)
    s3 = Sort(Identifier("s3"), [s1, 'b'])
    s4 = Sort(Identifier("s3"), ['a', s2])
    assert s4.same_indexed_type(s3)
    assert s3.same_indexed_type(s4)
    assert s4.same_type(s3)
    assert s3.same_type(s4)
    s3 = Sort(Identifier("s3"), [s1, 'b'])
    s4 = Sort(Identifier("s3"), ['a', s2])
    assert s4.same_indexed_type(s3)
    assert s3.same_indexed_type(s4)
    assert s4.same_type(s3)
    assert s3.same_type(s4)
    s1 = Sort(Identifier("s1", {'len': 2}), ['a'])
    s2 = Sort(Identifier("s2", [1]))
    sx = Sort(Identifier("sx"))
    _s1 = Sort(Identifier("s1", [3, 4]), [sx])
    _s2 = Sort(Identifier("s2", {'len': 1}))
    s3 = Sort(Identifier("s3"), [s1, s2])
    s4 = Sort(Identifier("s3"), [_s1, _s2])
    assert s4.same_indexed_type(s3)
    assert s3.same_indexed_type(s4)
    assert s4.same_type(s3)
    assert s3.same_type(s4)
    s1 = Sort(Identifier("s1"), ['A', 'B'])
    s2 = sort_with_arity("s1", 2)
    assert s1.same_parametric_type(s2)
    s1 = Sort(Identifier("s1"), ['A', 'B'])
    s2 = Sort(Identifier("s1"), [sx, sx])
    assert s1.same_parametric_type(s2)
    assert s2.same_parametric_type(s1)
    s1 = Sort(Identifier("s1"), ['A', 'B'])
    s2 = Sort(Identifier("s2"), ['A', 'B'])
    assert not s1.same_parametric_type(s2)
    assert not s2.same_parametric_type(s1)
    s1 = Sort(Identifier("s1", [1]), ['A', 'B'])
    s2 = Sort(Identifier("s1"), ['A', 'B'])
    assert not s1.same_parametric_type(s2)
    assert not s2.same_parametric_type(s1)
    s1 = Sort(Identifier("s1", {'len': 1}))
    s2 = Sort(Identifier("s1", [1]))
    assert s1.get_indexed_instance([1]) == s2
    s1 = Sort(Identifier("s1", {'len': 1}), [], numeral_greater_than_x(0, 1))
    s2 = Sort(Identifier("s1", [1]))
    assert s1.get_indexed_instance([1]) == s2
    s1 = Sort(Identifier("s1", {'len': 2}), [], numeral_greater_than_x(1, 2))
    assert s1.get_indexed_instance([1, 2]) == None
    s1 = Sort(Identifier("s1", [1, 2]), [], numeral_greater_than_x(3, 2))
    _s1 = Sort(Identifier("s1", [1, 2]))
    s2 = Sort(Identifier("s1", [1]))
    sx = s1.get_indexed_instance([1])
    assert sx == _s1
    assert not (sx is _s1)
    assert sx != s2
    s1 = Sort(Identifier("s1"), ['A', 'B'])
    s2 = Sort(Identifier("s2"))
    s3 = Sort(Identifier("s3"))
    sx = s1.get_parametric_instance({'A': s2, 'B': s3})
    assert str(sx) == "(s1 s2 s3)"
    assert sx.id_ == s1.id_
    assert not (sx.id_ is s1.id_)
    sx = s1.get_parametric_instance({'A': s3, 'B': s2})
    assert str(sx) == "(s1 s3 s2)"
    sx = s1.get_parametric_instance({'A': s3})
    assert sx == None 
    sx = s1.get_parametric_instance({'X': s3, 'B': s2})
    assert sx == None 
    sx = s1.get_parametric_instance({'A': s2, 'B': s2})
    assert str(sx) == "(s1 s2 s2)"



def test_misc():
    se1 = SExperssion(SpecConstant(SpecConstType.NUMERAL, 15))
    assert str(se1) == '15'
    _se1 = SExperssion(SpecConstant(SpecConstType.NUMERAL, 15))
    assert se1 == _se1
    se2 = SExperssion('test')
    assert str(se2) == 'test'
    se3 = SExperssion(':keyword')
    assert str(se3) == ':keyword'
    se4 = SExperssion(subsexprs=[se1, se2, se3])
    assert str(se4) == '(15 test :keyword)'
    _se4 = SExperssion(value=None, subsexprs=[se1, se2, se3])
    assert se4 == _se4
    av1 = AttributeValue(SpecConstant(SpecConstType.HEXADECIMAL, '#x4F6B'))
    assert str(av1) == '#x4F6B'
    av2 = AttributeValue('value')
    assert str(av2) == 'value'
    av3 = AttributeValue(sexprs=[av1, av2])
    assert str(av3) == '(#x4F6B value)'
    a1 = Attribute(':a1')
    assert str(a1) == ':a1'
    a2 = Attribute(':a2', value=av2)
    assert str(a2) == ':a2 value'
    a3 = Attribute(':a1', value=av2)
    assert a3 != a1
    a3 = Attribute(':a1', value=None)
    assert a3 == a1

def test_term():
    c1 = Const(name=SpecConstant(SpecConstType.DECIMAL, 1.5), sort=REAL) 
    assert str(c1) == '1.5'
    v1 = Var(name=Identifier('v1'), sort=REAL)
    assert str(v1) == 'v1'
    assert v1.term_type == TermType.VAR
    e1 = Expr(name=Identifier('e1'), subterms=[v1, c1], sort=BOOL, qual_id=True)
    assert str(e1) == '((as e1 Bool) v1 1.5)'
    e2 = Expr(name=Identifier('e2'), subterms=[v1, c1], sort=BOOL)
    assert str(e2) == '(e2 v1 1.5)'
    vbs = [['v1', c1], ['v2', v1], ['v3', e1], ['v4', e2]]
    lb1 = LetBinding(var_bindings=vbs, let_term=e1, sort=INT)
    res = f'(let ((v1 {c1}) (v2 {v1}) (v3 {e1}) (v4 {e2})) {e1})'
    assert str(lb1) == res 
    svs = [['v1', BOOL], ['v2', INT], ['v3', REAL], ['v4', STRING]]
    q1 = Quantifier(quantifier='forall', sorted_vars=svs, quantified_term=e1)
    res = f'(forall ((v1 Bool) (v2 Int) (v3 Real) (v4 String)) {e1})'
    assert str(q1) == res 
    svs = [['v1', BIT_VECTOR.get_indexed_instance([4])], ['v2', INT], ['v3', REAL], ['v4', STRING]]
    q2 = Quantifier(quantifier='exists', sorted_vars=svs, quantified_term=e2)
    res = f'(exists ((v1 (_ BitVec 4)) (v2 Int) (v3 Real) (v4 String)) {e2})'
    assert str(q2) == res 
    pt1 = ['f1']
    pt2 = ['f2', 'k1', 'k2']
    pt3 = ['f3', 'q1']
    mcs = [[pt1, e1], [pt2, e2], [pt3, c1]]
    m1 = Match(term=e1, match_cases=mcs)
    res = f'(match {e1} (({list2str(pt1)} {e1}) (({list2str(pt2)}) {e2}) (({list2str(pt3)}) {c1})))'
    assert str(m1) == res
    av2 = AttributeValue('value')
    a1 = Attribute(':a1')
    a2 = Attribute(':a2', value=av2)
    a = [a1, a2]
    at1 = AnnotatedTerm(term=e1, annotations=a)
    res = f'(! {e1} {list2str(a)})'
    assert str(at1) == res
    # test methods
    c2 = Const(name=SpecConstant(SpecConstType.DECIMAL, 1.5), sort=REAL) 
    v2 = Var(name=Identifier('v2'), sort=REAL)
    _e2 = Expr(name=Identifier('e2'), subterms=[v2, c2], sort=BOOL)
    assert e2.equals(_e2)
    v2 = Var(name=Identifier('v3'), sort=REAL)
    _e2 = Expr(name=Identifier('e2'), subterms=[v2, c2], sort=BOOL)
    assert e2.equals(_e2)
    c2 = Const(name=SpecConstant(SpecConstType.DECIMAL, 1.0), sort=REAL) 
    v2 = Var(name=Identifier('v2'), sort=REAL)
    _e2 = Expr(name=Identifier('e2'), subterms=[v2, c2], sort=BOOL)
    assert not e2.equals(_e2)
    c2 = Const(name=SpecConstant(SpecConstType.DECIMAL, 1.5), sort=REAL) 
    v2 = Var(name=Identifier('v2'), sort=INT)
    _e2 = Expr(name=Identifier('e2'), subterms=[v2, c2], sort=BOOL)
    assert not e2.equals(_e2)
    e3 = Expr(name=Identifier('e3'), subterms=[e2, e1], sort=BOOL)
    c2 = Const(name=SpecConstant(SpecConstType.DECIMAL, 1.5), sort=REAL) 
    v2 = Var(name=Identifier('x3'), sort=REAL)
    _e2 = Expr(name=Identifier('e2'), subterms=[v2, c2], sort=BOOL)
    _e3 = Expr(name=Identifier('e3'), subterms=[_e2, e1], sort=BOOL)
    assert e3.equals(_e3)
    e1.local_free_vars = {'v1': REAL}
    e2.local_free_vars = {'v1': REAL}
    assert e3.equals(_e3, free=True)
    e1.bound_vars = {'v1': REAL}
    assert not e3.equals(_e3, free=True)
    e1.bound_vars = {}
    vn_map = {}
    v1 = Var(name=Identifier('v1'), sort=REAL)
    v2 = Var(name=Identifier('v2'), sort=REAL)
    e1 = Expr(name=Identifier('e1'), subterms=[v1, c1], sort=BOOL, qual_id=True)
    e2 = Expr(name=Identifier('e2'), subterms=[v2, c1], sort=BOOL)
    e1.local_free_vars = {'v1': REAL}
    e2.local_free_vars = {'v2': REAL}
    c2 = Const(name=SpecConstant(SpecConstType.DECIMAL, 1.5), sort=REAL) 
    _v2 = Var(name=Identifier('x3'), sort=REAL)
    _e2 = Expr(name=Identifier('e2'), subterms=[_v2, c2], sort=BOOL)
    e3 = Expr(name=Identifier('e3'), subterms=[e2, e1], sort=BOOL)
    _e3 = Expr(name=Identifier('e3'), subterms=[_e2, e1], sort=BOOL)
    assert e3.equals(_e3, free=True)
    e3.update_var_name_map(_e3, vn_map)
    assert vn_map == {'x3': v2.name, 'v1': v1.name}
    ex = Expr(name=Identifier('ex'), subterms=[e2, e1, e2, e2, e1, c2], sort=BOOL)
    vn_map = {}
    _e2_repl = Expr(name=Identifier('_e2_repl'), subterms=[v1, c2], sort=BOOL)
    ex.substitute(_e2, _e2_repl, vn_map, True)
    s = '(ex (_e2_repl v1 1.5) ((as e1 Bool) v1 1.5) (_e2_repl v1 1.5) (_e2_repl v1 1.5) ((as e1 Bool) v1 1.5) 1.5)'
    assert str(ex) == s
    vn_map = {}
    _c2 = Const(name=SpecConstant(SpecConstType.DECIMAL, 1.5), sort=REAL)
    _c2_repl = Const(name=SpecConstant(SpecConstType.BINARY, '#b1010'), sort=BIT_VECTOR.get_indexed_instance([4])) 
    ex.substitute(_c2, _c2_repl, vn_map, True)
    s = '(ex (_e2_repl v1 #b1010) ((as e1 Bool) v1 #b1010) (_e2_repl v1 #b1010) (_e2_repl v1 #b1010) ((as e1 Bool) v1 #b1010) #b1010)'
    assert str(ex) == s

