from smort.src.translate.theory.Fun import Fun, indexed_fun, indexed_sort
from smort.src.translate.theory.signatures import match_fun_in_signatures
from smort.src.translate.theory.utils import (
    numeral_greater_than_x,
    get_number_of_binary_digits,
    eq_input_indices,
    get_indices_of_first_indexed_input,
    get_indices_from_op
)
from smort.src.translate.tools.Sort import Identifier, SpecConstant, SpecConstType, Sort


def test_fun():
    A = "A"
    B = "B"
    s1 = Sort(Identifier("s1"))
    s2 = Sort(Identifier("s2"))
    s3 = Sort(Identifier("s3"))
    s4 = indexed_sort('s4', 2)
    s5 = indexed_sort('s5', 3)
    _s4 = Sort(Identifier("s4", ['a', 'a']))
    _s5 = Sort(Identifier("s5", [4, 5, 6]))
    f1 = Fun(Identifier("f1"), [s1], s2)
    f2 = Fun(Identifier("f2"), [s1, A], A, [A])
    f3 = Fun(Identifier("f1"), [s1], s2, [])
    assert str(f1) == "(f1 s1 s2)"
    assert str(f2) == "(par (A) (f2 s1 A A))"
    assert f1 == f3
    assert f1.match_term(Identifier("f1"), [s1]) == True
    assert f1.match_term(Identifier("f2"), [s1]) == False 
    assert f1.match_term(Identifier("f1", [1]), [s1]) == False 
    assert f1.match_term(Identifier("f1"), [s1, s2]) == False 
    f1 = Fun(Identifier("f1"), [s1, s2], s2)
    assert f1.match_term(Identifier("f1"), [s1, s1]) == False 
    assert f1.match_term(Identifier("f1"), [s1, s2], s3) == False 
    assert f1.match_term(Identifier("f1"), [s1, s2], s2) == True 
    f1 = Fun(SpecConstType.B_VALUE, [s1, s2], s2)
    assert f1.match_term(SpecConstant(SpecConstType.B_VALUE, True), [s1, s1]) == False 
    f4 = indexed_fun('f4', 1, [s1, s2], s3)
    assert f4.match_indexed_term(Identifier("f4", [2]), [s1, s2]) == True 
    f4 = indexed_fun('f4', 0, [s4], s5)
    assert f4.match_indexed_term(Identifier("f4"), [_s4]) == True 
    assert f4.match_indexed_term(Identifier("f4"), [Sort(Identifier("s4"))]) == False 
    BOOL = Sort(Identifier('Bool'))
    INT = Sort(Identifier('Int'))
    distinct = Fun(Identifier("distinct"), [A, A], BOOL, [A])
    d = {A: INT}
    assert distinct.get_par_dict(Identifier("distinct"), [INT, INT]) == d
    distinct = Fun(Identifier("distinct"), [A, B], BOOL, [A, B])
    d = {A: INT, B: BOOL}
    assert distinct.get_par_dict(Identifier("distinct"), [INT, BOOL]) == d
    distinct = Fun(Identifier("distinct"), [A, A], BOOL, [A])
    assert distinct.get_par_dict(Identifier("distinct"), [INT, BOOL]) == {} 
    BIT_VECTOR = indexed_sort(
        "BitVec",
        1,
        numeral_greater_than_x(0, 1)
    )
    binary = indexed_fun(
                        SpecConstType.BINARY,
                        0,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(2)
                    )
    bv = '#b1010'
    f = Fun(SpecConstant(SpecConstType.BINARY, bv), [], Sort(Identifier("BitVec", [4])))
    assert binary.get_indexed_instance(bv, []) == f
    bvadd = indexed_fun(
                        "bvadd",
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    )
    b1 = BIT_VECTOR.get_indexed_instance([2])
    b2 = BIT_VECTOR.get_indexed_instance([2])
    b3 = BIT_VECTOR.get_indexed_instance([2])
    f = Fun(Identifier('bvadd'), [b1, b2], b3)
    assert bvadd.get_indexed_instance([], [[2], [2]]) == f
    FLOATING_POINT = indexed_sort(
        'FloatingPoint', 
        2,
        numeral_greater_than_x(1, 2)
    )
    z = indexed_fun(
                    "+zero",
                    2,
                    [],
                    FLOATING_POINT,
                    numeral_greater_than_x(1, 2),
                    get_indices_from_op
                )
    fp = FLOATING_POINT.get_indexed_instance([2, 3])
    f = Fun(Identifier('+zero', [2, 3]), [], fp)
    assert z.get_indexed_instance([2, 3], []) == f
    assert z.get_indexed_instance([0, 3], []) == None 
    assert z.get_indexed_instance([2, 1], []) == None 


def test_match_fun_in_sigs():
    STRING = Sort(Identifier('String'))
    input_list = [STRING, STRING]
    output = STRING
    fun = Fun(Identifier("str.++"), [STRING, STRING], STRING)
    assert match_fun_in_signatures(Identifier('str.++'), input_list, None) == fun