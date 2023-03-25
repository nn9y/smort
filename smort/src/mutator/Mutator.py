import random
import copy
import sys

from smort.src.base.exitcodes import ERR_USAGE, ERR_INTERNAL
from smort.src.translate.smtlibv2.Script import DeclareConst, Assert
from smort.src.translate.Ast import Expr, Var
from smort.src.translate.theory.available_sorts import random_constant_value 
from smort.src.translate.smtmr.MetamorphicRelation import SMTMRKeyword
from smort.src.mutator.utils import merge, random_term_tuples, call_function_from_module


class Mutator:
    def __init__(self, formulas, mr, methods_path=None):
        self.formulas = formulas 
        self.mr = mr
        self.methods_path = methods_path
        self.oracle = self.mr.get_oracle() 
        self.templates = {}
        self.add_cmds = []
        self.other_terms = {}
        # generate declareConst 

    def metamorphose(self, formulas, template_tuples):
        for k, tup in template_tuples.items():
            template = self.mr.subst_templates[k]
            term_tuple, var_name_map = tup

            cons_map = {} # map cons symbol to random constant
            for var, sort in template.sorted_vars:
                for attr in self.mr.notations[var]:
                    if attr.keyword == SMTMRKeyword.VAR:
                        cmd = DeclareConst(var, sort) 
                        self.add_cmds.append(cmd)
                    if attr.keyword == SMTMRKeyword.GEN:
                        op = attr.value
                        # TODO
                        # template should add members
                        # map :var to repl
                        term = Expr(name=op, subterms=[Var(var), template.repl[var]]) 
                        self.other_terms[var] = term 
                    if attr.keyword == SMTMRKeyword.CONS:
                        # TODO
                        cons_map[var] = random_constant_value(sort)

            for i, repl_pair in enumerate(template.repl_pairs):
                term, repl = repl_pair 
                # TODO, add cons_map implementation in Term
                term_tuple[i].substitute(repl, var_name_map, cons_map)
        # TODO formulas not used?

        return formulas 

    def call_extended_methods(self, formulas):
        if self.mr.methods:
            if not self.methods_path:
                print("TODO method declared in mr file but no methods path provided in command args")
                exit(ERR_USAGE)
            for method in self.mr.methods:
                snpts = []
                try:
                    # TODO
                    # can formulas be modified?
                    snpt = call_function_from_module(self.methods_path, method.name, self, formulas) 
                    snpts.append(snpt)
                except Exception:
                    print("TODO")
                    exit(ERR_INTERNAL)
                return [formulas, snpts]
        return [formulas, []]
        
 
    def fuse(self, formulas, snpts):
        # TODO
        fused = copy.deepcopy(self.mr.fuse_term)
        repl_dict = {}
        for i, formula in enumerate(formulas):
            repl_dict[self.mr.seed_on_index[i]] = formula.assert_cmd[0].term
        for i, snpt in enumerate(snpts):
            repl_dict[self.mr.snpt_on_index[i]] = snpt
        for var, term in self.other_terms.items():
            repl_dict[var] = term 
        fused.replace_symbols_by_terms(repl_dict)
        return fused 
            
    def mutate(self):
        skip_seed = False
        # for symbol, formula in self.formulas:
        #     if formula.free_var_occs == []:
        #         skip_seed = True
        #         break

        formulas = []
        for i in len(self.formulas):
            formula = self.formulas[i]
            formulas.append(copy.deepcopy(formula).prefix_vars(f"seed{i}_"))
 
        # choose templates?
        # templates = generate_fusion_function_templates(
        #     formula1.global_vars,
        #     formula2.global_vars,
        #     self.generate_functions_size
        # ) \
        #     if self.generate_functions \
        #     else self.templates

        temp2tups = random_term_tuples(
            formulas, self.mr
        )
        metamorphosed_formulas = self.metamorphose(formulas, temp2tups)
        formulas, snpts = self.call_extended_methods(metamorphosed_formulas)
        fused = self.fuse(formulas, snpts)

        mutant = merge(formulas, self.add_cmds, fused)
    
        return mutant, True, skip_seed
