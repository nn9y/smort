import copy
from enum import Enum

from SMTMR.src.translate.util import *

class SMTMRException(Exception):
    pass

class Status(Enum):
    SAT = 'sat'
    UNSAT = 'unsat'
    UNKNOWN = 'unknown'


class MRKeyword(Enum):
    GEN = ':gen'
    VAR = ':var'
    CONS = ':cons'
    SNIPPET = ':snippet'
    SEED = ':seed'

class SExperssion:
    def __init__(
        self,
        value=None,
        subsexprs=None,
    ):
        self.value = value
        self.subsexprs = subsexprs
    
    def __str__(self):
        if self.subsexprs:
            return f"({list2str(self.subsexprs)})"
        else:
            return f"{self.value}"

    def __repr__(self):
        if self.subsexprs:
            return f"({list2str(self.subsexprs)})"
        else:
            return f"{self.value}"

class NotationInfo:
    def __init__(self, formula_in=None, attributes=None):
        self.formula_in = formula_in
        self.attributes = attributes
    
    def __str__(self):
        str_ = "[Info:"
        if self.formula_in:
            str_ += " formula_in->" + self.formula_in
        if self.attributes:
            str_ += " attributes->"
            for attribute in self.attributes:
                str_ += " " + attribute.__str__()
        str_ += "]"
        return str_

class SubstTermGroup:
    def __init__(self, sorted_vars, repl_pairs):
        self.sorted_vars = sorted_vars
        self.repl_pairs = repl_pairs 
    
    def __str__(self):
        return f"(subst-term-group \
({list2str(self.sorted_vars, 2)}) {list2str(self.repl_pairs, 2)})"

    def __repr__(self):
        return f"(subst-term-group \
({list2str(self.sorted_vars, 2)}) {list2str(self.repl_pairs, 2)})"

class Method:
    def __init__(self, name, formula, attribute):
        self.name = name
        self.formula = formula
        self.attribute = attribute
    
    def __str__(self):
        str_ = (
            "[Method: name->" 
            + self.name 
            + " formula->" 
            + self.formula
            + " attribute->"
            + self.attribute.__str__()
            + "]"
        )
        return str_

class SMTMetamorphicRelations:
    def __init__(self, seeds, mutant, notations, subst_term_groups, methods, assert_term):
        self.seeds = seeds
        self.mutant = mutant
        self.notations = notations
        self.subst_term_groups = subst_term_groups
        self.methods = methods
        self.assert_term = assert_term
    
    def __str__(self):
        str_ = "SMTMR:\n"
        if self.seeds:
            str_ += "\tseeds:\n"
            for symbol, status in self.seeds.items():
                str_ += "\t\t" + symbol + ", " + status.value + "\n"
        if self.mutant:
            str_ += "\tmutant:\n\t\t" + self.mutant[0] + ", " + self.mutant[1].value + "\n"        
        if self.notations:
            str_ += "\tnotations:\n"
            for symbol, info in self.notations.items():
                str_ += "\t\t" + symbol + ", " + info.__str__() + "\n"
        if self.subst_term_groups:
            str_ += "\tsubst term groups:\n"
            for subst_term_group in self.subst_term_groups:
                str_ += "\t\t" + subst_term_group.__str__() + "\n"
        if self.methods:
            str_ += "\tmethods:\n"
            for method in self.methods:
                str_ += "\t\t" + method.__str__() + "\n"
        if self.assert_term:
            str_ += "\tassert:\n" + self.assert_term.__str__() + "\n"

        return str_


