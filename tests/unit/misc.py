import pytest

from smort.src.tools.utils import *
from smort.src.translate.tools.Sort import Sort
from smort.src.translate.theory.utils import *
from smort.src.translate.theory.Fun import *
from smort.src.translate.theory.Fun import _get_repl_sort 
from smort.src.translate.theory.signatures import *


def test_list2str():
    l = [1, (3, (5, 6), 4), (1,)] 
    s = "1 (3 (5 6) 4) 1"
    assert list2str(l) == s 
    l = [1]
    s = "1"
    assert list2str(l) == s 
    l = [1, (3, [5, 'a'], 4), (1,)] 
    s = "1 (3 (5 a) 4) 1"
    assert list2str(l) == s 
    a_sort = Sort('a')
    b_sort = Sort('b')
    c_sort = Sort('c', [a_sort, b_sort])
    sorted_var_list = [['a', a_sort], ['b_d', b_sort], ['ckk', c_sort]]
    svl_str = "(a a) (b_d b) (ckk (c a b))"
    assert list2str(sorted_var_list) == svl_str 
    var_bindings = [[1, 2], [3, 'a']]
    assert list2str(var_bindings) == '(1 2) (3 a)'
    var_bindings = [[1, 2]]
    assert list2str(var_bindings) == '(1 2)'
    attrs = [':aa', ':bbc']
    assert list2str(attrs) == ':aa :bbc'


