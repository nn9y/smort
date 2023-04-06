from smort.src.tools.utils import list2str
from smort.src.tools.StrEnum import StrEnum


class Status(StrEnum):
    SAT     = 'sat'
    UNSAT   = 'unsat'
    UNKNOWN = 'unknown'


class SMTMRKeyword(StrEnum):
    # in notation
    GEN     = ':gen'
    VAR     = ':var'
    CONS    = ':cons'
    # in method
    SNIPPET = ':snippet'
    SEED    = ':seed'
    # in template
    FREE    = ':free'
    BOUND   = ':bound'



class NotationInfo:
    def __init__(self, formula_in=None, attributes=None):
        self.formula_in = formula_in
        self.attributes = attributes
    
    def __str__(self):
        if self.formula_in:
            return f"{self.formula_in}"
        else:
            return f"{list2str(self.attributes)}"

    def __repr__(self):
        return self.__str__()


class SubstTemplate:
    def __init__(self, attributes, sorted_vars, repl_pairs):
        self.attributes = attributes
        self.sorted_vars = sorted_vars
        self.repl_pairs = repl_pairs 

        self.free = False
        for attr in self.attributes:
            if attr.keyword == SMTMRKeyword.FREE:
                self.free = True
    
    def __str__(self):
        return f"(subst-template {list2str(self.attributes)}\
({list2str(self.sorted_vars)}) ({list2str(self.repl_pairs)}))"

    def __repr__(self):
        return self.__str__()


class Method:
    def __init__(self, name, formula, attributes=[]):
        self.name = name
        self.formula = formula
        self.attributes = attributes
    
    def __str__(self):
        return f"(method {self.name} {self.formula} {list2str(self.attribute)})"
    
    def __repr__(self):
        return self.__str__()


class MetamorphicRelation:
    def __init__(self, seed_status_list, index_of_seed, seed_on_index, mutant, notations, subst_templates, methods, fuse_term):
        self.seed_status_list = seed_status_list
        self.index_of_seed = index_of_seed
        self.seed_on_index = seed_on_index 
        self.mutant = mutant
        self.notations = notations
        self.subst_templates = subst_templates
        self.methods = methods
        self.fuse_term = fuse_term
 
    def get_oracle(self):
        """
        Test Oracle: status of mutant
        """
        return self.mutant[1]
 
    def __str__(self):
        seed_decls = [(symbol, self.seed_status_list[index]) for symbol, index in self.index_of_seed.items()]
        mr_str = list2str(seed_decls, separator='\n')

        mr_str += f"\n({self.mutant[0]} {self.mutant[1]})"

        if self.notations:
            notation_decls = [(symbol, info) for symbol, info in self.notations.items()]
            mr_str += "\n" + list2str(notation_decls, separator='\n')

        if self.subst_templates:
            mr_str += "\n" + list2str(self.subst_templates, separator='\n')
        
        if self.methods:
            mr_str += "\n" + list2str(self.methods, separator='\n')
        
        mr_str += f"\n(fuse {self.fuse_term})"

        return mr_str
        
    def __repr__(self):
        return self.__str__()

