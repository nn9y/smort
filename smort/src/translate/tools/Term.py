import copy
from enum import Enum
import random

from smort.src.tools.utils import list2str
from smort.src.translate.tools.utils import *
from smort.src.translate.theory.available_sorts import *
from smort.src.translate.theory.SMTLIBv2Sorts import *


class TermType(Enum):
    CONST   = 0
    VAR     = 1
    EXPR    = 2
    QUANT   = 3
    LET     = 4
    MATCH   = 5
    ANNOT   = 6

QUANT_FORALL = 'forall'
QUANT_EXISTS = 'exists'


class TermScopeType(Enum):
    LOCAL_VAR   = 0
    GLOBAL_VAR  = 1
    GLOBAL_SIG  = 2
    PREDEF_SIG  = 3


def Const(name, sort=None):
    return Term(name=name, sort=sort, local_free_vars={}, term_type=TermType.CONST, global_free=True)

def Var(name, sort=None, qual_id=False, global_free=False):
    return Term(
        name=name,
        sort=sort,
        term_type=TermType.VAR,
        local_free_vars={str(name): sort},
        qual_id=qual_id,
        global_free=global_free,
    )

def Expr(name, subterms, sort=None, local_free_vars=None, qual_id=False):
    if not local_free_vars:
        local_free_vars = {} 
    global_free = True
    for s in subterms:
        if not s.global_free:
            global_free = False
    return Term(
        name=name,
        subterms=subterms,
        sort=sort,
        local_free_vars=local_free_vars,
        qual_id=qual_id,
        term_type=TermType.EXPR,
        global_free=global_free,
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
        global_free=let_term.global_free,
    )

def Quantifier(
        name,
        quantifier,
        sorted_vars,
        quantified_term,
        sort=None,
        local_free_vars=None
    ):
    if not local_free_vars:
        local_free_vars = {}
    return Term(
        name=name,
        quantifier=quantifier,
        sorted_vars=sorted_vars,
        subterms=[quantified_term],
        sort=sort,
        local_free_vars=local_free_vars,
        term_type=TermType.QUANT,
        global_free=quantified_term.global_free,
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
        global_free=term.global_free,
    )