def test_constraints_and_get_output_indices():
    # numeral_greater_than_x
    f1 = numeral_greater_than_x(0, 1)
    assert f1([3], [1]) == True
    f1 = numeral_greater_than_x(0, 2)
    assert f1([3], [1]) == False 
    f1 = numeral_greater_than_x(0, 2)
    assert f1([3, 0], [1]) == False 
    f1 = numeral_greater_than_x(0, 2)
    assert f1([3, 0, 1], [1]) == False 
    f1 = numeral_greater_than_x(0, 2)
    assert f1([3, 1], [1]) == True 
    f1 = numeral_greater_than_x(3, 2)
    assert f1([3, 1], [1]) == False 
    f1 = numeral_greater_than_x(3, 2)
    assert f1([4, 4], [1]) == True 
    # extract_bound_of_bitvec
    t2 = extract_bound_of_bitvec([2, 1], [[3]])
    assert t2 == True 
    t2 = extract_bound_of_bitvec([2, 1, 0], [[3, 1]])
    assert t2 == False 
    t2 = extract_bound_of_bitvec([2], [[3]])
    assert t2 == False 
    t2 = extract_bound_of_bitvec([2], [[3], []])
    assert t2 == False 
    t2 = extract_bound_of_bitvec([2, 3], [[3]])
    assert t2 == False 
    t2 = extract_bound_of_bitvec([2, 1], [[2]])
    assert t2 == False 
    t2 = extract_bound_of_bitvec(['2', 1], [[3]])
    assert t2 == False 
    t2 = extract_bound_of_bitvec([2, -1], [[3]])
    assert t2 == False
    # eq_input_indices
    f3 = eq_input_indices(0, 1, 1) 
    assert f3([], [[1]]) == True
    f3 = eq_input_indices(0, 1, 1) 
    assert f3([], [[1], [1]]) == False 
    f3 = eq_input_indices(0, 1, 1) 
    assert f3([1, 1], [[1]]) == False 
    f3 = eq_input_indices(0, 1, 1) 
    assert f3([1, [1, 2]], [[1]]) == False 
    f3 = eq_input_indices(0, 2, 2) 
    assert f3([], [[1], [1]]) == True
    f3 = eq_input_indices(1, 3, 3) 
    assert f3([], [[2], [1], [1]]) == True
    f3 = eq_input_indices(1, 3, 3) 
    assert f3([], [[2], [1, 2], [1, 2]]) == True
    f3 = eq_input_indices(1, 3, 3) 
    assert f3([], [[2], [1, 3], [1, 2]]) == False 
    with pytest.raises(TheoryException):
        f3 = eq_input_indices(-1, 1, 1)
    with pytest.raises(TheoryException):
        f3 = eq_input_indices(1, 1, 1)
    with pytest.raises(TheoryException):
        f3 = eq_input_indices(0, 1, 0)
    with pytest.raises(TheoryException):
        f3 = eq_input_indices(2, 1, 1)
    with pytest.raises(TheoryException):
        f3 = eq_input_indices('0', '3', 3)
    # bitvec_bound_of_fp
    assert bitvec_bound_of_fp([], [[1], [2], [3]]) == True
    assert bitvec_bound_of_fp([], [[1], [1], [3]]) == False 
    assert bitvec_bound_of_fp([1], [[1], [2], [3]]) == False 
    assert bitvec_bound_of_fp([], [[1], [2], [0]]) == False 
    assert bitvec_bound_of_fp([], [[1], [2], [1]]) == True 
    assert bitvec_bound_of_fp([], [[0], [2], [1]]) == False 
    assert bitvec_bound_of_fp([], [[2], [2], [1]]) == False 
    assert bitvec_bound_of_fp([], [[1], [2, 1], [1]]) == False 
    assert bitvec_bound_of_fp([], [[1], [2], [1, 2]]) == False 
    assert bitvec_bound_of_fp([], [[1, 1], [2], [1]]) == False 
    assert bitvec_bound_of_fp([], [[1], [2], [1], [1]]) == False 
    assert bitvec_bound_of_fp([], [[1], [2]]) == False 
    # eb_plus_sb_eq_m
    assert eb_plus_sb_eq_m([1, 2], [[3]]) == True
    assert eb_plus_sb_eq_m([1, 2], [[3], [1]]) == False 
    assert eb_plus_sb_eq_m([1, 2, 4], [[3]]) == False 
    assert eb_plus_sb_eq_m([1], [[3]]) == False 
    assert eb_plus_sb_eq_m([1, 2], [[3, 2]]) == False 
    assert eb_plus_sb_eq_m([1, 2], [[1]]) == False 
    assert eb_plus_sb_eq_m([1, 2], [[4]]) == False 
    # hex_is_char
    assert hex_is_char(['#xF'], []) == True
    assert hex_is_char(['#xFFFF'], []) == True
    assert hex_is_char(['#xFFFFF'], []) == False 
    assert hex_is_char(['#x000000'], []) == False 
    assert hex_is_char(['#x0FFFF'], []) == True 
    assert hex_is_char(['#x1FFFF'], []) == True 
    assert hex_is_char(['#x2FFFF'], []) == True 
    assert hex_is_char(['#x2456'], []) == True 
    assert hex_is_char(['#x0'], []) == True 
    assert hex_is_char(['#x0', 1], []) == False 
    assert hex_is_char(['#x0'], [[]]) == False 
    assert hex_is_char([0x0], []) == False 
    assert hex_is_char(['#x'], [[]]) == False 
    # get_number_of_binary_digits
    f4 = get_number_of_binary_digits(2)
    assert f4('#b001', []) == [3] 
    with pytest.raises(TheoryException):
        f4 = get_number_of_binary_digits(1) 
    with pytest.raises(TheoryException):
        f4 = get_number_of_binary_digits(3) 
    f4 = get_number_of_binary_digits(16)
    assert f4('#xF001', []) == [16] 
    # add_bitvecs_indices
    assert add_bitvecs_indices([], [[1], [2]]) == [3]
    assert add_bitvecs_indices([], [[2], [2]]) == [4]
    # get_extract_length_of_bitvec
    assert get_extract_length_of_bitvec([2, 1], [[3]]) == [2]
    assert get_extract_length_of_bitvec([3, 1], [[5]]) == [3]
    # get_indices_of_first_indexed_input
    assert get_indices_of_first_indexed_input([], [[], [2, 3]]) == [2, 3]
    assert get_indices_of_first_indexed_input([], [[], [2, 3], [1]]) == [2, 3]
    assert get_indices_of_first_indexed_input([], [[], [], [2], [1]]) == [2]
    # get_eb_sb_from_bitvec
    assert get_eb_sb_from_bitvec([], [[1], [2], [3]]) == [2, 4]
    assert get_eb_sb_from_bitvec([], [[1], [5], [3]]) == [5, 4]
    # get_indices_from_op
    assert get_indices_from_op([1, 3], []) == [1, 3]
    assert get_indices_from_op([5], []) == [5]

