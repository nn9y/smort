from smort.src.translate.smtmr.MetamorphicRelation import *
from smort.src.translate.tools.Ast import Attribute 

def test_keyword():
    k1 = SMTMRKeyword.CONS
    assert str(k1) == ':cons'