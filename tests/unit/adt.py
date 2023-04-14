from inspect import isfunction
import pytest

from smort.src.translate.theory.SMTLIBv2Sorts import *
from smort.src.translate.smtlibv2.ADT import *
from smort.src.translate.smtlibv2.Script import *


def test_adt():
    # declare ADT
    adt0 = declare_datatype('adt0', 0)
    assert isinstance(adt0, ADT)
    adt1 = declare_datatype('adt1', 2)
    assert isfunction(adt1)
    adt1_instance = adt1([X, Y])
    assert isinstance(adt1_instance, Sort)
    assert isinstance(adt1_instance, ADT)
    assert adt1_instance.id_ == Identifier('adt1')
    assert len(adt1_instance.parsorts) == 2 
    assert adt1_instance.parsorts == [X, Y] 
    assert adt1_instance.constructors == {}
    assert adt1_instance.selectors_of_constructor == {}
    with pytest.raises(ValueError):
        wrong_adt1_instance = adt1([A, X, Y])
    with pytest.raises(ValueError):
        wrong_adt1_instance = adt1([X])
    # get tester id
    cons_nil_name = "nil"
    tester_nil_id = get_tester_id_of_constructor(cons_nil_name)
    assert isinstance(tester_nil_id, Identifier)
    assert str(tester_nil_id) == f'(_ is {cons_nil_name})'
    # add constructor, tester, selectors
    sel_b1_name ='B1'
    sel_b2_name ='B2'
    sel_dec1 = [sel_b1_name, BOOL]
    sel_dec2 = [sel_b2_name, adt1_instance]
    cons_concat_name = 'concat'
    cons_concat_dec = ConstructorDec(cons_concat_name, [sel_dec1, sel_dec2])
    funs_list = add_functions_of_datatype(cons_concat_dec, adt1_instance, [X, Y])
    assert len(funs_list) == 4
    cons_concat, test_concat = funs_list[0], funs_list[1]
    sel_concat_list = funs_list[2:]
    assert adt1_instance.constructors[cons_concat_name] == cons_concat
    assert adt1_instance.constructors[cons_concat_name] is cons_concat
    test_concat_id = get_tester_id_of_constructor(cons_concat_name)
    assert test_concat.name == test_concat_id
    assert adt1_instance.selectors_of_constructor[cons_concat_name] == sel_concat_list
    sel_kkk1_name ='KKK1'
    sel_kkk2_name ='KKK2'
    sel_kkk1_dec = [sel_kkk1_name, BOOL]
    sel_kkk2_dec = [sel_kkk2_name, adt1_instance]
    cons_car_name = 'car'
    cons_car_dec = ConstructorDec(cons_car_name, [sel_kkk1_dec, sel_kkk2_dec])
    funs_list = add_functions_of_datatype(cons_car_dec, adt1_instance, [X, Y])
    assert len(funs_list) == 4
    cons_car, test_car = funs_list[0], funs_list[1]
    sel_car_list = funs_list[2:]
    assert adt1_instance.constructors[cons_car_name] == cons_car
    assert adt1_instance.constructors[cons_car_name] is cons_car
    test_car_id = get_tester_id_of_constructor(cons_car_name)
    assert test_car.name == test_car_id
    assert adt1_instance.selectors_of_constructor[cons_car_name] == sel_car_list
    assert len(adt1_instance.constructors) == 2
    # adt2
    adt2 = declare_datatype('adt2', 0)
    sel_cc_name = 'cc'
    sel_dd_name = 'dd'
    sel_cc_dec = [sel_cc_name, INT]
    sel_dd_dec = [sel_dd_name, INT]
    cons_ff_name = 'ff'
    cons_ff_dec = ConstructorDec(cons_ff_name, [sel_cc_dec, sel_dd_dec])
    funs_list = add_functions_of_datatype(cons_ff_dec, adt2)
    assert len(funs_list) == 4
    cons_ff = funs_list[0]
    assert adt2.constructors[cons_ff_name] == cons_ff
    assert cons_ff.par_list == None
