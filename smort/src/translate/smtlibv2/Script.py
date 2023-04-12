from smort.src.tools.utils import list2str
from smort.src.translate.smtlibv2.CNFTerm import CNFTerm


class Script:
    def __init__(self, commands):
        self.commands = commands
        self.assert_merged = None 
 
    def prefix_vars(self, prefix: str):
        self.global_vars = {prefix + var: sort for var, sort in self.global_vars}
        for cmd in self.commands:
            if isinstance(cmd, DeclareConst):
                cmd.symbol = prefix + cmd.symbol
            if isinstance(cmd, DeclareFun):
                if cmd.input_sort_list == []:
                    cmd.symbol = prefix + cmd.symbol
            if isinstance(cmd, DefineFun):
                if cmd.sorted_vars == []:
                    cmd.symbol = prefix + cmd.symbol
            if isinstance(cmd, DefineFunRec):
                if cmd.sorted_vars == []:
                    cmd.symbol = prefix + cmd.symbol
            if isinstance(cmd, DefineFunsRec):
                for fun_decl in cmd.fun_decls: 
                    if fun_decl.sorted_vars == []:
                        fun_decl.symbol = prefix + fun_decl.symbol
            if isinstance(cmd, Assert):
                # cmd.term: CNFTerm
                for c in cmd.term:
                    for l in c:
                        # l: Term
                        l.prefix_vars(prefix)

    def merge_asserts(self):
        """
        Merge all assert blocks (possibly separated by exit, reset,
        reset-assertions statement) into a single assert by conjunction.
        """
        clauses = []
        local_free_vars = {}
        for cmd in self.commands:
            if isinstance(cmd, Assert):
                for c in cmd.term.clauses:
                    for l in c:
                        local_free_vars.update(l.local_free_vars)
                    clauses.append(c)
            if isinstance(cmd, SMTLIBCommand):
                if cmd.cmd_str == "(exit)":
                    break
                if cmd.cmd_str == "(reset)":
                    clauses = []
                if cmd.cmd_str == "(reset-assertions)":
                    clauses = []
        conjunction = Assert(CNFTerm(clauses))
        new_cmds, first_found = [], False
        for cmd in self.commands:
            if isinstance(cmd, Assert):
                if not first_found:
                    new_cmds.append(conjunction)
                    self.assert_merged = conjunction
                    first_found = True
                continue
            if isinstance(cmd, SMTLIBCommand):
                if cmd.cmd_str == "(exit)":
                    break
                if cmd.cmd_str == "(reset-assertions)":
                    continue
                if cmd.cmd_str == "(reset)":
                    new_cmds, self.assert_merged, first_found = [], None, False
                    continue
            new_cmds.append(cmd)
        self.commands = new_cmds

    def __str__(self):
        return list2str(self.commands, separator='\n')

    def __repr__(self):
        return self.__str__()


class ConstructorDec:
    def __init__(self, name: str, sdecs):
        self.name = name 
        self.sdecs = sdecs
 
    def __str__(self):
        return f"({self.name} {list2str(self.sdecs)})"
    
    def __repr__(self):
        return self.__str__()


class DataTypeDec:
    def __init__(self, pars, cdecs):
        self.pars = pars
        self.cdecs = cdecs
    
    def __str__(self):
        if self.pars and len(self.pars) > 0:
            return f"(par ({list2str(self.pars)}) \
({list2str(self.cdecs)}))" 
        else:
            return f"({list2str(self.cdecs)})"
    
    def __repr__(self):
        return self.__str__()


class Pattern:
    def __init__(self, constructor_name=None, var_list=[]):
        self.constructor_name = constructor_name
        self.var_list = var_list 
    
    def __str__(self):
        pattern_str = ""
        symbol_count = 0
        if self.constructor_name:
            pattern_str += self.constructor_name
            symbol_count += 1
        if self.var_list:
            pattern_str += list2str(self.var_list)
            symbol_count += len(self.var_list)
        if symbol_count > 1:
            return f"({pattern_str})"
        else:
            return pattern_str
    
    def __repr__(self):
        return self.__str__()


class Assert:
    def __init__(self, term):
        self.term = term

    def __str__(self):
        return f"(assert {self.term})"

    def __repr__(self):
        return self.__str__()


class DeclareConst:
    def __init__(self, symbol, sort):
        self.symbol = symbol
        self.sort = sort

    def __str__(self):
        return f"(declare-const {self.symbol} {self.sort})"

    def __repr__(self):
        return self.__str__()


