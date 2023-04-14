from smort.src.translate.theory.available_theories import *


def get_sort_in_synonym(symbol: str, pars: list, synonyms: dict):
    """
    convert symbol to "basic" sort synonym
    par_list is replaced by pars
    """
    if symbol in synonyms:
        sort, par_list = synonyms[symbol]
        par_dict = {}
        for i, par in enumerate(par_list):
            # assuming elements of par_list are all string
            par_dict[par] = pars[i]
        return sort.get_parametric_instance(par_dict)
    return None


def match_fun_in_signatures(name, input_list, signatures: dict):
    """
    :return: Sort of output if matched or None else
    """
    name_type = type(name)
    if name_type == SpecConstant:
        symbol = name.const_type
        indices = name.value 
    elif name_type == Identifier:
        symbol = name.symbol
        indices = name.indices
    else:
        return None
    
    input_indices_list = [input_sort.id_.indices for input_sort in input_list]

    if str(symbol) in signatures:
        fun_list = signatures[str(symbol)]
        if not isinstance(fun_list, list):
            fun_list = [fun_list]
        for fun in fun_list:
            if isinstance(fun.name, name_type):
                fun_output = None
                if (name_type == SpecConstant) or (isinstance(fun.name.indices, dict)):
                    # SpecConstant or Indexed Fun (name is an Identifier) 
                    if fun.match_indexed_term(name, input_list):
                        fun_output = fun.get_indexed_output(
                                    indices,
                                    input_indices_list
                                )
                elif fun.par_list:
                    # parametric Fun
                    par_dict = fun.get_par_dict(name, input_list)
                    fun_output = fun.get_parametric_output(par_dict)
                else:
                    if fun.match_term(name, input_list):
                        fun_output = fun.output
 
                if fun_output:
                    return fun_output 
    
    # special check for (_ bvX n)
    if name_type == Identifier and len(name.indices) == 1:
        if name.id_.symbol[0:2] == 'bv':
            # return (_ BitVec n)
            return BIT_VECTOR.get_indexed_instance([name.id_.indices])

    return None