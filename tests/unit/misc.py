import pytest

from smort.src.msic.utils import *
from smort.src.translate.Ast import Sort
from smort.src.translate.theory.utils import *


def test_list2str():
    l = [1, (3, (5, 6), 4), (1,)] 
    s = "1 (3 (5 6) 4) (1)"
    assert list2str(l) == s 
    l = [1]
    s = "1"
    assert list2str(l) == s 
    l = [1, (3, [5, 'a'], 4), (1,)] 
    s = "1 (3 (5 a) 4) (1)"
    assert list2str(l) == s 
    a_sort = Sort('a')
    b_sort = Sort('b')
    c_sort = Sort('c', [a_sort, b_sort])
    sorted_var_list = [['a', a_sort], ['b_d', b_sort], ['ckk', c_sort]]
    svl_str = "(a a) (b_d b) (ckk (c a b))"
    assert list2str(sorted_var_list) == svl_str 

def test_constraints():
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
    with pytest.raises(ValueError):
        f3 = eq_input_indices(-1, 1, 1)
    with pytest.raises(ValueError):
        f3 = eq_input_indices(1, 1, 1)
    with pytest.raises(ValueError):
        f3 = eq_input_indices(0, 1, 0)
    with pytest.raises(ValueError):
        f3 = eq_input_indices(2, 1, 1)
    with pytest.raises(ValueError):
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
    with pytest.raises(ValueError):
        f4 = get_number_of_binary_digits(1) 
    with pytest.raises(ValueError):
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