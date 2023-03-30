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


def match_fun_in_signatures(name, input_list, output, signatures: dict):
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
        fun_list = signatures[str(symbol)]
        for fun in fun_list:
            if isinstance(fun.name, name_type):
                instance = None
                if (name_type == SpecConstant) or (isinstance(fun.name.indices, dict)):
                    # SpecConstant or Indexed Fun (name is an Identifier) 
                    if fun.match_indexed_term(name, input_list):
                        instance = fun.get_indexed_instance(
                                    indices, 
                                    [inp.id_.indices for inp in input_list]
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