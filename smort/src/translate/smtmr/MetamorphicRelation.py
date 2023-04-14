from smort.src.tools.utils import list2str, StrEnum



class Status(StrEnum):
    SAT     = 'sat'
    UNSAT   = 'unsat'
    UNKNOWN = 'unknown'


class NotationKeyword(StrEnum):
    GEN         = ':gen'
    FUN         = ':fun'
    VAR         = ':var'
    CONS        = ':cons'


class TemplateKeyword(StrEnum):
    GLOBAL_FREE = ':global-free'
    INWARDS     = ':inwards'


class MethodKeyword(StrEnum):
    SNIPPET     = ':snippet'
    SEED        = ':seed'



class NotationInfo:
    def __init__(self, formula_in=None, attributes=None, input_notations=[]):
        self.formula_in = formula_in
        self.attributes = attributes
        self.input_notations = input_notations 

        self.is_cons = False
        self.is_var = False
        self.is_fun = False
        self.gen_assert = False
        if attributes:
            for attr in self.attributes:
                match attr.keyword:
                    case NotationKeyword.CONS:
                        self.is_cons = True
                    case NotationKeyword.VAR:
                        self.is_var = True
                    case NotationKeyword.FUN:
                        if self.input_notations == []:
                            self.is_var = True
                        else:
                            self.is_fun = True
                    case NotationKeyword.GEN:
                        self.gen_assert = True
    
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

        self.global_free = False
        self.inwards = False
        for attr in self.attributes:
            if attr.keyword == TemplateKeyword.GLOBAL_FREE:
                self.global_free = True
            if attr.keyword == TemplateKeyword.INWARDS:
                self.inwards = True
    
    def __str__(self):
        return f"(subst-template {list2str(self.attributes)} \
({list2str(self.sorted_vars)}) ({list2str(self.repl_pairs)}))"

    def __repr__(self):
        return self.__str__()


class Method:
    def __init__(self, name, formula, attributes=[]):
        self.name = name[1:-1]
        self.formula = formula
        self.attributes = attributes

        self.is_seed = False
        self.is_snpt = False

        for attr in self.attributes:
            if attr.keyword == MethodKeyword.SEED:
                self.is_seed = True
            if attr.keyword == MethodKeyword.SNIPPET:
                self.is_snpt = True
 
    def __str__(self):
        return f"(method \"{self.name}\" {self.formula} {list2str(self.attributes)})"
    
    def __repr__(self):
        return self.__str__()


class MetamorphicRelation:
    def __init__(self, seed_status_list, index_of_seed, seed_on_index, morph, notations, subst_templates, methods, fuse_term):
        self.seed_status_list = seed_status_list
        self.index_of_seed = index_of_seed
        self.seed_on_index = seed_on_index 
        self.morph = morph
        self.notations = notations
        self.subst_templates = subst_templates
        self.methods = methods
        self.fuse_term = fuse_term
 
    def get_oracle(self):
        """
        Test Oracle: status of morph
        """
        return self.morph[1]
 
    def __str__(self):
        mr_str = ""
        for symbol, index in self.index_of_seed.items():
            mr_str += f'(seed {symbol} {self.seed_status_list[index]})\n'

        mr_str += f"\n(morph {self.morph[0]} {self.morph[1]})"

        if self.notations:
            mr_str += "\n"
            for symbol, info in self.notations.items():
                mr_str += f'(notation {symbol} {info})\n'

        if self.subst_templates:
            mr_str += "\n" + list2str(self.subst_templates, separator='\n')
        
        if self.methods:
            mr_str += "\n" + list2str(self.methods, separator='\n')
        
        mr_str += f"\n(fuse {self.fuse_term})"

        return mr_str
        
    def __repr__(self):
        return self.__str__()

