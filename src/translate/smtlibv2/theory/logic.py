from theories import *

ints_sorts, ints_funs = ints_theory()
reals_sorts, reals_funs = reals_theory()
reals_ints_sorts, reals_ints_funs = reals_ints_theory()
bitvecs_sorts, bitvecs_funs = fixedSizeBitVectors_theory()
fps_sorts, fps_funs = floatingPoints_theory()
strs_sorts, strs_funs = strings_theory()
ax_sorts, ax_funs = arraysEX_theory()

_funs_dicts = [ints_funs, reals_funs, reals_ints_funs, 
    bitvecs_funs, fps_funs, strs_funs, ax_funs]

all_sorts = [
    BOOL, INT, REAL, ROUNDING_MODE, BIT_VECTOR,
    FLOATING_POINT, FLOAT16, FLOAT32, FLOAT64, FLOAT128,
    STRING, REG_LAN, ARRAY
]

all_funs = merge_funs_dict(_funs_dicts)

def get_fun_in_theories(op, input_list=[]):
    name = None
    op_type = None
    if isinstance(op, SpecConstant):
        name = op.value
        op_type = SpecConstType
    elif isinstance(op, Identifier):
        name = op.symbol
        op_type = Identifier
    else:
        return None

    if name and (name in all_funs):
        fun_list = all_funs[name]
        for fun in fun_list:
            if isinstance(fun.name, op_type):
                if fun.par_list:
                    # arraysEX
                    par_dict = fun.get_par_dict(op, input_list)
                    instance = generate_one_instance(fun, par_dict)
                    if instance:
                        return instance
                elif (op_type == Identifier) and (isinstance(fun.name.indices, dict)):
                    # Indexed Fun
                    if fun.match_indexed_type(op, input_list):
                        instance = fun.get_indexed_instance(
                                op.indices, 
                                [inp.indices for inp in input_list]
                            )
                        if instance:
                            return instance
                else:
                    if fun.match(op, input_list):
                        return fun

    return None