def test_merge_dicts():
    # merge_disjoint_dict
    dict1 = {'a': 1, 'b': 2, 'c': 3}
    dict2 = {'d': 1, 'e': 2, 'f': 3}
    dict3 = {'g': 1, 'h': 2, 'i': 3}
    dict_merged = {'a': 1, 'b': 2, 'c': 3, 'd': 1, 'e': 2, 'f': 3, 'g': 1, 'h': 2, 'i': 3}
    assert merge_disjoint_dict([dict1, dict2, dict3]) == dict_merged
    # merge_multi_dict
    dict1 = {'a': 1, 'b': [2, 3, 4], 'c': 3}
    dict2 = {'a': 4, 'b': 6, 'c': [5, 7]}
    dict3 = {'g': 1, 'h': 2, 'i': 3}
    dict_merged = {'a': [1, 4], 'b': [2, 3, 4, 6], 'c': [3, 5, 7], 'g': [1], 'h': [2], 'i': [3]}
    assert merge_multi_dict([dict1, dict2, dict3]) == dict_merged


def test_sort_with_arity():
    f1 = sort_with_arity("f1", 0)
    s1 = Sort(Identifier("f1"))
    assert f1 == s1
    with pytest.raises(TheoryException):
        f1 = sort_with_arity("", -1) 
    with pytest.raises(TheoryException):
        f1 = sort_with_arity("", -4) 
    f1 = sort_with_arity("f1", 2)
    assert isfunction(f1)
    s2 = f1(["A", "B"])
    assert isinstance(s2, Sort)
    s1 = Sort(Identifier("s1"))
    s2 = Sort(Identifier("s2"))
    s3 = f1([s1, s2])
    assert isinstance(s3, Sort)

def test_indexed_sort():
    s1 = indexed_sort("s1", 1, None)
    assert type(s1) == Sort
    assert type(s1.id_.indices) == dict
    assert s1.constraint == None 
    with pytest.raises(TheoryException):
        s1 = indexed_sort("s1", 0, None)
    s1 = indexed_sort("s1", 1, numeral_greater_than_x(1, 1))
    assert type(s1) == Sort
    assert type(s1.id_.indices) == dict
    assert isfunction(s1.constraint)

def test_indexed_fun():
    s1 = indexed_sort("s1", 1, None)
    f1 = indexed_fun("f1", 1, [], s1)
    assert type(f1) == Fun 
    assert type(f1.name.indices) == dict
    assert f1.constraints == None 
    assert f1.get_output_indices == None 
    assert f1.par_list == None 
    s1 = Sort("s1")
    f1 = indexed_fun("f1", 0, [], s1)
    assert type(f1) == Fun 
    assert type(f1.name.indices) == dict
    assert str(f1.name) == "f1"
    with pytest.raises(TheoryException):
        f1 = indexed_fun("f1", -1, [], s1)
    f1 = indexed_fun("f1", 0, [], s1, extract_bound_of_bitvec, get_number_of_binary_digits(2), ["A", "B"])
    assert isfunction(f1.constraints)
    assert isfunction(f1.get_output_indices)
    assert type(f1.par_list) == list 


