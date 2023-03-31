import random
import copy
import sys

from smort.src.base.exitcodes import ERR_USAGE, ERR_INTERNAL
from smort.src.translate.smtlibv2.Script import DeclareConst, DefineFun
from smort.src.translate.Ast import Expr, Var, Const, Identifier, TermType
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

    def metamorphose(self, formulas, template, term_tuple, var_name_map):
        # generate new variables and constants
        add_cmds = []
        gen_terms = {}
        for var, sort in template.sorted_vars:
            for attr in self.mr.notations[var]:
                if attr.keyword == SMTMRKeyword.VAR:
                    cmd = DeclareConst(var, sort) 
                    add_cmds.append(cmd)
                if attr.keyword == SMTMRKeyword.GEN:
                    op = Identifier(attr.value)
                    repl = None
                    for t, r in template.repl_pairs:
                        if t.term_type == TermType.VAR and t.name == var:
                            repl = r 
                            break
                    gen_terms[var] = Expr(name=op, subterms=[Var(var), repl]) 
                if attr.keyword == SMTMRKeyword.CONS:
                    value = random_constant_value(sort)
                    term = Const(name=value, sort=sort)
                    cmd = DefineFun(var, [], sort, term)
                    add_cmds.append(cmd)

        for i, repl_pair in enumerate(template.repl_pairs):
            term, repl = repl_pair 
            formulas[i].substitute(term_tuple[i], repl, var_name_map)

        return [formulas, add_cmds, gen_terms]

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
 
    def fuse(self, formulas, snpts, gen_terms):
        fused = copy.deepcopy(self.mr.fuse_term)
        repl_dict = {}
        for i, formula in enumerate(formulas):
            repl_dict[self.mr.seed_on_index[i]] = formula.assert_cmd[0].term
        repl_dict.update(snpts)
        repl_dict.update(gen_terms)
        fused.replace_symbols_by_terms(repl_dict)
        return fused 
 
    def mutate(self, k):
        """
        generate mutant using k-th valid template (templates[self.valid_index_list[k]])
        """
        formulas = []
        for i in len(self.formulas):
            formula = self.formulas[i]
            formulas.append(copy.deepcopy(formula).prefix_vars(f"seed{i}_"))
        
        template = self.mr.subst_templates[self.valid_index_list[k]]

        term_tuple, var_name_map, skip_template = random_term_tuples(
            formulas,template 
        )
        formulas, add_cmds, gen_terms = self.metamorphose(formulas, template, term_tuple, var_name_map)
        snpts = self.call_extended_methods(formulas)
        # get fused assert term in mutant
        fused = self.fuse(formulas, snpts, gen_terms)
        # generate whole mutant
        mutant = merge(formulas, add_cmds, fused)
        return mutant, skip_template
