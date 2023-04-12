import copy
from inspect import isfunction

from smort.src.translate.tools.Term import *
from smort.src.translate.tools.Sort import *
from smort.src.translate.theory.utils import *


class Fun:
    def __init__(self, name, inputs, output, par_list=None, constraints=None, get_output_indices=None):
        self.name = name        # Identifier or SpecConstantType
        self.inputs = inputs    # list or set of Sort
        self.output = output
        self.par_list = par_list
        self.constraints = constraints
        self.get_output_indices = get_output_indices
  
    def match_term(self, name, inputs):
        """
        check if an term's name and inputs match this fun
        """
        name_type = type(self.name)
        if type(name) != name_type:
            return False
        if (name_type == SpecConstant) and (self.name.const_type != name.const_type):
            return False
        if (name_type == Identifier) and (self.name != name):
            return False
        if isinstance(self.inputs, set):
            for inp in inputs:
                if inp not in self.inputs:
                    return False
        elif self.inputs != inputs:
            return False
        return True
 
    def match_indexed_term(self, name, inputs):
        """
        check if an term's name and inputs match this indexed fun
        """
        name_type = type(self.name)
        if type(name) != name_type:
            return False
        if name_type == SpecConstant:
            if self.name.const_type != name.const_type:
                return False
            else:
                name_indices = name.value
        elif name_type == Identifier:
            if not self.name.same_indexed_type(name):
                return False
            else:
                name_indices = name.id_indices
        if isinstance(self.inputs, set):
            for inp in inputs:
                valid = False
                for inp_sort in self.inputs:
                    if inp_sort.same_indexed_type(inp):
                        valid = True
                        break
                if not valid:
                    return False
        else:
            if len(self.inputs) != len(inputs):
                return False
            for i, inp_sort in enumerate(self.inputs):
                if not inp_sort.same_indexed_type(inputs[i]):
                    return False
        input_indices_list = [input_sort.id_.indices for input_sort in inputs]
        if isfunction(self.constraints):
            if not self.constraints(name_indices, input_indices_list):
                return False 
        return True
 
    def get_indexed_output(self, name_indices, input_indices_list):
        if isfunction(self.get_output_indices):
            return self.output.get_indexed_instance(
                self.get_output_indices(name_indices, input_indices_list)
            )
        else:
            return self.output.get_indexed_instance([])
    
    def get_par_dict(self, name, inputs):
        """
        get dict of parameters' instances for a parametric fun by matching inputs
        """
        if not (isinstance(self.name, Identifier) and self.name.same_indexed_type(name)):
            return {}
        par_dict = get_par_dict(self.inputs, inputs) 
        return par_dict
    
    def get_parametric_inputs(self, par_dict):
        if isinstance(self.inputs, set):
            return {_get_repl_sort(inp, par_dict) for inp in self.inputs}
        else:
            return [_get_repl_sort(inp, par_dict) for inp in self.inputs]

    def get_parametric_output(self, par_dict):
        return _get_repl_sort(self.output, par_dict)
 
    def __eq__(self, other):
        """
        check if 2 fun instances are equal
        """
        if not isinstance(other, Fun):
            return False
        if self.name != other.name:
            return False
        if self.inputs != other.inputs:
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
        fun_decl_str = f"({self.name} {list2str(self.inputs)} {self.output})"
        if self.par_list:
            return f"(par ({list2str(self.par_list)}) {fun_decl_str})"
        else:
            return fun_decl_str
        
    def __repr__(self):
        return self.__str__()



def indexed_fun(
        name_symbol,    # str or SpecConstType
        name_indices_len: int,
        inputs,         # set or list
        output: Sort,
        constraints=None,
        get_output_indices=None,
        par_list=None):
    """
    If any identifier (or SpecConstant) in name or sort list of function is indexed, this is an indexed fun.
    type(name.indices) == dict("len": {len(name.indices)}) is a marker for indexed fun, the length should be non-negative int. 
    """
    if name_indices_len < 0:
        raise TheoryException("'name_indices_len' should be an non-negative number")
    if isinstance(name_symbol, str):
        name = Identifier(name_symbol, {"len": name_indices_len})
    else:
        name = SpecConstant(name_symbol, None)
    return Fun(
        name,
        inputs,
        output,
        par_list,
        constraints,
        get_output_indices
    )


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

