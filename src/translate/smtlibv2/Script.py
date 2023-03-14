import copy
from util import *

from SMTMR.src.translate.Ast import *

class PropLiteral:
    def __init__(self, symbol, is_not=False):
        self.symbol = symbol
        self.is_not = is_not
    
    def __str__(self):
        return (
            f"(not {self.symbol})"
            if self.is_not
            else str(self.symbol)
        )

    def __repr__(self):
        return (
            f"(not {self.symbol})"
            if self.is_not
            else str(self.symbol)
        )

class Script:
    def __init__(self, commands, global_vars):
        self.commands = commands
        self.vars, self.sorts = self._decl_commands()
        self.global_vars = global_vars
        self.free_var_occs = []
        self.op_occs = []
        self.assert_cmds = []

        for cmd in self.commands:
            if isinstance(cmd, Assert):
                globs_ = copy.deepcopy(self.global_vars)
                self._get_free_var_occs(cmd.term, self.global_vars)
                self.global_vars = globs_
                self._get_op_occs(cmd.term)
                self.assert_cmds.append(cmd)

    def _get_op_occs(self, t):
        if isinstance(t, str):
            return
        if t.is_const:
            return
        if t.annotations:
            return
        if t.is_var:
            return

        # TODO
        self.op_occs.append(t)
        for sub in t.subterms:
            self._get_op_occs(sub)

    def _get_free_var_occs(self, t, global_vars):
        if isinstance(t, str):
            return
        if t.is_const:
            return
        if t.annotations:
            return

        if t.is_var:
            if t.name in global_vars:
                self.free_var_occs.append(t)
            return

        if t.quantifier:
            for var in list(global_vars):
                for quant_var, _ in t.quantified_vars:
                    if var == quant_var:
                        global_vars.pop(var)

        if t.var_bindings:
            for var in list(global_vars):
                for let_var, let_term in t.var_bindings:
                    if var == let_var:
                        global_vars.pop(var)
            # TODO

        for sub in t.subterms:
            self._get_free_var_occs(sub, global_vars)

    def _decl_commands(self):
        var_list, sort_dict = [], {}
        for cmd in self.commands:
            if isinstance(cmd, DeclareConst):
                vars.append(Var(cmd.symbol, cmd.sort))
                sort_dict[cmd.symbol] = cmd.sort
            if isinstance(cmd, DeclareFun):
                if cmd.input_sort != "":
                    vars.append(Var(cmd.symbol, cmd.input_sort))
                    sort_dict[cmd.symbol] = cmd.input_sort
        return var_list, sort_dict 

    def _prefix_free_vars(self, prefix, t):
        if isinstance(t, str):
            return
        if t.is_const:
            return
        if t.is_var and t.sort:
            if t in self.free_var_occs:
                t.name = prefix + t.name
            return

        if t.var_bindings:
            for var, term in enumerate(t.var_bindings):
                self._prefix_free_vars(prefix, term)

        for sub in t.subterms:
            self._prefix_free_vars(prefix, sub)

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
            if isinstance(cmd, Assert):
                self._prefix_free_vars(prefix, cmd.term)
        new_global_vars = {}
        for global_var in self.global_vars:
            new_global_vars[prefix + global_var] = self.global_vars[global_var]
        self.global_vars = new_global_vars
        self.vars, self.types = self._decl_commands()

    def merge_asserts(self):
        """
        Merge all assert blocks (possibly separated by exit, reset,
        reset-assertions statement) into a single assert by conjunction.
        """
        terms = []
        for cmd in self.commands:
            if isinstance(cmd, Assert):
                terms.append(cmd.term)
            if isinstance(cmd, SMTLIBCommand):
                if cmd.cmd_str == "(exit)":
                    break
                if cmd.cmd_str == "(reset)":
                    terms = []
                if cmd.cmd_str == "(reset-assertions)":
                    terms = []
        conjunction = Assert(Term(op="and", subterms=terms))
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
        s = ""
        for i, c in enumerate(self.commands):
            if i != len(self.commands) - 1:
                s += c.__str__() + "\n"
            else:
                s += c.__str__()
        return s


