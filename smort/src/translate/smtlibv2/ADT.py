from smort.src.translate.theory.Fun import Fun, sort_with_arity

# Algebraic Data Type

def create_adt(name, arity):
    return sort_with_arity(name, arity) 

def create_constructor(name, input_list, output, par_list):
    return Fun(name, input_list, output, par_list)

def create_selector(name, input_list, output, par_list):
    return Fun(name, input_list, output, par_list)

def deal_constructor_dec(constructor_dec, adt, par_list=None):
    constructor_name, selector_decs = constructor_dec.name, constructor_dec.sdecs
    constructor_input_list = []
    selector_list = []
    for selector_name, sort in selector_decs:
        selector_list.append(create_selector(
                                selector_name,
                                adt,
                                sort,
                                par_list
                            ))
        constructor_input_list.append(sort)
    constructor = create_constructor(
                    constructor_name,
                    constructor_input_list,
                    adt,
                    par_list)
    return [constructor] + selector_list 


