import random
import copy
import sys

from smort.src.base.exitcodes import ERR_USAGE, ERR_INTERNAL
from smort.src.translate.smtlibv2.Script import DeclareConst, DefineFun, Assert
from smort.src.translate.tools.Ast import Expr, Var, Const, Identifier, TermType
from smort.src.translate.theory.available_sorts import random_constant_value 
from smort.src.translate.smtmr.MetamorphicRelation import SMTMRKeyword
from smort.src.mutator.utils import merge, random_term_tuples, valid_template_index_list, call_function_from_module


class Mutator:
    def __init__(self, formulas, mr, methods_path=None):
        self.formulas = formulas 
        self.mr = mr
        self.methods_path = methods_path
        self.oracle = self.mr.get_oracle() 
        self.templates = {}
        self._prepare()
 
    def _prepare(self):
        """
        find all templates that can be used
        """
        self.valid_index_list = valid_template_index_list(self.formulas, self.mr.subst_templates)

    def metamorphose(self, formulas, mapping):
        decls = []
        defs = []
        asserts = []
        for k, lst in mapping.items():
            template = self.mr.subst_templates[k]
            term_tuples, var_name_maps = lst
            # generate new variables and constants
            for var, sort in template.sorted_vars:
                attrs = self.mr.notations[var].attributes
                if attrs:
                    is_var = False 
                    is_cons = False 
                    is_gen = False 
                    for attr in attrs:
                        if attr.keyword == SMTMRKeyword.VAR:
                            is_var = True
                        if attr.keyword == SMTMRKeyword.CONS:
                            is_cons = True
                        if attr.keyword == SMTMRKeyword.GEN:
                            is_gen = True
                    for i in range(len(term_tuples)):
                        if var in var_name_maps[i]:
                            mapped_name = var_name_maps[i][var]
                            if is_var:
                                decls.append(DeclareConst(mapped_name, sort))
                            if is_gen:
                                # op = Identifier(attr.value)
                                repl = None
                                for t, r in template.repl_pairs:
                                    if t.term_type == TermType.VAR and t.name == var:
                                        repl = r.replace_var_name(var_name_maps[i]) 
                                        break
                                asserts.append(Assert(term=Expr(name="=", subterms=[Var(var), repl])))
                            if is_cons:
                                value = random_constant_value(sort)
                                term = Const(name=value, sort=sort)
                                defs.append(DefineFun(mapped_name, [], sort, term))
            for i, tup in enumerate(term_tuples):
                # replace terms
                for j, formula in enumerate(formulas):
                    _, repl = template.repl_pairs[j]
                    formula.assert_cmds[0].term.substitute([tup[j]], repl, var_name_maps[i])

        return [formulas, decls, defs, asserts]

    def call_extended_methods(self, formulas):
        snpts = {} 
        if self.mr.methods:
            for method in self.mr.methods:
                try:
                    snpt = call_function_from_module(self.methods_path, method.name, self, formulas) 
                    snpts[method.formula] = snpt
                except Exception as e:
                    print(f"calling method '{method.name}' in '{self.methods_path}' raised an exception: {str(e)}")
                    exit(ERR_INTERNAL)
        return snpts
 
    def fuse(self, formulas, snpts):
        fused = copy.deepcopy(self.mr.fuse_term)
        repl_dict = {}
        for i, formula in enumerate(formulas):
            repl_dict[self.mr.seed_on_index[i]] = formula.assert_cmds[0].term
        repl_dict = dict(repl_dict, **snpts)
        fused.replace_symbols_by_terms(repl_dict)
        return fused 
 
    def mutate(self):
        """
        generate mutant using valid templates
        """

        formulas = [copy.deepcopy(formula) for formula in self.formulas]

        for i, formula in enumerate(formulas):
            formula.prefix_vars(f"seed{i}_")

        mapping = random_term_tuples(
            formulas, self.mr.subst_templates, self.valid_index_list
        )
        formulas, decls, defs, asserts = self.metamorphose(formulas, mapping)
        snpts = self.call_extended_methods(formulas)
        # get fused assert term in mutant
        fused = self.fuse(formulas, snpts)
        # generate whole mutant
        mutant = merge(formulas, fused, decls, defs, asserts)
        return mutant