def test_get_par_dict():
    A = "A"
    B = "B"
    X = "X"
    Y = "Y"

    s1 = Sort(Identifier("s1"))
    s2 = Sort(Identifier("s2"))

    s3 = sort_with_arity("s3", 2)([A, B])
    s4 = sort_with_arity("s4", 1)([A])
    s5 = sort_with_arity("s5", 1)([B])
    s6 = sort_with_arity("s6", 2)([X, Y])

    _s3 = sort_with_arity("s3", 2)([s1, s2])
    _s4 = sort_with_arity("s4", 1)([s1])
    _s4_ = sort_with_arity("s4", 2)([s1, s2])
    _s5 = sort_with_arity("s5", 1)([s2])
    _s6 = sort_with_arity("s6", 2)([_s3, _s4])

    input_list = [s3, s4, s5]
    sort_list = [_s3, _s4, _s5]
    d = {A: s1, B: s2}
    assert get_par_dict(input_list, sort_list) == d
    sort_list = [_s3, _s4]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, s4, s5]
    sort_list = [s2, _s3, _s4, _s5]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, s4, s5]
    sort_list = [A, _s3, _s4, _s5]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, s4, s5]
    sort_list = [s1, _s4, _s4, _s5]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, s4, s5]
    sort_list = [s1, _s3, _s4_, _s5]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, _s4, s5]
    sort_list = [s1, _s3, _s4, _s5]
    assert get_par_dict(input_list, sort_list) == d
    input_list = [A, s3, _s4, s5]
    sort_list = [s1, _s3, _s5, _s5]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, s4, s5]
    sort_list = [s1, _s3, 1, _s5]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, s4, s5]
    sort_list = [s1, _s3, sort_with_arity("s4", 2), _s5]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, sort_with_arity("s4", 2), s5]
    sort_list = [s1, _s3, _s4, _s5]
    assert get_par_dict(input_list, sort_list) == {}
    input_list = [A, s3, _s4, s5, s6]
    sort_list = [s1, _s3, _s4, _s5, _s6]
    d = {A: s1, B: s2, X: _s3, Y: _s4}
    assert get_par_dict(input_list, sort_list) == d


def test_get_repl_sort():
    s1 = Sort(Identifier('s1'))
    s2 = Sort(Identifier('s2'), [s1])
    sx = 'A'
    d = {'A': s1}
    assert _get_repl_sort(sx, d) == s1
    d = {'B': s1}
    assert _get_repl_sort(sx, d) == None 
    d = {'A': s1, 'B': s1}
    assert _get_repl_sort(sx, d) == s1
    sy = Sort(Identifier('sy'))
    _sy = Sort(Identifier('sy'))
    assert _get_repl_sort(sy, d) == _sy 
    sy = Sort(Identifier('sy'), [s1, 'A'])
    d = {'A': s2}
    _sy = Sort(Identifier('sy'), [s1, s2])
    assert _get_repl_sort(sy, d) == _sy 
    assert str(_get_repl_sort(sy, d)) == '(sy s1 (s2 s1))'
 

def test_match_fun_in_signatures():
    BOOL = Sort(Identifier('Bool'))
    INT = Sort(Identifier('Int'))
    ite = Fun(Identifier("ite"), [BOOL, INT, INT], INT)
    assert match_fun_in_signatures(Identifier('ite'), [BOOL, INT, INT], None, all_funs) == ite
    band = Fun(Identifier("and"), [BOOL, BOOL], BOOL)
    assert match_fun_in_signatures(Identifier('and'), [BOOL, BOOL], None, all_funs) == band 
    assert match_fun_in_signatures(Identifier('and'), [BOOL, BOOL], BOOL, all_funs) == band 
    assert match_fun_in_signatures(Identifier('and'), [BOOL, BOOL], INT, all_funs) == None 
    bv32 = BIT_VECTOR.get_indexed_instance([32])
    ite = Fun(Identifier("ite"), [BOOL, bv32, bv32], bv32)
    assert match_fun_in_signatures(Identifier('ite'), [BOOL, bv32, bv32], bv32, all_funs) == ite