class Commands:
    def __init__(self):
        self.free_vars = []


class DeclareConst(Commands):
    def __init__(self, symbol, sort):
        self.symbol = symbol
        self.sort = sort

    def __str__(self):
        return f"(declare-const {self.symbol} {self.sort})"

class DeclareFun:
    def __init__(self, symbol, input_sort_list, output_sort):
        self.symbol = symbol
        self.input_sort_list = input_sort_list
        self.output_sort = output_sort

    def __str__(self):
        return f"(declare-fun {self.symbol} \
({list2str(self.input_sort_list)}) {str(self.output_sort)})"

class Assert:
    def __init__(self, term):
        self.term = term

    def __str__(self):
        return f"(assert {self.term} )"

class Comment:
    def __init__(self, text):
        self.text = text

    def __str__(self):
        return "; " + self.text


class Define:
    def __init__(self, symbol, term):
        self.term = term
        self.symbol = symbol

    def __str__(self):
        return "(define " + self.symbol + " " + self.term.__str__() + ")"


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
        return f"(define-fun {self.symbol} \
({list2str(self.sorted_vars)}) {str(self.sort)} {str(self.term)})"

class FunDecl:
    def __init__(self, symbol, sorted_vars, sort):
        self.symbol = symbol
        self.sorted_vars = sorted_vars
        self.sort = sort

    def __str__(self):
        return f"{self.symbol} ({list2str(self.sorted_vars, 2)}) {str(self.sort)}"

    def __repr__(self):
        return f"{self.symbol} ({list2str(self.sorted_vars, 2)}) {str(self.sort)}"
 
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


class Simplify:
    def __init__(self, term, attr):
        self.term = term
        self.attr = attr

    def __str__(self):
        attr_s = ""
        for a in self.attr:
            attr_s = " " + a[0] + " " + a[1]
        return "(simplify " + self.term.__str__() + attr_s + ")"


class Minimize:
    def __init__(self, term):
        self.term = term

    def __str__(self):
        return "(minimize " + self.term.__str__() + ")"


class Maximize:
    def __init__(self, term):
        self.term = term

    def __str__(self):
        return "(maximize " + self.term.__str__() + ")"


class Display:
    def __init__(self, term):
        self.term = term

    def __str__(self):
        return "(display" + self.term.__str__() + ")"


class Eval:
    def __init__(self, term):
        self.term = term

    def __str__(self):
        return "(eval" + self.term.__str__() + ")"


class PolyFactor:
    def __init__(self, term):
        self.term = term

    def __str__(self):
        return "(poly/factor" + self.term.__str__() + ")"


class CheckSat:
    def __init__(self):
        pass

    def __str__(self):
        return "(check-sat)"

    def __repr__(self):
        return "(check-sat)"


class CheckSatAssuming:
    def __init__(self, prop_literals):
        self.prop_literals = prop_literals

    def __str__(self):
        return f"(check-sat-assuming ({list2str(self.prop_literals)}))"

    def __repr__(self):
        return f"(check-sat-assuming ({list2str(self.prop_literals)}))"


class GetValue:
    def __init__(self, terms):
        self.terms = terms

    def __str__(self):
        return f"(get-value ({list2str(self.terms)}))"

    def __repr__(self):
        return f"(get-value ({list2str(self.terms)}))"


class Push:
    def __init__(self, levels):
        self.levels = levels

    def __str__(self):
        return f"(push {self.levels})"

    def __repr__(self):
        return f"(push {self.levels})"


class Pop:
    def __init__(self, levels):
        self.levels = levels

    def __str__(self):
        return f"(pop {self.levels})"

    def __repr__(self):
        return f"(pop {self.levels})"


class SMTLIBCommand:
    def __init__(self, cmd_str):
        self.cmd_str = cmd_str

    def __str__(self):
        return self.cmd_str

    def __eq__(self, other):
        return self.cmd_str == other.cmd_str

    def __hash__(self):
        return self.cmd_str.__hash__()
