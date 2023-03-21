import copy

from smort.src.translate.utils import *
from smort.src.translate.Ast import *


class Script:
    def __init__(self, commands, global_vars):
        self.commands = commands
        #self.vars, self.sorts = self._decl_commands()
        self.global_vars = global_vars
        self.free_var_occs = []
        self.assert_cmds = []

    # def _decl_commands(self):
    #     var_list, sort_dict = [], {}
    #     for cmd in self.commands:
    #         if isinstance(cmd, DeclareConst):
    #             vars.append(Var(cmd.symbol, cmd.sort))
    #             sort_dict[cmd.symbol] = cmd.sort
    #         if isinstance(cmd, DeclareFun):
    #             if cmd.input_sort != "":
    #                 vars.append(Var(cmd.symbol, cmd.input_sort))
    #                 sort_dict[cmd.symbol] = cmd.input_sort
    #     return var_list, sort_dict 

    def _prefix_vars_in_assert(self, prefix, t):
        match t.term_type:
            case TermType.CONST:
                return
            case TermType.VAR:
                ## TODO
                # string?
                t.name = prefix + t.name
                return
            case TermType.LET:
                for var, term in t.var_bindings:
                    # TODO
                    var = prefix + var
                    self._prefix_vars_in_assert(prefix, term)
                self._prefix_vars_in_assert(prefix, t.subterms[0])
                return
            case TermType.QUANT:
                for var, _ in t.sorted_vars:
                    # TODO
                    var = prefix + var
                self._prefix_vars_in_assert(prefix, t.subterms[0])
                return
            case TermType.MATCH:
                self._prefix_vars_in_assert(prefix, t.subterms[0])
                for pat, term in self.match_cases:
                    # TODO pat
                    self._prefix_vars_in_assert(prefix, term)
                return
            case TermType.ANNOT:
                self._prefix_vars_in_assert(prefix, t.subterms[0])
            
    def prefix_vars(self, prefix):
        """
        Add a shared prefix to all variables
        :prefix: str
        """
        for cmd in self.commands:
            if isinstance(cmd, DeclareConst):
                cmd.symbol = prefix + cmd.symbol
            if isinstance(cmd, DeclareFun):
                if cmd.input_sort == "":
                    cmd.symbol = prefix + cmd.symbol
            # TODO
            # defines
            if isinstance(cmd, Assert):
                self._prefix_vars_in_assert(prefix, cmd.term)
        new_global_vars = {}
        for global_var in self.global_vars:
            new_global_vars[prefix + global_var] = self.global_vars[global_var]
        self.global_vars = new_global_vars

    def merge_asserts(self):
        """
        Merge all assert blocks (possibly separated by exit, reset,
        reset-assertions statement) into a single assert by conjunction.
        """
        terms = []
        # TODO
        global_free_vars = set() 
        for cmd in self.commands:
            if isinstance(cmd, Assert):
                global_free_vars.update(cmd.term.global_free_vars)
                terms.append(cmd.term)
            if isinstance(cmd, SMTLIBCommand):
                if cmd.cmd_str == "(exit)":
                    break
                if cmd.cmd_str == "(reset)":
                    terms = []
                if cmd.cmd_str == "(reset-assertions)":
                    terms = []
        conjunction = Assert(Expr(name=Identifier("and"), subterms=terms, local_free_vars=global_free_vars))
        # TODO: can remove update global free vars in Term()?
        new_cmds, first_found = [], False
        for cmd in self.commands:
            if not first_found and isinstance(cmd, Assert):
                new_cmds.append(conjunction)
                first_found = True
            if isinstance(cmd, Assert):
                continue
            if isinstance(cmd, SMTLIBCommand):
                if cmd.cmd_str == "(exit)":
                    break
                if cmd.cmd_str == "(reset-assertions)":
                    continue
                if cmd.cmd_str == "(reset)":
                    new_cmds, first_found = [], False
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
        return f"(assert {self.term} )"

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
        return (
            "(define-const "
            + self.symbol
            + " "
            + str(self.sort)
            + " "
            + self.term.__str__()
            + ")"
        )


class DefineFun:
    def __init__(self, symbol, sorted_vars, sort, term):
        self.symbol = symbol
        self.sorted_vars = sorted_vars
        self.sort = sort
        self.term = term

    def __str__(self):
        sorted_var_str_list = []
        for sorted_var in self.sorted_vars:
            sorted_var_str_list.append("(" + list2str(sorted_var) + ")")
        sorted_vars_str = " ".join(sorted_var_str_list)
        return f"(define-fun {self.symbol} \
({sorted_vars_str}) {str(self.sort)} {str(self.term)})"

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
        return f"{self.symbol} ({list2str(self.sorted_vars)}) {str(self.sort)}"

    def __repr__(self):
        return self.__str__()
 

class DefineFunsRec:
    def __init__(self, fun_decls, terms):
        self.fun_decls = fun_decls
        self.terms = terms

    def __str__(self):
        s = "(define-funs-rec (" + self.fun_decls[0].__str__()
        if len(self.fun_decls) > 1:
            for decl in self.fun_decls[1:]:
                s += " " + decl.__str__()
            s += ") (" + self.terms[0].__str__()
        if len(self.terms) > 1:
            for term in self.terms[1:]:
                s += " " + term.__str__()
            s += ")"
        return s + ")"
    
    def __repr__(self):
        return self.__str__()


class DefineSort:
    def __init__(self, symbol, pars, sort):
        self.symbol = symbol 
        self.pars = pars
        self.sort = sort 

    def __str__(self):
        return f"(define-sort {self.symbol} ({list2str(self.pars)}) {self.sort})"
    
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
        declareSort
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
