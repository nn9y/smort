import copy
from enum import Enum

class SMTMRException(Exception):
    pass

class Status(Enum):
    SAT = 'sat'
    UNSAT = 'unsat'
    UNKNOWN = 'unknown'

def text_to_status(text):
    try:
        status = Status(text)
        return status
    except ValueError:
        raise AstException(f"'{text}' is not a valid status")

class Quantifier(Enum):
    FORALL = 'forall'
    EXISTS = 'exists'

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
        is_spec_const=False,
        is_symbol=False,
        is_keyword=False,
        subsexprs=None,
    ):
        self.value = value
        self.is_spec_const = is_spec_const
        self.is_symbol = is_symbol
        self.is_keyword = is_keyword
        self.subsexprs = subsexprs
    
    def __str__(self):
        str_ = "[s_expr: value->" + str(self.value)
        if self.subsexprs:
            str_ += " sub-s_exprs->"
            for subsexpr in self.subsexpr:
                str_ += " " + subsexpr.__str__()
        str_ += "]"
        return str_

class Identifier:
    def __init__(self, symbol, indices=None):
        self.symbol = symbol
        self.indices = indices
    
    def __str__(self):
        str_ = "[Identifier: symbol->" + self.symbol
        if self.indices:
            str_ += " indices->"
            for index in self.indices:
                str_ += " " + str(index)
        str_ += "]"
        return str_

class AttributeValue:
    def __init__(
        self,
        value=None,
        is_sepc_const=False,
        is_symbol=False,
        sexprs=None
    ):
        self.value = value
        self.is_sepc_const = is_sepc_const
        self.is_symbol = is_symbol
        self.sexprs = sexprs
    
    def __str__(self):
        str_ = "[AttrValue: value->" + str(self.value)
        if self.sexprs:
            str_ += " sexprs->"
            for sexpr in self.sexpr:
                str_ += " " + sexpr.__str__()
        str_ += "]"
        return str_

class Attribute:
    def __init__(self, keyword, value):
        self.keyword = keyword
        self.value = value
 
    def __str__(self):
        str_ = "[Attr: keyword->" + self.keyword 
        if self.value:
            str_ += " value->" + self.value.__str__()
        str_ += "]"
        return str_

class Sort:
    def __init__(self, id_=None, subsorts=None):
        self.id_ = id_
        self.subsorts = subsorts
    
    def __str__(self):
        str_ = "[sort: id->" + self.id_.__str__()
        if self.subsorts:
            str_ += " subsorts->"
            for sort in self.subsorts:
                str_ += " " + sort.__str__()
        str_ += "]"
        return str_

class Term:
    def __init__(self, sort=None, subterms=None):
        self._initialize(sort=sort, subterms=subterms)
    
    def _initialize(self, sort=None, subterms=None):
        self.sort = sort
        self.subterms = subterms
    
    def find_all(self, term, occs):
        pass

    def substitute(self, term, repl):
        pass
    
    def __eq__(self, other):
        return True

    def __str__(self):
        str_ = "[term: sort->"
        if self.sort:
            str_ += self.sort.__str__()
        if self.subterms:
            str_ += " subterms->"
            for subterm in self.subterms:
                str_ += " " + subterm.__str__()
        str_ += "]"
        return str_

class Const(Term):
    def __init__(self, value=None, sort=None):
        Term.__init__(self, sort=sort)
        self.value = value
    
    def __str__(self):
        str_ = Term.__str__().strip(']')
        str_ += " value->" + self.value
        str_ += "]"
        return str_

class Var(Term):
    """
    variable or a nullary constructor of sort
    """
    def __init__(self, id_=None, sort=None):
        Term.__init__(self, sort=sort)
        self.id_ = id_

    def __str__(self):
        str_ = Term.__str__(self).strip(']')
        str_ += " id->" + self.id_.__str__()
        str_ += "]"
        return str_

class Expr(Term):
    def __init__(self, op=None, sort=None, subterms=None):
        Term.__init__(self, sort, subterms)
        self.op = op 

    def __str__(self):
        str_ = Term.__str__(self).strip(']')
        str_ += " op->" + self.op.__str__()
        str_ += "]"
        return str_

class LetTerm(Term):
    def __init__(self, var_bindings=None, term=None):
        Term.__init__(self, subterms=[term])
        self.sort = term.sort
        self.var_bindings = var_bindings

    def __str__(self):
        str_ = Term.__str__(self).strip(']')
        str_ += " var_bindings->"
        for symbol, term in self.var_bindings:
            str_ += " <" + symbol + ", " + term.__str__() + ">"
        str_ += "]"
        return str_

class QuantifiedTerm(Term):
    def __init__(self, quantifier=None, sorted_vars=None, term=None):
        Term.__init__(self, subterms=[term])
        self.sort = term.sort
        self.quantifier = quantifier
        self.sorted_vars = sorted_vars 

    def __str__(self):
        str_ = Term.__str__(self).strip(']')
        str_ += " quantifier->" + self.quantifier.value
        str_ += " sorted_vars->"
        for symbol, sort in self.sorted_vars:
            str_ += " <" + symbol + ", " + sort.__str__() + ">"
        str_ += "]"
        return str_

class MatchTerm(Term):
    def __init__(self, term=None, match_cases=[]):
        Term.__init__(self, subterms=[term])
        self.match_cases = match_cases
        # self.sort = 'unknown'

    def __str__(self):
        str_ = Term.__str__(self).strip(']')
        str_ += " match_cases->"
        for pattern, term in self.match_cases:
            str_ += " <" + pattern.__str__() + ", " + term.__str__() + ">"
        str_ += "]"
        return str_

class AnnotatedTerm(Term):
    def __init__(self, term=None, annotations=None):
        Term.__init__(self, subterms=[term])
        self.sort = term.sort
        self.annotations = annotations 

    def __str__(self):
        str_ = Term.__str__(self).strip(']')
        str_ += " annotations->"
        for annotation in self.annotations:
            str_ += " " + annotation.__str__() 
        str_ += "]"
        return str_

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
        str_ = "[substTermGroup: sorted_vars->"
        for sorted_var in self.sorted_vars:
            str_ += " " + sorted_var[0]
            if sorted_var[1]:
                str_ += ", " + sorted_var[1].__str__()
        str_ += " repl_pairs->"
        for pair in self.repl_pairs:
            str_ += " " + pair[0].__str__() + " " + pair[1].__str__() 
        str_ += "]"
        return str_

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


