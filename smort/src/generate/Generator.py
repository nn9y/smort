import copy
import random

from smort.src.sys.exitcodes import ERR_INTERNAL
from smort.src.generate.utils import (
    merge, 
    find_valid_templates,
    random_term_tuples,
    call_function_from_module,
    generate_additions,
    replace
)
from smort.src.translate.smtlibv2.cnf_conversion import CNFTerm2Term


class Generator:
    def __init__(self, formulas, mr, args):
        self.formulas = formulas 
        self.mr = mr
        self.args = args
        self.oracle = self.mr.get_oracle() 
        # templates that can be used for these seed formulas
        self.valid_index_list = find_valid_templates(self.formulas, self.mr.subst_templates)
        # substituions
        self.substs_list = [] 
        # for '--multiple-templates' is disabled 
        self.template_index = 0     
        # for '--incremental' is enabled
        self.start_increment = True
        self.end_increment = False 
        self.acc_formulas = []
        self.acc_snpts = []
        self.acc_decls = []
        self.acc_asserts = []

    def metamorphose(self, decls, asserts):
        if self.args.incremental:
            if len(self.substs_list) == 0:
                self.end_increment = True
                return
            # random choose one to increment
            m = random.randrange(len(self.substs_list))
            while len(self.substs_list[m][1]) == 0:
                self.substs_list.pop(m)
                m = random.randrange(len(self.substs_list))
            k, term_tups, notation2terms = self.substs_list[m]
            template = self.mr.subst_templates[k]
            i = random.randrange(len(self.substs_list[m][1]))
            term_tup, notation2term = term_tups[i], notation2terms[i] 
            generate_additions(template, self.mr.notations, notation2term, decls, asserts)
            replace(template, term_tup, notation2term)
            self.substs_list[m][1].pop(i)
            self.substs_list[m][2].pop(i)
            if len(self.substs_list[m][1]) == 0:
                self.substs_list.pop(m)
            if len(self.substs_list) == 0:
                self.end_increment = True
        else:
            for k, term_tups, notation2terms in self.substs_list:
                template = self.mr.subst_templates[k]
                for i, term_tup in enumerate(term_tups):
                    generate_additions(template, self.mr.notations, notation2terms[i], decls, asserts)
                    replace(template, term_tup, notation2terms[i])

    def call_extended_methods(self, formulas, snpts):
        processed_formulas = {}
        if self.mr.methods:
            for method in self.mr.methods:
                try:
                    f = call_function_from_module(self.args.methods_path, method.name, formulas) 
                    if method.is_snpt:
                        snpts.append(f)
                    else:
                        processed_formulas[method.formula] = f 
                except Exception as e:
                    print(f"calling method '{method.name}' in '{self.args.methods_path}' raised an exception: {str(e)}")
                    exit(ERR_INTERNAL)
        return processed_formulas 
 
    def fuse(self, formulas, processed_formulas):
        fused = copy.deepcopy(self.mr.fuse_term)
        repl_dict = {}
        for i, formula in enumerate(formulas):
            repl_dict[self.mr.seed_on_index[i]] = CNFTerm2Term(formula.assert_merged.term)
        for key, formula in processed_formulas.items():
            repl_dict[key] = CNFTerm2Term(formula.assert_merged.term)
        fused.replace_notation_by_term(repl_dict)
        return fused 
 
    def generate(self):
        """
        generate next morph
        """
        if len(self.valid_index_list) == 0:
            formulas = [copy.deepcopy(formula) for formula in self.formulas]
            for i, formula in enumerate(formulas):
                formula.prefix_sigs(f"seed{i}_")
            snpts = []
            processed_formulas = self.call_extended_methods(formulas, snpts)
            fused = self.fuse(formulas, processed_formulas)
            morph = merge(formulas, fused, [], [], snpts)
            return morph, True 
        
        if (self.args.incremental) and (not self.start_increment):
            # incremental, in process
            formulas = self.acc_formulas
            decls = self.acc_decls
            asserts = self.acc_asserts
            snpts = self.acc_snpts
        else:
            self.start_increment = False
            if self.args.multiple_templates:
                index_list = self.valid_index_list
            else:
                index_list = [self.valid_index_list[self.template_index]]
            formulas = [copy.deepcopy(formula) for formula in self.formulas]
            for i, formula in enumerate(formulas):
                formula.prefix_sigs(f"seed{i}_")
            self.substs_list = random_term_tuples(
                formulas,
                self.mr.subst_templates,
                self.args.multiple_substs,
                index_list,
                self.mr.notations
            )
            decls = []
            asserts = []
            snpts = []

        self.metamorphose(decls, asserts)
        processed_formulas = self.call_extended_methods(formulas, snpts)
        # get fused assert term in morph
        fused = self.fuse(formulas, processed_formulas)
        # generate whole morph
        morph = merge(formulas, fused, decls, asserts, snpts)

        if self.args.incremental:
            self.acc_formulas = formulas
            self.acc_decls = decls
            self.acc_asserts = asserts 
            self.acc_snpts = snpts

        end_iteration = False
        if self.args.incremental:
            # '-in' is enabled and end of increment
            if self.end_increment:
                end_iteration = True
        elif self.args.multiple_templates:
            # '-mt' is enabled but '-in' is disabled
            end_iteration = True
        elif self.template_index == len(self.valid_index_list)-1:
            # '-mt' is disabled and end of this iteration 
            end_iteration = True
        # next template
        # nonsense when '-mt' is enabled
        if len(self.valid_index_list) > 0:
            self.template_index += 1
            self.template_index %= len(self.valid_index_list)

        return morph, end_iteration
