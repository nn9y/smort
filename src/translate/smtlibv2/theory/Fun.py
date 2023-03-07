import copy
import re
from inspect import isfunction
from SMTMR.src.translate.Ast import *

class Fun:
    def __init__(self, id_, input_list, output, par_list=None):
        self.id_ = id_
        self.input_list = input_list
        self.output = output
        self.par_list = par_list

def arity_sort(symbol, arity):
    def parametric_sort(pars):
        def get_parametric_sort(subsort_dict):
            if subsort_dict:
                subsorts = []
                for i in range(arity):
                    subsorts.append(subsort_dict[pars[i]])
                return Sort(Identifier(symbol), subsorts)
            return None
        return get_parametric_sort
    return parametric_sort

def indexed_sort(symbol, constraint):
    if not isfunction(constraint):
        raise Exception("TO BE DONE")
    def get_indexed_sort(indices):
        if not constraint(indices):
            return None
        return Sort(Identifier(symbol, indices), [])
    return get_indexed_sort

def indexed_fun(op_symbol, constraint, input_list, output, par_list=None, get_output_indices=None):
    def get_indexed_fun(op_indices, input_indices_list):
        input_instance_list = []
        for i in range(len(input_list)):
            if isfunction(input_list[i]):   # indexed sort
                input_instance = input_list[i](input_indices_list[i])
                if not input_instance: 
                    return None
                else:
                    input_instance_list.append(input_instance)
        if isfunction(constraint):
            if not constraint(op_indices, input_indices_list):
                return None
        output_instance = None
        if isfunction(output):
            if isfunction(get_output_indices):
                output_instance = output(get_output_indices(op_indices, input_indices_list))
            else:
                return None
        else:
            output_instance = output
        return Fun(Identifier(op_symbol, op_indices), input_instance_list, output_instance, par_list) 
    return get_indexed_fun

def get_all_instances(ops, prefixes, repl_dicts):
    instances = {}
    for name, op in ops.items():
        if op.par_list:
            for i in range(len(prefixes)):
                pf_name, f_instance = _generate_instance(
                    name,
                    op,
                    prefixes[i],
                    repl_dicts[i]
                )
                instances[pf_name] = f_instance
    return instances

def _generate_instance(name, template, prefix, repl_dict):
    prefixed_name = name.replace('_', prefix)
    repl_input_list = []
    for sort in template.input_list:
        if isfunction(sort):
            repl_input_list.append(sort(repl_dict))
        elif sort in template.par_list:
            repl_input_list.append(repl_dict[sort])
        else:
            repl_input_list.append(sort)
    repl_output = None
    if isfunction(template.output):
        repl_output = template.output(repl_dict)
    if template.output in template.par_list:
        repl_output = repl_dict[template.output]
    else:
        repl_output = template.output
    id_ = copy.deepcopy(template.id_) 
    fun_instance = Fun(id_, repl_input_list, repl_output)
    return prefixed_name, fun_instance

def pascal_case_to_snake_case(camel_case: str):
    snake_case = re.sub(r"(?P<key>[A-Z])", r"_\g<key>", camel_case)
    return snake_case.lower().strip('_')

