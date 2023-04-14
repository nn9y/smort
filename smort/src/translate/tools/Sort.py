import copy
from inspect import isfunction
from smort.src.tools.utils import list2str, StrEnum


class SpecConstType(StrEnum):
    NUMERAL     = 'NUMERAL'
    DECIMAL     = 'DECIMAL'
    HEXADECIMAL = 'HEXADECIMAL'
    BINARY      = 'BINARY'
    STRING      = 'STRING'
    B_VALUE     = 'B_VALUE'



class SpecConstant:
    def __init__(self, const_type, value=None):
        self.const_type = const_type
        self.value = value
    
    def __eq__(self, other):
        if not isinstance(other, SpecConstant):
            return False
        if self.const_type != other.const_type:
            return False
        if self.value != other.value:
            return False
        return True 
    
    def __str__(self):
        return str(self.value)

    def __repr__(self):
        return self.__str__()


class Identifier:
    def __init__(self, symbol: str, indices=[]):
        self.symbol = symbol
        self.indices = indices  # dict{'len': <int>} or list
 
    def get_indexed_instance(self, indices, constraint=None):
        if isinstance(self.indices, list):
            return copy.deepcopy(self)
        if isfunction(constraint) and (not constraint(indices)):
            return None
        return Identifier(copy.deepcopy(self.symbol), indices)
    
    def same_indexed_type(self, other):
        if not isinstance(other, Identifier):
            return False
        if self.symbol != other.symbol:
            return False
        self_len = self.indices["len"] if isinstance(self.indices, dict) else len(self.indices)
        other_len = other.indices["len"] if isinstance(other.indices, dict) else len(other.indices)
        if self_len != other_len:
            return False
        return True

    def __eq__(self, other):
        if not isinstance(other, Identifier):
            return False
        if self.symbol != other.symbol:
            return False
        self_len = self.indices["len"] if isinstance(self.indices, dict) else len(self.indices)
        other_len = other.indices["len"] if isinstance(other.indices, dict) else len(other.indices)
        if self_len == 0 and other_len == 0:
            # special case for 'len' = 0 and []
            return True
        if self.indices != other.indices:
            return False
        return True 
    
    def __str__(self):
        return (
            f"(_ {self.symbol} {list2str(self.indices)})"
            if isinstance(self.indices, list) and len(self.indices) > 0
            else self.symbol
        )

    def __repr__(self):
        return self.__str__()
    
    def __hash__(self):
        return hash((self.symbol, tuple(self.indices)))


class Sort:
    def __init__(self, id_=None, parsorts=[], constraint=None):
        self.id_ = id_ 
        self.parsorts = parsorts    # list of Sort or str
        self.constraint = constraint

    def get_indexed_instance(self, indices):
        id_instance = self.id_.get_indexed_instance(indices, self.constraint)
        if id_instance:
            return Sort(id_instance, copy.deepcopy(self.parsorts))
        else:
            return None

    def get_parametric_instance(self, parsort_dict):
        parsorts_instance = []
        for par in self.parsorts:
            if isinstance(par, Sort):
                # assume parsort cannot be nested parametric sort template
                parsorts_instance.append(par)
            elif isinstance(par, str) and (par in parsort_dict):
                parsorts_instance.append(parsort_dict[par])
            else:
                return None
        return Sort(copy.deepcopy(self.id_), parsorts_instance)
 
    def same_indexed_type(self, other):
        """
        - id_ should be same indexed type
        - element in parsorts:
            - if both are Sort: should be same indexed type
            - if one is str: ignore 
        """
        if not isinstance(other, Sort):
            return False
        if not self.id_.same_indexed_type(other.id_):
            return False
        if len(self.parsorts) != len(other.parsorts):
            return False
        for i, parsort in enumerate(self.parsorts):
            if isinstance(parsort, str) or isinstance(other.parsorts[i], str):
                continue
            elif not parsort.same_indexed_type(other.parsorts[i]):
                return False
        return True

    def same_parametric_type(self, other):
        """
        - id_ should be same indexed type
        - length of parsorts should equal:
        """
        if isfunction(other):
            if other(self.parsorts):
                return True
            return False
        if isinstance(other, Sort):
            if not self.id_.same_indexed_type(other.id_):
                return False
            if len(self.parsorts) != len(other.parsorts):
                return False
            return True
        return False
    
    def same_type(self, other):
        """
        (same_indexed_type) or (same_parametric_type)
        but the constraints of the latter are contained in the former
        """
        return self.same_parametric_type(other)
 
    def __eq__(self, other):
        if not isinstance(other, Sort):
            return False
        if self.id_ != other.id_ :
            return False
        if self.parsorts != other.parsorts:
            return False
        return True
    
    def __str__(self):
        return (
            f"({str(self.id_)} {list2str(self.parsorts)})"
            if len(self.parsorts) > 0
            else str(self.id_)
        )

    def __repr__(self):
        return self.__str__()
    
    def __hash__(self):
        return hash((self.id_, tuple(self.parsorts)))


