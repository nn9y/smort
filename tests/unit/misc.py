from smort.src.msic.utils import *
from smort.src.translate.Ast import Sort


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

