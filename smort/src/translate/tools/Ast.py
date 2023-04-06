import copy
from inspect import isfunction

from smort.src.tools.StrEnum import StrEnum
from smort.src.tools.utils import list2str
from smort.src.translate.tools.utils import *

### !!! TODO !!!
### check synonyms in sort
###

### !!! TODO !!!
### identifier symbol match string 
###

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
                # ⚠️ assuming parsort cannot be nested parametric sort template
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



class TermType(Enum):
    CONST   = 0
    VAR     = 1
    EXPR    = 2
    QUANT   = 3
    LET     = 4
    MATCH   = 5
    ANNOT   = 6



def Const(name, sort=None):
    return Term(name=name, sort=sort, local_free_vars={}, term_type=TermType.CONST)

def Var(name, sort=None, qual_id=False):
    return Term(
        name=name,
        sort=sort,
        term_type=TermType.VAR,
        local_free_vars={str(name): sort},
        qual_id=qual_id,
    )

def Expr(name, subterms, sort=None, local_free_vars=None, qual_id=False):
    if not local_free_vars:
        local_free_vars = {} 
    return Term(
        name=name,
        subterms=subterms,
        sort=sort,
        local_free_vars=local_free_vars,
        qual_id=qual_id,
        term_type=TermType.EXPR,
    )

def LetBinding(var_bindings, let_term, sort=None, local_free_vars=None):
    if not local_free_vars:
        local_free_vars = {} 
    return Term(
        var_bindings=var_bindings,
        subterms=[let_term],
        sort=sort,
        local_free_vars=local_free_vars,
        term_type=TermType.LET,
    )

def Quantifier(quantifier,
               sorted_vars,
               quantified_term,
               sort=None,
               local_free_vars=None):
    if not local_free_vars:
        local_free_vars = {}
    return Term(
        quantifier=quantifier,
        sorted_vars=sorted_vars,
        subterms=[quantified_term],
        sort=sort,
        local_free_vars=local_free_vars,
        term_type=TermType.QUANT,
    )

def Match(term, match_cases, sort=None, local_free_vars=None):
    if not local_free_vars:
        local_free_vars = {}
    return Term(
        subterms=[term],
        match_cases=match_cases,
        sort=sort,
        local_free_vars=local_free_vars,
        term_type=TermType.MATCH,
    )

def AnnotatedTerm(term, annotations, sort=None):
    return Term(
        subterms=[term],
        annotations=annotations,
        sort=sort,
        local_free_vars=term.local_free_vars,
        term_type=TermType.ANNOT,
    )


