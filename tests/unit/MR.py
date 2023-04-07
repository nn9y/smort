from smort.src.translate.smtmr.MetamorphicRelation import *
# from smort.src.translate.tools.Sort import Attribute 

def test_keyword():
    k1 = SMTMRKeyword.CONS
    assert str(k1) == ':cons'