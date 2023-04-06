import copy
import re
from inspect import isfunction
from collections import defaultdict

from smort.src.translate.tools.Ast import *
from smort.src.translate.theory.utils import *


class Fun:
    def __init__(self, name, input_list, output: Sort, par_list=None, constraints=None, get_output_indices=None):
        self.name = name    # Identifier or SpecConstantType
        self.input_list = input_list
        self.output = output
        self.par_list = par_list
        self.constraints = constraints
        self.get_output_indices = get_output_indices
  
    def match_term(self, name, input_list, output=None):
        """
        check if an term(expr)'s name and input_list (, output) match this fun
        """
        name_type = type(self.name)
        if type(name) != name_type:
            return False
        if (name_type == SpecConstant) and (self.name.const_type != name.const_type):
            return False
        if (name_type == Identifier) and (self.name != name):
            return False
        if self.input_list != input_list:
            return False
        if output and output != self.output:    # use qual_identifier in grammar
            return False
        return True
 
    def match_indexed_term(self, name, input_list):
        """
        check if an term(expr)'s name and input_list match this indexed fun
        output are checked later when qual_identifier exists in grammar
        """
        name_type = type(self.name)
        if type(name) != name_type:
            return False
        if (name_type == SpecConstant) and (self.name.const_type != name.const_type):
            return False
        if (name_type == Identifier) and (not self.name.same_indexed_type(name)):
            return False
        if len(self.input_list) != len(input_list):
            return False
        for i, input_sort in enumerate(self.input_list):
            if not input_sort.same_indexed_type(input_list[i]):
                return False
        return True
    
    def get_par_dict(self, name, input_list):
        if not (isinstance(self.name, Identifier) and self.name.same_indexed_type(name)):
            return {}
        par_dict = get_par_dict(self.input_list, input_list) 
        return par_dict
 
    def get_indexed_instance(self, name_indices, input_indices_list):
        if isfunction(self.constraints):
            if not self.constraints(name_indices, input_indices_list):
                return None
        if isinstance(self.name, Identifier):
            name_instance = self.name.get_indexed_instance(name_indices)
        else:
            name_instance = SpecConstant(self.name.const_type, name_indices)
        input_instances = []
        for i, input_indices in enumerate(input_indices_list):
            input_instances.append(self.input_list[i].get_indexed_instance(input_indices))
        if isfunction(self.get_output_indices):
            output_instance = self.output.get_indexed_instance(
                self.get_output_indices(name_indices, input_indices_list)
            )
        else:
            output_instance = self.output.get_indexed_instance([])
        return Fun(name_instance, input_instances, output_instance, copy.deepcopy(self.par_list)) 
    
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
        if (
            (self.par_list == None or self.par_list == [])
            and (other.par_list == None or other.par_list == [])
        ):
            return True
        if self.par_list != other.par_list:
            return False
        return True

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
    def _parametric_sort(par_list: list):
        """
        called in construction of parametric functions to fill parameter placeholder (string)
        """
        if len(par_list) != arity:
            raise TheoryException(f"length of 'par_list' should be {arity}")
        return Sort(Identifier(symbol), par_list)
    return _parametric_sort


# def indexed_sort_with_arity(symbol: str, indices_len, arity, constraint=None):
#     if indices_len <= 0:
#         raise TheoryException("'indices_len' should be an positive number")
#     if arity < 0:
#         raise TheoryException("'arity' should be non-negative integer")
#     id_ = Identifier(symbol, {"len": indices_len})
#     if arity == 0:
#         return Sort(id_, [], constraint)
#     def _indexed_parametric_sort(pars: list):
#         if len(pars) != arity:
#             raise TheoryException(f"length of 'pars' should be {arity}")
#         return Sort(id_, pars, constraint)
#     return _indexed_parametric_sort


def indexed_fun(
        name_symbol,    # str or SpecConstType
        name_indices_len,
        input_list,
        output: Sort,
        constraints=None,
        get_output_indices=None,
        par_list=None):
    """
    if any identifier (or SpecConstant) in name or sort list of function is indexed, this is an indexed fun
        type(name.indices) == dict is a marker for indexed fun, it can be 0
    """
    if name_indices_len < 0:
        raise TheoryException("'name_indices_len' should be an non-negative number")
    if isinstance(name_symbol, str):
        name = Identifier(name_symbol, {"len": name_indices_len})
    else:
        name = SpecConstant(name_symbol, None)
    return Fun(
        name,
        input_list,
        output,
        par_list,
        constraints,
        get_output_indices
    )


# parametric sort is marked by non-empty parsorts
# parametric function is marked by non-empty par_list


def get_all_instances(funs: dict, repl_dicts: list):
    """
    find parametric templates in funs and get all instances of them by repl_dicts
    """
    instances = defaultdict(list) 
    for keyname, fun in funs.items():
        if not isinstance(fun, list):
            fun = [fun]
        for f in fun:
            if f.par_list:
            # parametric template
                for i in range(len(repl_dicts)):
                    instance = generate_one_instance(
                        f,
                        repl_dicts[i],
                    )
                    if instance:
                        instances[keyname].append(instance)
    return instances


def generate_one_instance(template: Fun, repl_dict):
    """
    generate fun instance by replacing parameters in template using repl_dict 
    """
    repl_input_list = []
    for sort in template.input_list:
        repl_sort = _get_repl_sort(sort, repl_dict)
        if repl_sort:
            repl_input_list.append(repl_sort)
        else:
            return None
    repl_output = _get_repl_sort(template.output, repl_dict)
    if not repl_output:
        return None
    name = copy.deepcopy(template.name) 
    return Fun(name, repl_input_list, repl_output)


def _get_repl_sort(sort, repl_dict):
    """
    replace parameters by sort in repl_dict
    """
    if isinstance(sort, str) and (sort in repl_dict):
        return repl_dict[sort]
    elif isinstance(sort, Sort):
        if len(sort.parsorts) > 0:
            repl_sort = sort.get_parametric_instance(repl_dict)
            return repl_sort
        else:
            return copy.deepcopy(sort)
    else:
        return None


# def pascal_case_to_snake_case(camel_case: str):
#     snake_case = re.sub(r"(?P<key>[A-Z])", r"_\g<key>", camel_case)
#     return snake_case.lower().strip('_')