class Term:
    def __init__(
        self,
        name=None,
        sort=None,
        term_type=None,
        quantifier=None,
        sorted_vars=[],
        var_bindings=[],
        match_cases=[],
        bound_vars={},
        subterms=[],
        annotations=[],
        local_free_vars={},
        qual_id=False,
    ):
        self._set(
            name=name,
            sort=sort,
            term_type=term_type,
            var_bindings=var_bindings,
            quantifier=quantifier,
            sorted_vars=sorted_vars,
            match_cases=match_cases,
            bound_vars=bound_vars,
            subterms=subterms,
            annotations=annotations,
            local_free_vars=local_free_vars,
            qual_id=qual_id,
        )
 
    def _set(
        self,
        name=None,
        sort=None,
        term_type=None,
        quantifier=None,
        sorted_vars=None,
        var_bindings=None,
        match_cases=None,
        bound_vars=None,
        subterms=None,
        annotations=None,
        local_free_vars=None,
        qual_id=False,
    ):
        self.name = name
        self.sort = sort
        self.term_type = term_type
        self.var_bindings = var_bindings
        self.quantifier = quantifier
        self.sorted_vars = sorted_vars 
        self.match_cases = match_cases
        self.bound_vars = bound_vars
        self.subterms = subterms
        self.annotations = annotations
        self.local_free_vars = local_free_vars
        self.qual_id = qual_id

    def equals(self, other, free=False):
        """
        check if this term match other, the template term to be replaced
        """
        if not isinstance(other, Term):
            return False
        if self.term_type != other.term_type:
            return False
        # sort of function could be None (Unknown)
        if ((self.term_type == TermType.CONST) or (self.term_type == TermType.VAR)):
            if self.sort != other.sort:
                return False
            if free:
                if str(self.name) in self.bound_vars:
                    return False
        # if self.sort != other.sort:
        #     return False
        # name of cons, exprs should be the same
        if ((self.term_type == TermType.CONST) or (self.term_type == TermType.EXPR)):
            if self.name != other.name:
                return False
        # only deal with cons, vars, exprs in current implementation
        # other.term_type won't be following types
        # if (
        #     (self.term_type == TermType.QUANT)
        #     or (self.term_type == TermType.LET)
        #     or (self.term_type == TermType.MATCH)
        #     or (self.term_type == TermType.ANNOT)
        # ):
        #     return False
        if len(self.subterms) != len(other.subterms):
            return False
        for i, t in enumerate(self.subterms):
            if not t.equals(other.subterms[i], free):
                return False
        return True
    
    def update_bound_vars(self, bound_vars):
        """
        update bound vars of this term and its subterms recursively
        """
        self.bound_vars = bound_vars
        match self.term_type:
            # ScriptVisitor spread local vars and bound vars top down
            # but call this method bottom up
            # We want to update bound vars for each term just once
            case TermType.LET | TermType.QUANT | TermType.MATCH:
                return
        for t in self.subterms:
            t.update_bound_vars(bound_vars)
 
    def update_var_name_mapping(self, other, var_name_map):
        """
        update var_name_map of a tuple of terms (to be replaced)
            except for new variables and constants
        """
        if self.term_type == TermType.VAR:
            var_name_map[str(other.name)] = self.name
        for i, t in enumerate(self.subterms):
            t.update_var_name_mapping(other.subterms[i], var_name_map)
 
    def find_all_terms(self, t, occs, free=False):
        """
        find all terms t in self and add them to the list occs.
        """
        if self.equals(t, free):
            # self.update_var_name_mapping(t, var_name_map)
            return occs.append(self)
        if self.subterms:
            for subterm in self.subterms:
                subterm.find_all_terms(t, occs, free)
    
    def replace_var_name(self, var_name_map):
        if self.term_type == TermType.VAR:
            # exists in seed 
            symbol = str(self.name)
            if symbol in var_name_map:
                self.name = var_name_map[symbol]
        else:
            for s in self.subterms:
                s.replace_var_name(var_name_map)

    # def substitute(self, t, repl, var_name_map, free=False):
    def substitute(self, occs, repl, var_name_map):
        """
        substitute all terms in occs by repl.
        """
        # occs = []
        # self.find_all_terms(t, occs, var_name_map, free)
        for occ in occs:
            r = copy.deepcopy(repl)
            r.replace_var_name(var_name_map)
            occ._set(
                name=copy.deepcopy(r.name),
                sort=copy.deepcopy(r.sort),
                term_type=copy.deepcopy(r.term_type),
                var_bindings=copy.deepcopy(r.var_bindings),
                quantifier=copy.deepcopy(r.quantifier),
                sorted_vars=copy.deepcopy(r.sorted_vars),
                match_cases=copy.deepcopy(r.match_cases),
                bound_vars=copy.deepcopy(r.bound_vars),
                subterms=copy.deepcopy(r.subterms),
                annotations=copy.deepcopy(r.annotations),
                local_free_vars=occ.local_free_vars,
                qual_id=occ.qual_id,
            )

    def replace_symbols_by_terms(self, repl_dict):
        """
        replace formula symbols by formula (merged assertion term) instances
        """
        if self.term_type == TermType.VAR:
            # formula symbol
            repl = repl_dict[str(self.name)]
            self._set(
                name=copy.deepcopy(repl.name),
                sort=copy.deepcopy(repl.sort),
                term_type=copy.deepcopy(repl.term_type),
                var_bindings=copy.deepcopy(repl.var_bindings),
                quantifier=copy.deepcopy(repl.quantifier),
                sorted_vars=copy.deepcopy(repl.sorted_vars),
                match_cases=copy.deepcopy(repl.match_cases),
                bound_vars=copy.deepcopy(repl.bound_vars),
                subterms=copy.deepcopy(repl.subterms),
                annotations=copy.deepcopy(repl.annotations),
                local_free_vars=copy.deepcopy(repl.local_free_vars),
                qual_id=copy.deepcopy(repl.qual_id),
            )
            return
        for t in self.subterms:
            t.replace_symbols_by_terms(repl_dict)

    def __eq__(self, other):
        if not isinstance(other, Term):
            return False
        if self.name != other.name:
            return False
        if self.sort != other.sort:
            return False
        if self.term_type != other.term_type:
            return False
        if self.quantifier != other.quantifier:
            return False
        if self.sorted_vars != other.sorted_vars:
            return False
        if self.var_bindings != other.var_bindings:
            return False
        if self.match_cases != other.match_cases:
            return False
        # bound vars can be different, for example:
        # ( forall (x Int) (y Int) ( exists (z Int) (> (+ x y) z) ) )
        # ( exist (m Bool) (=> ( forall (x Int) (y Int) ( exists (z Int) (> (+ x y) z) ) ) ( not m ) ) )
        if self.subterms != other.subterms:
            return False
        # local free vars is decided by other members
        if self.annotations != other.annotations:
            return False
        # parent can be different
        return True

    def __str__(self):
        match self.term_type:
            case TermType.LET:
                return f"(let ({list2str(self.var_bindings)}) {self.subterms[0]})"
            case TermType.QUANT:
                return f"({self.quantifier} ({list2str(self.sorted_vars)}) {self.subterms[0]})"
            case TermType.MATCH:
                return f"(match {self.subterms[0]} ({list2str(self.match_cases)}))"
            case TermType.ANNOT:
                return f"(! {self.subterms[0]} {list2str(self.annotations)})"
            case TermType.CONST:
                return f"{self.name}"
            case TermType.VAR:
                if self.qual_id:
                    return f"(as {self.name} {self.sort})"
                else:
                    return f"{self.name}"
            case TermType.EXPR:
                if self.qual_id:
                    return f"((as {self.name} {self.sort}) {list2str(self.subterms)})"
                else:
                    return f"({self.name} {list2str(self.subterms)})"

    
    def __repr__(self):
        return self.__str__()