class SExperssion:
    """
    s_expr
        : spec_constant
        | symbol
        | keyword
        | ParOpen s_expr* ParClose
        ;
    """
    def __init__(
        self,
        value=None,
        subsexprs: list = None
    ):
        """
        (value == None) xor (subsexprs == None)
        """
        self.value = value          # spec_constant, symbol, or keyword
        self.subsexprs = subsexprs  # ( s_expr* )
 
    def __eq__(self, other):
        if not isinstance(other, SExperssion):
            return False
        if self.value != other.value:
            return False
        if self.subsexprs != other.subsexprs:
            return False
        return True

    def __str__(self):
        return str(self.value) if self.value else f"({list2str(self.subsexprs)})"

    def __repr__(self):
        return self.__str__()


class AttributeValue:
    """
    attribute_value
        : spec_constant
        | symbol
        | ParOpen s_expr* ParClose
        ;
    """
    def __init__(
        self,
        value=None,
        sexprs: list = None
    ):
        """
        (value == None) xor (sexprs == None)
        """
        self.value = value      # spec_constant or symbol
        self.sexprs = sexprs    # ( s_expr* )

    def __eq__(self, other):
        if not isinstance(other, AttributeValue):
            return False
        if self.value != other.value:
            return False
        if self.sexprs != other.sexprs:
            return False
        return True
 
    def __str__(self):
        return str(self.value) if self.value else f"({list2str(self.sexprs)})"

    def __repr__(self):
        return self.__str__()


class Attribute:
    def __init__(self, keyword, value=None):
        self.keyword = keyword
        self.value = value

    def __eq__(self, other):
        if not isinstance(other, Attribute):
            return False
        if self.keyword != other.keyword:
            return False
        if self.value != other.value:
            return False
        return True
 
    def __str__(self):
        return (
            f"{self.keyword} {self.value}"
            if self.value
            else f"{self.keyword}"
        )

    def __repr__(self):
        return self.__str__()


def indexed_sort(symbol: str, indices_len, constraint=None):
    """
    Indexed sort.
    indices == dict("len": indices_len) is a marker for indexed sort template. 

    indices_len: an positive integer.
    constraint: function that indices of sort should satisfy.
    """
    return Sort(Identifier(symbol, {"len": indices_len}), [], constraint)


def sort_with_arity(symbol: str, arity: int):
    """
    (maybe) Parametric sort.

    arity: an non-negative integer, length of sort.parsorts.
    """
    if arity == 0:
        return Sort(Identifier(symbol))
    def _parametric_sort(par_list: list):
        """
        Called in construction of the parametric sort to fill parameter placeholder (string)
        """
        if len(par_list) != arity:
            raise ValueError(f"length of 'par_list' should be {arity}")
        return Sort(Identifier(symbol), par_list)
    return _parametric_sort


# def indexed_sort_with_arity(symbol: str, indices_len, arity, constraint=None):
#     if indices_len <= 0:
#         raise TheoryException("'indices_len' should be an positive number")
#     if arity < 0:
#         raise TheoryException("'arity' should be non-negative integer")
#     id_ = Identifier(symbol, {"len": indices_len})
#     if arity == 0:
#         return Sort(id_, [], constraint)
#     def _indexed_parametric_sort(pars: list):
#         if len(pars) != arity:
#             raise TheoryException(f"length of 'pars' should be {arity}")
#         return Sort(id_, pars, constraint)
#     return _indexed_parametric_sort