def AnnotatedTerm(term, annotations, sort=None):
    return Term(
        subterms=[term],
        annotations=annotations,
        sort=sort,
        local_free_vars=term.local_free_vars,
        term_type=TermType.ANNOT,
        global_free=term.global_free,
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
        global_free=False,
        # pointers_map={},
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
        self.global_free = global_free
        # self.pointers_map = pointers_map
    
    def prefix_vars(self, prefix):
        """
        add prefix to variable names in self recursively
        """
        self.bound_vars = {prefix + key: value for key, value in self.bound_vars.items()}
        self.local_free_vars = {prefix + key: value for key, value in self.local_free_vars.items()}
        match self.term_type:
            case TermType.CONST:
                return
            case TermType.VAR:
                self.name = Identifier(prefix + self.name.symbol, self.name.indices)
                return
            case TermType.EXPR:
                for subterm in self.subterms:
                    subterm.prefix_vars(prefix)
            case TermType.LET:
                for i, vb in enumerate(self.var_bindings):
                    var, term = vb
                    # set
                    self.var_bindings[i][0] = prefix + var
                    term.prefix_vars(prefix)
                self.subterms[0].prefix_vars(prefix)
                return
            case TermType.QUANT:
                for i, sv in enumerate(self.sorted_vars):
                    var, _ = sv
                    # set
                    self.sorted_vars[i][0] = prefix + var
                self.subterms[0].prefix_vars(prefix)
                return
            case TermType.MATCH:
                self.subterms[0].prefix_vars(prefix)
                for i, mc in enumerate(self.match_cases):
                    pat, term = mc
                    if len(pat) > 1:
                        for j in range(1, len(pat)):
                            # set
                            self.match_cases[i][0][j] = prefix + pat[j]
                    else:
                        if pat[0] in term.bound_vars:
                            # set
                            # not nullary constructor
                            self.match_cases[i][0][0] = prefix + pat[0]
                    term.prefix_vars(prefix)
                return
            case TermType.ANNOT:
                self.subterms[0].prefix_vars(prefix)
    
    def find_terms(self, t, occs, global_free=False, inwards=False):
        """
        find terms match template t in self and add them to the list occs.

        global_free: if variables in the terms matched should be all global free
        inwards:     if could continue matching into a literal
        """
        if self.equals(t, global_free):
            if inwards:
                # 0.5 probability to step into subterms
                find_subterms = random.choice(['true', 'false'])
                if find_subterms:
                    occs_subterms = []
                    for subterm in self.subterms:
                        subterm.find_terms(t, occs_subterms, global_free, inwards)
                    # terms cannot intersect
                    if len(occs_subterms) > 0:
                        occs.extend(occs_subterms)
                        return
            # no subterms matched, use self
            occs.append(self)
        elif inwards:
            for subterm in self.subterms:
                subterm.find_terms(t, occs, global_free, inwards)

    def equals(self, other, global_free=False):
        """
        check if this term match other, which is the template term to be replaced
        """
        if not isinstance(other, Term):
            return False
        # special check for forall, match (find) the inner term recursively
        if (self.term_type == TermType.QUANT) and (self.quantifier == QUANT_FORALL):
            return self.subterms[0].equals(other, global_free) 
        if global_free and not self.global_free:
            return False
        # sort should be the same 
        if self.sort != other.sort:
            return False
        # term can be considered as a 'variable' in other
        # when other is an variable, or a constant and self is the same constant,
        # match successfully
        if len(other.subterms) == 0:
            if (self.term_type == TermType.CONST) and (self.name != other.name):
                return False
            return True
        # if other is an experssion:
        # constant value, operator of expr should be the same when other is the same type
        if ((self.term_type == TermType.CONST) or (self.term_type == TermType.EXPR)):
            if (self.term_type == other.term_type) and (self.name != other.name):
                return False
        # subterms should also match
        if len(self.subterms) != len(other.subterms):
            return False
        for i, subterm in enumerate(self.subterms):
            if not subterm.equals(other.subterms[i], global_free):
                return False
        return True
   
    def update_bound_vars(self, bound_vars):
        """
        Update bound vars of this term and its subterms recursively,
            until encounters let, quant, match which has been updated already
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
 
    def update_notation2term(self, other, notation2term: dict):
        """
        notation2term: dict, mapping from notations in term templates (others)
                        to actual terms (selfs) to be replaced, 
                        except for new functions, variables and constants in templates
        """
        if other.term_type in {TermType.CONST, TermType.VAR}:
            if (self.term_type == TermType.QUANT) and (self.quantifier == QUANT_FORALL):
                # special check for forall, replace inner term
                self.subterms[0].update_notation2term(other, notation2term)
            else:
                notation2term[str(other.name)] = self
            return
        # other is an experssion
        for i, t in enumerate(self.subterms):
            t.update_notation2term(other.subterms[i], notation2term)
 
    def replace_notation_by_term(self, repl_dict):
        """
        Replace notations in an template (self) by corresponding actual terms.

        This template could be repl template or fuse formula.
        """
        if self.term_type in {TermType.CONST, TermType.VAR}:
            # notation (variables) in template
            symbol = str(self.name)
            if symbol in repl_dict:
                self.__dict__ = copy.deepcopy(repl_dict[symbol].__dict__)
        else:
            for s in self.subterms:
                s.replace_notation_by_term(repl_dict)

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
                    expr = f"((as {self.name} {self.sort}) {list2str(self.subterms)})"
                    if len(self.subterms) == 0:
                        return expr[1:-1]
                    return expr 
                else:
                    expr = f"({self.name} {list2str(self.subterms)})"
                    if len(self.subterms) == 0:
                        return expr[1:-1]
                    return expr 

    def __repr__(self):
        return self.__str__()
    
    # def __deepcopy__(self, memo):
    #     """
    #     also "deepcopy" pointers map
    #     """
    #     term_copied = Term(
    #         name=copy.deepcopy(self.name),
    #         sort=copy.deepcopy(self.sort),
    #         term_type=copy.deepcopy(self.term_type),
    #         var_bindings=copy.deepcopy(self.var_bindings),
    #         quantifier=copy.deepcopy(self.quantifier),
    #         sorted_vars=copy.deepcopy(self.sorted_vars),
    #         match_cases=copy.deepcopy(self.match_cases),
    #         bound_vars=copy.deepcopy(self.bound_vars),
    #         annotations=copy.deepcopy(self.annotations),
    #         local_free_vars=copy.deepcopy(self.local_free_vars),
    #         qual_id=copy.deepcopy(self.qual_id),
    #     )
    #     memo[id(self)] = term_copied 
    #     term_copied.pointers_map = defaultdict(list) 
    #     for k, pointers in self.pointers_map.items():
    #         if self in pointers:
    #             term_copied.pointers_map[k].append(term_copied)
    #     term_copied.subterms = []
    #     for t in self.subterms:
    #         t.pointers_map = self.pointers_map
    #         t_copied = copy.deepcopy(t, memo)
    #         for k, pointers in t_copied.pointers_map.items():
    #             term_copied.pointers_map[k].extend(pointers)
    #         term_copied.subterms.append(t_copied)
    #     return term_copied 


def substitute(occs, repl, notation2term):
    """
    Substitute all terms in occs by repl template with notation2term dict.
    """
    for occ in occs:
        occ = copy.deepcopy(repl)
        occ.replace_notation_by_term(notation2term)

