from smort.src.tools.utils import list2str, prefix_symbol
from smort.src.translate.smtlibv2.Commands import *
from smort.src.translate.smtlibv2.CNFTerm import CNFTerm
from smort.src.translate.smtlibv2.cnf_conversion import Term2CNFTerm


class Script:
    def __init__(self, commands, global_vars={}, global_sigs={}, datatype_functions={}):
        self.commands = commands
        self.assert_merged = None 
        self.global_vars = global_vars 
        self.global_sigs = global_sigs 
        self.datatype_functions = datatype_functions
        self.logic = 'ALL'
        for cmd in self.commands:
            if isinstance(cmd, SetLogic):
                self.logic = cmd.logic
                # don't break, may override
        self.global_sorts = set()
        for _, sort in self.global_vars.items():
            self.global_sorts.add(sort)
        
    def prefix_sigs(self, prefix: str):
        for cmd in self.commands:
            if isinstance(cmd, DeclareConst):
                cmd.symbol = prefix_symbol(prefix, cmd.symbol)
            if isinstance(cmd, DeclareFun):
                cmd.symbol = prefix_symbol(prefix, cmd.symbol)
            if isinstance(cmd, DefineFun):
                cmd.symbol = prefix_symbol(prefix, cmd.symbol)
            if isinstance(cmd, DefineFunRec):
                cmd.symbol = prefix_symbol(prefix, cmd.symbol)
            if isinstance(cmd, DefineFunsRec):
                for fun_decl in cmd.fun_decls: 
                    fun_decl.symbol = prefix_symbol(prefix, fun_decl.symbol)
            if isinstance(cmd, Assert):
                cmd.term.prefix_sigs(prefix, self.global_sigs, self.datatype_functions)
        self.global_vars = {prefix_symbol(prefix, var): sort for var, sort in self.global_vars.items()}
        self.global_sigs = {prefix_symbol(prefix, sig): sort for sig, sort in self.global_sigs.items()}

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
                    for l in c.literals:
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
