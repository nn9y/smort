from smort.src.translate.tools.utils import *
from smort.src.translate.tools.Term import *
from smort.src.translate.tools.Sort import *


class Script:
    def __init__(self, commands):
        self.commands = commands
        self.assert_cmds = []

    def _prefix_vars_in_assert(self, prefix, t):
        t.bound_vars = {prefix + key: value for key, value in t.bound_vars.items()}
        t.local_free_vars = {prefix + key: value for key, value in t.local_free_vars.items()}
        match t.term_type:
            case TermType.CONST:
                return
            case TermType.VAR:
                t.name = Identifier(prefix + t.name.symbol, t.name.indices)
                return
            case TermType.EXPR:
                for subterm in t.subterms:
                    self._prefix_vars_in_assert(prefix, subterm)
            case TermType.LET:
                for i, vb in enumerate(t.var_bindings):
                    var, term = vb
                    # set
                    t.var_bindings[i][0] = prefix + var
                    self._prefix_vars_in_assert(prefix, term)
                self._prefix_vars_in_assert(prefix, t.subterms[0])
                return
            case TermType.QUANT:
                for i, sv in enumerate(t.sorted_vars):
                    var, _ = sv
                    # set
                    t.sorted_vars[i][0] = prefix + var
                self._prefix_vars_in_assert(prefix, t.subterms[0])
                return
            case TermType.MATCH:
                self._prefix_vars_in_assert(prefix, t.subterms[0])
                for i, mc in enumerate(t.match_cases):
                    pat, term = mc
                    if len(pat) > 1:
                        for j in range(1, len(pat)):
                            # set
                            t.match_cases[i][0][j] = prefix + pat[j]
                    else:
                        if pat[0] in term.bound_vars:
                            # set
                            # not nullary constructor
                            t.match_cases[i][0][0] = prefix + pat[0]
                    self._prefix_vars_in_assert(prefix, term)
                return
            case TermType.ANNOT:
                self._prefix_vars_in_assert(prefix, t.subterms[0])
 
    def prefix_vars(self, prefix: str):
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
                self._prefix_vars_in_assert(prefix, cmd.term) 

    def merge_asserts(self):
        """
        Merge all assert blocks (possibly separated by exit, reset,
        reset-assertions statement) into a single assert by conjunction.
        """
        terms = []
        local_free_vars = {}
        for cmd in self.commands:
            if isinstance(cmd, Assert):
                term = cmd.term
                local_free_vars.update(term.local_free_vars)
                terms.append(term)
            if isinstance(cmd, SMTLIBCommand):
                if cmd.cmd_str == "(exit)":
                    break
                if cmd.cmd_str == "(reset)":
                    terms = []
                if cmd.cmd_str == "(reset-assertions)":
                    terms = []
        conjunction = Assert(Expr(name=Identifier("and"), subterms=terms, local_free_vars=local_free_vars))
        new_cmds, first_found = [], False
        for cmd in self.commands:
            if isinstance(cmd, Assert):
                if not first_found:
                    new_cmds.append(conjunction)
                    self.assert_cmds.append(conjunction)
                    first_found = True
                continue
            if isinstance(cmd, SMTLIBCommand):
                if cmd.cmd_str == "(exit)":
                    break
                if cmd.cmd_str == "(reset-assertions)":
                    continue
                if cmd.cmd_str == "(reset)":
                    new_cmds, self.assert_cmds, first_found = [], [], False
                    continue
            new_cmds.append(cmd)
        self.commands = new_cmds

    def __str__(self):
        return list2str(self.commands, separator='\n')

    def __repr__(self):
        return self.__str__()


class ConstructorDec:
    def __init__(self, name, sdecs):
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


class DefineConst:
    def __init__(self, symbol, sort, term):
        self.symbol = symbol
        self.sort = sort
        self.term = term

    def __str__(self):
        return f"(define-const {self.symbol} {self.sort} {self.term})"

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


# class CheckSat:
#     def __init__(self):
#         pass

#     def __str__(self):
#         return "(check-sat)"

#     def __repr__(self):
#         return self.__str__()


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
