import copy
from enum import Enum
from inspect import isfunction
from util import *

class SpecConstType(Enum):
    NUMERAL = 'numeral'
    DECIMAL = 'decimal'
    HEXADECIMAL = 'hexadecimal'
    BINARY = 'binary'
    STRING = 'string'
    B_VALUE = 'b_value'


class Quantifier(Enum):
    FORALL = 'forall'
    EXISTS = 'exists'


class SpecConstant:
    def __init__(self, const_type, value):
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
    def __init__(self, symbol, indices=[]):
        self.symbol = symbol
        self.indices = indices
    
    def get_indexed_instance(self, indices, constraint=None):
        if self.indices:
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
        if self.indices != other.indices:
            return False
        return True 
    
    def __str__(self):
        return (
            f"( _ {self.symbol} {list2str(self.indices)})"
            if len(self.indices) > 0
            else self.symbol
        )

    def __repr__(self):
        return self.__str__()


class Sort:
    def __init__(self, id_=None, subsorts=[], constraint=None):
        self.id_ = id_ 
        self.subsorts = subsorts
        self.constraint = constraint
    
    def get_parametric_instance(self, subsort_dict):
        if len(self.subsorts) != len(subsort_dict):
            return None
        else:
            subsorts_instance = []
            for par in self.subsorts:
                if par in subsort_dict:
                    subsorts_instance.append(subsort_dict[par])
                else:
                    return None
            return Sort(self.id_, subsorts_instance)
 
    def get_indexed_instance(self, indices):
        id_instance = self.id_.get_indexed_instance(indices, self.constraint)
        if id_instance:
            return Sort(id_instance, copy.deepcopy(self.subsorts))
        else:
            return None
    
    def same_indexed_type(self, other):
        if not isinstance(other, Sort):
            return False
        if not self.id_.same_indexed_type(other.id_):
            return False
        if len(self.subsorts) != len(other.subsorts):
            return False
        for i in range(len(self.subsorts)):
            if not self.subsorts[i].same_indexed_type(other.subsorts[i]):
                return False
        return True

    def same_parametric_type(self, other):
        if not isinstance(other, Sort):
            return False
        if not self.id_.same_indexed_type(other.id_):
            return False
        if len(self.subsorts) != len(other.subsorts):
            return False
        return True
    
    def __eq__(self, other):
        if not isinstance(other, Sort):
            return False
        if self.id_ != other.id_ :
            return False
        if self.subsorts != other.subsorts:
            return False
        return True
    
    def __str__(self):
        return (
            f"({str(self.id_)} {list2str(self.subsorts)})"
            if len(self.subsorts) > 0
            else str(self.id_)
        )

    def __repr__(self):
        return self.__str__()


class AttributeValue:
    """
    value == None xor sexprs == None
    """
    def __init__(
        self,
        value=None,
        sexprs=None
    ):
        self.value = value
        self.sexprs = sexprs

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
            f"{self.keyword} {str(self.value)}"
            if self.value
            else self.keyword
        )

    def __repr__(self):
        return self.__str__()


def Const(name, sort=None):
    return Term(name=name, sort=sort, is_const=True)

def Var(name, sort=None):
    """
    variable or a nullary constructor of sort
    """
    return Term(name=name, sort=sort, is_var=True)

def Expr(name, subterms, sort=None):
    return Term(name=name, subterms=subterms, sort=sort)

def LetBinding(var_bindings, let_term, sort=None):
    return Term(
        var_bindings=var_bindings,
        subterms=[let_term],
        sort=sort
    )

def Quantifier(quantifier, quantified_vars, quantified_term, sort=None):
    return Term(
        quantifier=quantifier,
        quantified_vars=quantified_vars,
        subterms=[quantified_term],
        sort=sort
    )

def Match(term, match_cases, sort=None):
    return Term(
        subterms=[term],
        match_cases=match_cases,
        sort=sort
    )

def AnnotatedTerm(term, annotations, sort=None):
    return Term(
        subterms=[term],
        annotations=annotations,
        sort=sort
    )


class Term:
    def __init__(
        self,
        name=None,
        sort=None,
        is_const=False,
        is_var=False,
        annotations=None,
        quantifier=None,
        quantified_vars={},
        var_bindings=None,
        subterms=[],
        parent=None,
    ):
        self._set(
            name=name,
            sort=sort,
            is_const=is_const,
            is_var=is_var,
            annotations=annotations,
            quantifier=quantifier,
            quantified_vars=quantified_vars,
            var_bindings=var_bindings,
            subterms=subterms,
            parent=parent,
        )
        self._add_parent_pointer()
    
    def _set(
        self,
        name=None,
        sort=None,
        is_const=False,
        is_var=False,
        annotations=None,
        quantifier=None,
        quantified_vars={},
        var_bindings=None,
        subterms=None,
        parent=None,
    ):
        self.name = name
        self.sort = sort
        self.is_const = is_const
        self.is_var = is_var
        self.annotations = annotations
        self.quantifier = quantifier
        self.quantified_var = quantified_vars
        self.var_bindings = var_bindings
        self.subterms = subterms
        self.parent = parent
    
    def _add_parent_pointer(self):
        if self.subterms:
            for term in self.subterms:
                # TODO
                if not isinstance(term, str):
                    term.parent = self
    
    def find_all_terms(self, t, occs):
        """
        Find all terms t in self and add them to the list occs.
        """
        if self == t:
            return occs.append(t)
        if self.subterms:
            for subterm in self.subterms:
                subterm.find_all_terms(t, occs)
    
    def substitute(self, t, repl):
        """
        Substitute all terms t in self by repl.
        """
        occs = []
        self.find_all_terms(t, occs)
        for occ in occs:
            occ._set(
                name=copy.deepcopy(repl.name),
                sort=copy.deepcopy(repl.sort),
                is_const=copy.deepcopy(repl.is_const),
                is_var=copy.deepcopy(repl.is_var),
                annotations=copy.deepcopy(repl.annotations),
                quantifier=copy.deepcopy(repl.quantifier),
                quantified_var=copy.deepcopy(repl.quantified_vars),
                var_bindings=copy.deepcopy(repl.var_bindings),
                subterms=copy.deepcopy(repl.subterms),
                parent=occ.parent,
            )
    
    def __eq__(self, other):
        if not isinstance(other, Term):
            return False
        if self.name != other.name:
            return False
        if self.sort != other.sort:
            return False
        if self.is_const != other.is_const:
            return False
        if self.is_var != other.is_var:
            return False
        if self.annotations != other.annotations:
            return False
        if self.quantifier != other.quantifier:
            return False
        if self.quantified_var != other.quantified_var:
            return False
        if self.var_bindings != other.var_bindings:
            return False
        if self.let_term != other.let_term:
            return False
        if self.subterms != other.subterms:
            return False
        if self.parent != other.parent:
            return False
        return True
    
    def __str__(self):
        return "TODO"
    
    def __repr__(self):
        return self.__str__()
