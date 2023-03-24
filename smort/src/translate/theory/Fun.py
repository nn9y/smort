import copy
import re
from inspect import isfunction

from smort.src.translate.Ast import *
from smort.src.translate.theory.utils import *


### !!! TODO !!!
### name type check and dealing in Fun's members
###


class Fun:
    def __init__(self, name, input_list, output, par_list=None, constraints=None, get_output_indices=None):
        self.name = name    # Identifier or SpecConstantType
        self.input_list = input_list
        self.output = output
        self.par_list = par_list
        self.constraints = constraints
        self.get_output_indices = get_output_indices
 
    def __eq__(self, other):
        """
        check if 2 fun instances are equal
        """
        if not isinstance(other, Fun):
            return False
        if self.name != other.name:
            return False
        if self.input_list != other.input_list:
            return False
        if self.output != other.output:
            return False
        if self.par_list != other.par_list:
            return False
        return True
    
    def match(self, op, input_list, output):
        """
        check if an term's op and input_list match this fun
        """
        if isinstance(self.name, SpecConstType) and self.name != op.const_type:
            return False
        if isinstance(self.name, Identifier) and self.name != op:
            return False
        if self.input_list != input_list:
            return False
        if output and output != self.output:
            return False
        return True
    
    def match_indexed_type(self, op, input_list):
        """
        check if an term's op and input_list match this indexed fun
        """
        if type(self.name) != type(op):
            return False
        if isinstance(self.name, SpecConstant) and (self.name.const_type != op.const_type):
            return False
        if isinstance(self.name, Identifier) and (not self.name.same_indexed_type(op)):
            return False
        if len(self.input_list) != len(input_list):
            return False
        for i in range(len(self.input_list)):
            if not self.input_list[i].same_indexed_type(input_list[i]):
                return False
        return True
    
    def get_par_dict(self, op, input_list):
        if (not isinstance(self.name, Identifier)) or (not self.name.same_indexed_type(op)):
            return {}
        par_dict = get_par_dict(self.input_list, input_list) 
        return par_dict
 
    def get_indexed_instance(self, op_indices, input_indices_list):
        if isfunction(self.constraints):
            if not self.constraints(op_indices, input_indices_list):
                return None
        op_instance = self.name.get_indexed_instance(op_indices) if isinstance(self.name, Identifier) else SpecConstant(self.name.spec_type, op_indices)
        input_instances = []
        for i in len(input_indices_list):
            input_instances.append(self.input_list[i].get_indexed_instance(input_indices_list[i]))
        if isfunction(self.get_output_indices):
            output_instance = self.output.get_indexed_instance(self.get_output_indices(op_indices, input_indices_list))
        else:
            output_instance = self.output.get_indexed_instance(None)
        return Fun(op_instance, input_instances, output_instance, copy.deepcopy(self.par_list)) 
    
    def __str__(self):
        fun_decl_str = f"({self.name} {list2str(self.input_list)} {self.output})"
        if self.par_list:
            return f"(par ({list2str(self.par_list)}) {fun_decl_str})"
        else:
            return fun_decl_str
        
    def __repr__(self):
        return self.__str__()




def indexed_sort(symbol: str, indices_len, constraint=None):
    """
    type(indices) == dict is a marker for indexed sort template 
    constraint: function that indices of sort should satisfy
    """
    if indices_len <= 0:
        raise TheoryException("'indices_len' should be an positive number")
    return Sort(Identifier(symbol, {"len": indices_len}), [], constraint)


def sort_with_arity(symbol: str, arity: int):
    """
    sort with arity >= 0
    """
    if arity < 0:
        raise TheoryException("'arity' should be non-negative integer")
    if arity == 0:
        return Sort(Identifier(symbol))
    def _parametric_sort(pars: list):
        """
        called in construction of parametric functions to fill parameter placeholder (string)
        """
        if len(pars) != arity:
            raise TheoryException(f"length of 'pars' should be {arity}")
        return Sort(Identifier(symbol), pars)
    return _parametric_sort


def indexed_sort_with_arity(symbol: str, indices_len, arity, constraint=None):
    if indices_len <= 0:
        raise TheoryException("'indices_len' should be an positive number")
    if arity < 0:
        raise TheoryException("'arity' should be non-negative integer")
    id_ = Identifier(symbol, {"len": indices_len})
    if arity == 0:
        return Sort(id_, [], constraint)
    def _indexed_parametric_sort(pars: list):
        if len(pars) != arity:
            raise TheoryException(f"length of 'pars' should be {arity}")
        return Sort(id_, pars, constraint)
    return _indexed_parametric_sort


def indexed_fun(
        name_symbol: str,
        name_indices_len,
        input_list,
        output,
        constraints=None,
        get_output_indices=None,
        par_list=None):
    """
    if any identifier in nameerator or sort list of function is indexed, this is an indexed fun
        type(name.indices) == dict is a marker for indexed fun, it can be 0
    """
    if name_indices_len < 0:
        raise TheoryException("'name_indices_len' should be an non-negative number")
    return Fun(
        Identifier(name_symbol, {"len": name_indices_len}),
        input_list,
        output,
        par_list,
        constraints,
        get_output_indices
    )


# parametric sort is marked by non-empty parsorts
# parametric function is marked by non-empty par_list


def get_all_instances(funs, repl_dicts):
    instances = {}
    for keyname, fun in funs.items():
        if not isinstance(fun, list):
            fun = [fun]
        for f in fun:
            if f.par_list:
                for i in range(len(repl_dicts)):
                    instance = generate_one_instance(
                        fun,
                        repl_dicts[i],
                    )
                    if keyname in instance:
                        instance[keyname] = instance[keyname] + [instance]
                    else:
                        instances[keyname] = [instance]
    return instances


def generate_one_instance(template: Fun, repl_dict):
    """
    generate fun instance by replacing parameters in template using repl_dict 
    """
    repl_input_list = []
    for sort in template.input_list:
        repl_sort = _get_repl_sort(sort, template.par_list, repl_dict)
        if repl_sort:
            repl_input_list.append(repl_sort)
        else:
            return None
    repl_output = _get_repl_sort(template.output, template.par_list, repl_dict)
    if not repl_output:
        return None
    name = copy.deepcopy(template.name) 
    return Fun(name, repl_input_list, repl_output)


def _get_repl_sort(sort, par_list, repl_dict):
    if sort in par_list:
        if sort in repl_dict:
            return repl_dict[sort]
        else:
            return None
    elif isinstance(sort, Sort):
        if len(sort.parsorts) > 0:
            repl_sort = sort.get_parametric_instance(repl_dict)
            return repl_sort
        else:
            return sort
    else:
        return None


def pascal_case_to_snake_case(camel_case: str):
    snake_case = re.sub(r"(?P<key>[A-Z])", r"_\g<key>", camel_case)
    return snake_case.lower().strip('_')

