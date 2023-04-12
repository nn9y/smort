from smort.src.translate.tools.Sort import Identifier, Sort
from smort.src.translate.theory.Fun import Fun
from smort.src.translate.theory.available_sorts import BOOL 

# Algebraic Data Type

class ADT(Sort):
    def __init__(self, id_=None, parsorts=None):
        super().__init__(id_, parsorts, None)
        self.constructors = {} 
        self.selectors_of_constructor = {} 


def declare_datatype(name: str, arity: int):
    """
    (maybe) Parametric ADT.

    arity: an non-negative integer, length of adt.parsorts.
    """
    if arity == 0:
        return ADT(Identifier(name))
    def _parametric_sort(par_list: list):
        """
        Called in construction of the parametric adt to fill parameter placeholder (string)
        """
        if len(par_list) != arity:
            raise ValueError(f"length of 'par_list' should be {arity}")
        return ADT(Identifier(name), par_list)
    return _parametric_sort


def add_functions_of_datatype(constructor_dec, adt: ADT, par_list=None):
    """
    Add relating Constructor, Tester, and Selectors from one constructor_dec of ADT
    """
    constructor_name, selector_decs = constructor_dec.name, constructor_dec.sdecs
    tester_id = get_tester_id_of_constructor(constructor_name) 
    constructor_input_list = []
    selector_list = []
    for selector_name, sort in selector_decs:
        selector_list.append(
                                Fun(
                                    Identifier(selector_name),
                                    [adt],
                                    sort,
                                    par_list
                                )
                            )
        constructor_input_list.append(sort)
    constructor = Fun(
                    Identifier(constructor_name),
                    constructor_input_list,
                    adt,
                    par_list
                )
    # add constructor and selectors to ADT
    adt.constructors[str(constructor_name)] = constructor
    adt.selectors_of_constructor[str(constructor_name)] = selector_list
    tester = Fun(
                    tester_id,
                    [adt],
                    BOOL,
                    par_list
                )
    return [constructor, tester] + selector_list 


def get_tester_id_of_constructor(constructor_name):
    return Identifier("is", indices=[constructor_name])

