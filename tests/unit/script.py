from smort.src.translate.smtlibv2.ScriptVisitor import *

def test_is_valid_sort():
    id_ = Identifier('BitVec', [32])
    sv = ScriptVisitor()
    sort = Sort(id_, [])
    assert sv._is_valid_sort('BitVec', sort) == True