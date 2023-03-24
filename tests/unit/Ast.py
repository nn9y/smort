import pytest

from smort.src.translate.Ast import Identifier, Sort
from smort.src.translate.theory.Fun import sort_with_arity
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