class DeclareDataType:
    def __init__(self, symbol, datatype_dec):
        self.symbol = symbol
        self.datatype_dec = datatype_dec

    def __str__(self):
        return f"(declare-datatype {self.symbol} {self.datatype_dec})"

    def __repr__(self):
        return self.__str__()


class DeclareDataTypes:
    def __init__(self, sort_decs, datatype_decs):
        self.sort_decs = sort_decs
        self.datatype_decs = datatype_decs

    def __str__(self):
        return f"(declare-datatypes \
({list2str(self.sort_decs)}) ({list2str(self.datatype_decs)}))"

    def __repr__(self):
        return self.__str__()


class DeclareFun:
    def __init__(self, symbol, input_sort_list, output_sort):
        self.symbol = symbol
        self.input_sort_list = input_sort_list
        self.output_sort = output_sort

    def __str__(self):
        return f"(declare-fun {self.symbol} \
({list2str(self.input_sort_list)}) {str(self.output_sort)})"

    def __repr__(self):
        return self.__str__()


class DeclareSort:
    def __init__(self, symbol, numeral):
        self.symbol = symbol
        self.numeral = numeral

    def __str__(self):
        return f"(declare-sort {self.symbol} {self.numeral}" 

    def __repr__(self):
        return self.__str__()


class DefineFun:
    def __init__(self, symbol, sorted_vars, sort, term):
        self.symbol = symbol
        self.sorted_vars = sorted_vars
        self.sort = sort
        self.term = term

    def __str__(self):
        return f"(define-fun {self.symbol} \
({list2str(self.sorted_vars)}) {str(self.sort)} {str(self.term)})"

    def __repr__(self):
        return self.__str__()


class DefineFunRec:
    def __init__(self, symbol, sorted_vars, sort, term):
        self.symbol = symbol
        self.sorted_vars = sorted_vars
        self.sort = sort
        self.term = term

    def __str__(self):
        return f"(define-fun {self.symbol} \
({list2str(self.sorted_vars)}) {str(self.sort)} {str(self.term)})"

    def __repr__(self):
        return self.__str__()


class FunDecl:
    def __init__(self, symbol, sorted_vars, sort):
        self.symbol = symbol
        self.sorted_vars = sorted_vars
        self.sort = sort

    def __str__(self):
        return f"({self.symbol} ({list2str(self.sorted_vars)}) {str(self.sort)})"

    def __repr__(self):
        return self.__str__()
 

class DefineFunsRec:
    def __init__(self, fun_decls, terms):
        self.fun_decls = fun_decls
        self.terms = terms

    def __str__(self):
        return f"(define-funs-rec ({list2str(self.fun_decls)}) ({list2str(self.terms)}))"
 
    def __repr__(self):
        return self.__str__()


class DefineSort:
    def __init__(self, symbol, par_list, sort):
        self.symbol = symbol 
        self.par_list = par_list
        self.sort = sort 

    def __str__(self):
        return f"(define-sort {self.symbol} ({list2str(self.par_list)}) {self.sort})"
    
    def __repr__(self):
        return self.__str__()


# class CheckSatAssuming:
#     def __init__(self, prop_literals):
#         self.prop_literals = prop_literals

#     def __str__(self):
#         return f"(check-sat-assuming ({list2str(self.prop_literals)}))"

#     def __repr__(self):
#         return self.__str__()


# class GetValue:
#     def __init__(self, terms):
#         self.terms = terms

#     def __str__(self):
#         return f"(get-value ({list2str(self.terms)}))"

#     def __repr__(self):
#         return self.__str__()


# class Push:
#     def __init__(self, levels):
#         self.levels = levels

#     def __str__(self):
#         return f"(push {self.levels})"

#     def __repr__(self):
#         return self.__str__()


# class Pop:
#     def __init__(self, levels):
#         self.levels = levels

#     def __str__(self):
#         return f"(pop {self.levels})"

#     def __repr__(self):
#         return self.__str__()


class SMTLIBCommand:
    """
    commands we don't care about:
        checkSat
        checkSatAssuming
        echo
        exit
        getAssertions
        getAssignment
        getInfo
        getModel
        getOption
        getProof
        getUnsatAssumptions
        getUnsatCore
        getValue
        pop
        push
        reset
        resetAssertions
        setInfo
        setLogic
        setOption
    """
    def __init__(self, cmd_str):
        self.cmd_str = cmd_str

    def __eq__(self, other):
        return self.cmd_str == other.cmd_str

    def __hash__(self):
        return self.cmd_str.__hash__()

    def __str__(self):
        return self.cmd_str
    
    def __repr__(self):
        return self.__str__()

