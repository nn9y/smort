from smort.src.translate.theory.available_theories import *


def match_fun_in_signatures(name, input_list=[], output=None, signatures=all_funs):
    name_type = type(name)
    if name_type == SpecConstant:
        symbol = name.const_type
        indices = name.value 
    elif name_type == Identifier:
        symbol = name.symbol
        indices = name.indices
    else:
        return None

    if str(symbol) in signatures:
        fun_list = signatures[symbol]
        for fun in fun_list:
            if isinstance(fun.name, name_type):
                instance = None
                if isinstance(fun.name.indices, dict):
                    # Indexed Fun
                    if fun.match_indexed_term(name, input_list):
                        instance = fun.get_indexed_instance(
                                    indices, 
                                    [inp.indices for inp in input_list]
                                )
                elif fun.par_list:
                    # parametric Fun
                    par_dict = fun.get_par_dict(name, input_list)
                    instance = generate_one_instance(fun, par_dict)
                else:
                    if fun.match_term(name, input_list, output):
                        return fun
                
                if (instance
                    and (
                        (output and output == instance.output)
                        or (not output)
                        )
                    ):
                    return instance

    return None