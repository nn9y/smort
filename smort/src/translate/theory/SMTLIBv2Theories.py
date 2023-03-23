import sys

from smort.src.translate.theory.Fun import *
from smort.src.translate.theory.utils import *
from smort.src.translate.theory.SMTLIBv2Sorts import *


def core_theory():
    sorts = {
        BOOL_NAME: BOOL
    }
    funs = {
        str(SpecConstType.B_VALUE): Fun(SpecConstant(SpecConstType.B_VALUE, None), [], BOOL),
        "not": Fun(Identifier("not"), [BOOL], BOOL),
        "=>": Fun(Identifier("=>"), [BOOL, BOOL], BOOL),
        "and": Fun(Identifier("and"), [BOOL, BOOL], BOOL),
        "or": Fun(Identifier("or"), [BOOL, BOOL], BOOL),
        "xor": Fun(Identifier("xor"), [BOOL, BOOL], BOOL),
        # parametric functions
        "=": Fun(Identifier("="), [A, A], BOOL, [A]),
        "distinct": Fun(Identifier("distinct"), [A, A], BOOL, [A]),
        "ite": Fun(Identifier("ite"), [BOOL, A, A], A, [A]),
    }

    # prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    # repl_dicts = [{A: sort} for sort in sorts]
    # funs.update(get_all_instances(funs, prefixes, repl_dicts))
    repl_dicts = [{A: sort} for sort in sorts]
    funs = merge_multi_dict([funs, get_all_instances(funs, repl_dicts)])
    
    return [sorts, funs]

def ints_theory(): 
    core_sorts, core_funs = core_theory()
    # :sorts
    sorts = {
        INT_NAME: INT,
    }
    sorts = merge_disjoint_dict([sorts, core_sorts])
    funs = {
        # :funs
        str(SpecConstType.NUMERAL): Fun(SpecConstant(SpecConstant.NUMERAL, None), [], INT),
        "-": [
            Fun(Identifier("-"), [INT], INT),
            Fun(Identifier("-"), [INT, INT], INT)
        ],
        "+": Fun(Identifier("+"), [INT, INT], INT),
        "*": Fun(Identifier("*"), [INT, INT], INT),
        "div": Fun(Identifier("div"), [INT, INT], INT),
        "mod": Fun(Identifier("mod"), [INT, INT], INT),
        "abs": Fun(Identifier("abs"), [INT], INT),
        "<=": Fun(Identifier("<="), [INT, INT], BOOL),
        "<": Fun(Identifier("<"), [INT, INT], BOOL),
        ">=": Fun(Identifier(">="), [INT, INT], BOOL),
        ">": Fun(Identifier(">"), [INT, INT], BOOL),
        # :fun-description
        "divisible": indexed_fun(
                        "divisible",
                        1,
                        [INT],
                        BOOL,
                        numeral_greater_than_x(0, 1),
                    ),
    }

    funs = merge_multi_dict([funs, core_funs])

    # prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    # repl_dicts = [{A: sort} for sort in sorts]
    # funs.update(get_all_instances(funs, prefixes, repl_dicts))
    repl_dicts = [{A: sort} for sort in sorts]
    funs = merge_multi_dict([funs, get_all_instances(funs, repl_dicts)])

    return [sorts, funs]

def reals_theory():
    core_sorts, core_funs = core_theory()
    # :sorts
    sorts = {
        REAL_NAME: REAL,
    }
    sorts = merge_disjoint_dict([sorts, core_sorts])
    # :funs
    funs = {
        str(SpecConstType.NUMERAL): Fun(SpecConstant(SpecConstant.NUMERAL, None), [], REAL),
        str(SpecConstType.DECIMAL): Fun(SpecConstant(SpecConstant.DECIMAL, None), [], REAL),
        "-": [
            Fun(Identifier("-"), [REAL], REAL),
            Fun(Identifier("-"), [REAL, REAL], REAL)
        ],
        "+": Fun(Identifier("+"), [REAL, REAL], REAL),
        "*": Fun(Identifier("*"), [REAL, REAL], REAL),
        "/": Fun(Identifier("/"), [REAL, REAL], REAL),
        "<=": Fun(Identifier("<="), [REAL, REAL], BOOL),
        "<": Fun(Identifier("<"), [REAL, REAL], BOOL),
        ">=": Fun(Identifier(">="), [REAL, REAL], BOOL),
        ">": Fun(Identifier(">"), [REAL, REAL], BOOL),
    }

    funs = merge_multi_dict([funs, core_funs])

    # prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    # repl_dicts = [{A: sort} for sort in sorts]
    # funs.update(get_all_instances(funs, prefixes, repl_dicts))
    repl_dicts = [{A: sort} for sort in sorts]
    funs = merge_multi_dict([funs, get_all_instances(funs, repl_dicts)])

    return sorts, funs

def reals_ints_theory():
    ints_sorts, ints_funs = ints_theory()
    reals_sorts, reals_funs = reals_theory()
    del reals_funs[SpecConstType.NUMERAL.value]
    # :sorts
    sorts = merge_disjoint_dict([ints_sorts, reals_sorts])
    # :funs
    funs = merge_multi_dict([ints_funs, reals_funs])
    funs["to_real"] = Fun(Identifier("to_real"), [INT], REAL)
    funs["to_int"] = Fun(Identifier("to_int"), [REAL], INT)
    funs["is_int"] = Fun(Identifier("is_int"), [REAL], BOOL)

    # prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    # repl_dicts = [{A: sort} for sort in sorts]
    # funs.update(get_all_instances(funs, prefixes, repl_dicts))
    repl_dicts = [{A: sort} for sort in sorts]
    funs = merge_multi_dict([funs, get_all_instances(funs, repl_dicts)])

    return sorts, funs

def fixedSizeBitVectors_theory():
    core_sorts, core_funs = core_theory()
    # :sorts
    sorts = {
        BIT_VECTOR_NAME: BIT_VECTOR,
    }
    sorts = merge_disjoint_dict([sorts, core_sorts])
    # :funs_description
    funs = {
        # Bitvector literals
        str(SpecConstType.BINARY): 
                    indexed_fun(
                        SpecConstant(SpecConstType.BINARY, None),
                        0,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(2)
                    ),
        str(SpecConstType.HEXADECIMAL): 
                    indexed_fun(
                        SpecConstant(SpecConstType.HEXADECIMAL, None),
                        0,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(16)
                    ),
        "concat":   indexed_fun(
                        "concat",
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        add_bitvecs_indices 
                    ),
        "extract":  indexed_fun(
                        "extract",
                        2,
                        [BIT_VECTOR],
                        BIT_VECTOR,
                        extract_bound_of_bitvec,
                        get_extract_length_of_bitvec
                    ),
        "bvnot":    indexed_fun(
                        "bvnot",
                        0,
                        [BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_indices_of_first_indexed_input
                    ),
        "bvneg":    indexed_fun(
                        "bvneg", 
                        0,
                        [BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_indices_of_first_indexed_input
                    ),
        "bvand":    indexed_fun(
                        "bvand", 
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ), 
        "bvadd":    indexed_fun(
                        "bvadd",
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "bvmul":    indexed_fun(
                        "bvmul", 
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "bvudiv":   indexed_fun(
                        "bvudiv", 
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "bvurem":   indexed_fun(
                        "bvurem", 
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "bvshl":    indexed_fun(
                        "bvshl", 
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "bvlshr":   indexed_fun(
                        "bvlshr", 
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "bvult":    indexed_fun(
                        "bvult", 
                        0,
                        [BIT_VECTOR, BIT_VECTOR],
                        BOOL,
                        eq_input_indices(0, 2, 2),
                    ),
    }

    funs = merge_multi_dict([funs, core_funs])

    # prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    # repl_dicts = [{A: sort} for sort in sorts]
    # funs.update(get_all_instances(funs, prefixes, repl_dicts))
    repl_dicts = [{A: sort} for sort in sorts]
    funs = merge_multi_dict([funs, get_all_instances(funs, repl_dicts)])

    return sorts, funs

def floatingPoints_theory():
    core_sorts, core_funs = core_theory()
    # :sorts
    sorts = {
        ROUNDING_MODE_NAME: ROUNDING_MODE,
        REAL_NAME: REAL,
        BIT_VECTOR_NAME: BIT_VECTOR,
        FLOATING_POINT_NAME: FLOATING_POINT,
        FLOAT16_NAME: FLOAT16,
        FLOAT32_NAME: FLOAT32,
        FLOAT64_NAME: FLOAT64,
        FLOAT128_NAME: FLOAT128,
    }
    sorts = merge_disjoint_dict([sorts, core_sorts])
    funs = {
        # :funs
        #   Constants for rounging modes
        "roundNearestTiesToEven": 
            Fun(Identifier("roundNearestTiesToEven"), [], ROUNDING_MODE),
        "RNE": 
            Fun(Identifier("RNE"), [], ROUNDING_MODE),
        "roundNearestTiesToAway": 
            Fun(Identifier("roundNearestTiesToAway"), [], ROUNDING_MODE),
        "RNA": 
            Fun(Identifier("RNA"), [], ROUNDING_MODE),
        "roundTowardPositive": 
            Fun(Identifier("roundTowardPositive"), [], ROUNDING_MODE),
        "RTP": 
            Fun(Identifier("RTP"), [], ROUNDING_MODE),
        "roundTowardNegative": 
            Fun(Identifier("roundTowardNegative"), [], ROUNDING_MODE),
        "RTN": 
            Fun(Identifier("RTN"), [], ROUNDING_MODE),
        "roundTowardZero": 
            Fun(Identifier("roundTowardZero"), [], ROUNDING_MODE),
        "RTZ": 
            Fun(Identifier("RTZ"), [], ROUNDING_MODE),
        # :funs_description
        #   Bitvector literals
        str(SpecConstType.BINARY): 
                    indexed_fun(
                        SpecConstant(SpecConstType.BINARY, None),
                        0,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(2)
                    ),
        str(SpecConstType.HEXADECIMAL): 
                    indexed_fun(
                        SpecConstant(SpecConstType.HEXADECIMAL, None),
                        0,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(16)
                    ),
        #   FP literals as bit string triples
        "fp":       indexed_fun(
                        "fp",
                        0,
                        [BIT_VECTOR, BIT_VECTOR, BIT_VECTOR],
                        FLOATING_POINT,
                        bitvec_bound_of_fp,
                        get_eb_sb_from_bitvec
                    ),
        #   Plus and minus infinity
        "+oo":      indexed_fun(
                        "+oo",
                        2,
                        [],
                        FLOATING_POINT,
                        numeral_greater_than_x(1, 2),
                        get_indices_from_op
                    ),
        "-oo":      indexed_fun(
                        "-oo",
                        2,
                        [],
                        FLOATING_POINT,
                        numeral_greater_than_x(1, 2),
                        get_indices_from_op
                    ),
        #   Plus and minus zero
        "+zero":    indexed_fun(
                        "+zero",
                        2,
                        [],
                        FLOATING_POINT,
                        numeral_greater_than_x(1, 2),
                        get_indices_from_op
                    ),
        "-zero":    indexed_fun(
                        "-zero",
                        2,
                        [],
                        FLOATING_POINT,
                        numeral_greater_than_x(1, 2),
                        get_indices_from_op
                    ),
        #   Non-numbers
        "NaN":      indexed_fun(
                        "NaN",
                        2,
                        [],
                        FLOATING_POINT,
                        numeral_greater_than_x(1, 2),
                        get_indices_from_op
                    ),
        #   Operators
        "fp.abs":   indexed_fun(
                        "fp.abs",
                        0,
                        [FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_indices_of_first_indexed_input
                    ),
        "fp.neg":   indexed_fun(
                        "fp.neg",
                        0,
                        [FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_indices_of_first_indexed_input
                    ),
        "fp.add":   indexed_fun(
                        "fp.add",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        eq_input_indices(1, 3, 3),
                        get_indices_of_first_indexed_input
                    ),
        "fp.sub":   indexed_fun(
                        "fp.sub",
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        eq_input_indices(1, 3, 3),
                        get_indices_of_first_indexed_input
                    ),
        "fp.mul":   indexed_fun(
                        "fp.mul",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        eq_input_indices(1, 3, 3),
                        get_indices_of_first_indexed_input
                    ),
        "fp.div":   indexed_fun(
                        "fp.div",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        eq_input_indices(1, 3, 3),
                        get_indices_of_first_indexed_input
                    ),
        "fp.fma":   indexed_fun(
                        "fp.fma",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        eq_input_indices(1, 4, 4),
                        get_indices_of_first_indexed_input
                    ),
        "fp.sqrt":  indexed_fun(
                        "fp.sqrt",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_indices_of_first_indexed_input
                    ),
        "fp.rem":   indexed_fun(
                        "fp.rem",
                        0,
                        [FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "fp.roundToIntegral": 
                    indexed_fun(
                        "fp.roundToIntegral",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_indices_of_first_indexed_input
                    ),
        "fp.min":   indexed_fun(
                        "fp.min",
                        0,
                        [FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "fp.max":   indexed_fun(
                        "fp.max",
                        0,
                        [FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        eq_input_indices(0, 2, 2),
                        get_indices_of_first_indexed_input
                    ),
        "fp.leq":   indexed_fun(
                        "fp.leq",
                        0,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL,
                        eq_input_indices(0, 2, 2),
                    ),
        "fp.lt":    indexed_fun(
                        "fp.lt",
                        0,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL,
                        eq_input_indices(0, 2, 2),
                    ),
        "fp.geq":   indexed_fun(
                        "fp.geq",
                        0,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL,
                        eq_input_indices(0, 2, 2),
                    ),
        "fp.gt":    indexed_fun(
                        "fp.gt",
                        0,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL,
                        eq_input_indices(0, 2, 2),
                    ),
        "fp.eq":    indexed_fun(
                        "fp.eq",
                        0, 
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL,
                        eq_input_indices
                    ),
        "fp.isNormal":
                    indexed_fun(
                        "fp.isNormal",
                        0,
                        [FLOATING_POINT],
                        BOOL
                    ),
        "fp.isSubnormal": 
                    indexed_fun(
                        "fp.isSubnormal",
                        0,
                        [FLOATING_POINT],
                        BOOL
                    ),
        "fp.isZero": 
                    indexed_fun(
                        "fp.isZero",
                        0,
                        [FLOATING_POINT],
                        BOOL
                    ),
        "fp.isInfinite":
                    indexed_fun(
                        "fp.isInfinite",
                        0,
                        [FLOATING_POINT],
                        BOOL
                    ),
        "fp.isNaN": indexed_fun(
                        "fp.isNaN",
                        0, 
                        [FLOATING_POINT],
                        BOOL
                    ),
        "fp.isNegative": 
                    indexed_fun(
                        "fp.isNegative",
                        0,
                        [FLOATING_POINT],
                        BOOL
                    ),
        "fp.isPositive": 
                    indexed_fun(
                        "fp.isPositive",
                        0,
                        [FLOATING_POINT],
                        BOOL
                    ),
        #   Conversions from other sorts
        "to_fp":[
                    indexed_fun(
                        "to_fp",
                        2,
                        [BIT_VECTOR],
                        FLOATING_POINT,
                        eb_plus_sb_eq_m,
                        get_indices_from_op
                    ),
                    indexed_fun(
                        "to_fp",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op
                    ),
                    indexed_fun(
                        "to_fp",
                        0,
                        [ROUNDING_MODE, REAL],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op
                    ),
                    indexed_fun(
                        "to_fp",
                        0,
                        [ROUNDING_MODE, BIT_VECTOR],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op
                    )
                ],
        "to_fp_unsigned": 
                    indexed_fun(
                        "to_fp_unsigned",
                        0,
                        [ROUNDING_MODE, BIT_VECTOR],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op
                    ),
        #   Conversions to other sorts
        "fp.to_ubv": 
                    indexed_fun(
                        "fp.to_ubv",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT],
                        BIT_VECTOR,
                        None,
                        get_indices_from_op
                    ),
        "fp.to_sbv": 
                    indexed_fun(
                        "fp.to_sbv",
                        0,
                        [ROUNDING_MODE, FLOATING_POINT],
                        BIT_VECTOR,
                        None,
                        get_indices_from_op
                    ),
        "fp.to_real": 
                    indexed_fun(
                        "fp.to_real",
                        0,
                        [FLOATING_POINT],
                        REAL
                    ),
    }

    funs = merge_multi_dict([funs, core_funs])

    # prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    # repl_dicts = [{A: sort} for sort in sorts]
    # funs.update(get_all_instances(funs, prefixes, repl_dicts))
    repl_dicts = [{A: sort} for sort in sorts]
    funs = merge_multi_dict([funs, get_all_instances(funs, repl_dicts)])

    return sorts, funs

def strings_theory():
    core_sorts, core_funs = core_theory()
    # :sorts
    sorts = {
        STRING_NAME: STRING,
        REG_LAN_NAME: REG_LAN,
        INT_NAME: INT,
    }
    sorts = merge_disjoint_dict([sorts, core_sorts])
    funs = {
    # :funs_description
    #   strings consisting of exactly one character
        "char":     indexed_fun(
                        "char",
                        1,
                        [],
                        STRING,
                        hex_is_char,
                    ),
    #   string iterals "<STRING>"
        str(SpecConstType.STRING): Fun(SpecConstant(SpecConstType.STRING, None), [], STRING),
    # :funs
    # Core functions
    #   String functions
        "str.++":
            Fun(Identifier("str.++"), [STRING, STRING], STRING),
        "str.len":
            Fun(Identifier("str.len"), [STRING], INT),
        "str.<":
            Fun(Identifier("str.<"), [STRING, STRING], BOOL),
    #   Regular expression functions
        "str.to_re":
            Fun(Identifier("str.to_re"), [STRING], REG_LAN),
        "str.in_re":
            Fun(Identifier("str.in_re"), [STRING, REG_LAN], BOOL),
        "re.none":
            Fun(Identifier("re.none"), [], REG_LAN),
        "re.all":
            Fun(Identifier("re.all"), [], REG_LAN),
        "re.allchar":
            Fun(Identifier("re.allchar"), [], REG_LAN),
        "re.++":
            Fun(Identifier("re.++"), [REG_LAN, REG_LAN], REG_LAN),
        "re.union":
            Fun(Identifier("re.union"), [REG_LAN, REG_LAN], REG_LAN),
        "re.inter":
            Fun(Identifier("re.inter"), [REG_LAN, REG_LAN], REG_LAN),
        "re.*":
            Fun(Identifier("re.*"), [REG_LAN], REG_LAN),
    #   Additional functions
        "str.<=":
            Fun(Identifier("str.<="), [STRING, STRING], BOOL),
        "str.at":
            Fun(Identifier("str.at"), [STRING, INT], STRING),
        "str.substr":
            Fun(Identifier("str.substr"), [STRING, INT, INT], STRING),
        "str.prefixof":
            Fun(Identifier("str.prefixof"), [STRING, STRING], BOOL),
        "str.suffixof":
            Fun(Identifier("str.suffixof"), [STRING, STRING], BOOL),
        "str.contains":
            Fun(Identifier("str.contains"), [STRING, STRING], BOOL),
        "str.indexof":
            Fun(Identifier("str.indexof"), [STRING, STRING, INT], INT),
        "str.replace":
            Fun(Identifier("str.replace"), [STRING, STRING, STRING], STRING),
        "str.replace_all":
            Fun(Identifier("str.replace_all"), [STRING, STRING, STRING], STRING),
        "str.replace_re":
            Fun(Identifier("str.replace_re"), [STRING, REG_LAN, STRING], STRING),
        "str.replace_re_all":
            Fun(Identifier("str.replace_re_all"), [STRING, REG_LAN, STRING], STRING),
        "re.comp":
            Fun(Identifier("re.comp"), [REG_LAN], REG_LAN),
        "re.diff":
            Fun(Identifier("re.diff"), [REG_LAN, REG_LAN], REG_LAN),
        "re.+":
            Fun(Identifier("re.+"), [REG_LAN], REG_LAN),
        "re.opt":
            Fun(Identifier("re.opt"), [REG_LAN], REG_LAN),
        "re.range":
            Fun(Identifier("re.range"), [STRING, STRING], REG_LAN),
        # :funs_description
        "re.^":     indexed_fun(
                        "re.^",
                        1,
                        [REG_LAN],
                        REG_LAN,
                        numeral_greater_than_x(-sys.maxint-1, 1) 
                    ),
        "re.loop":  indexed_fun(
                        "re.loop",
                        2,
                        [REG_LAN],
                        REG_LAN,
                        numeral_greater_than_x(-sys.maxint-1, 2) 
                    ),
        "str.is_digit":
            Fun(Identifier("str.is_digit"), [STRING], BOOL),
        "str.to_code":
            Fun(Identifier("str.to_code"), [STRING], INT),
        "str.from_code":
            Fun(Identifier("str.from_code"), [INT], STRING),
        "str.to_int":
            Fun(Identifier("str.to_int"), [STRING], INT),
        "str.from_int":
            Fun(Identifier("str.from_int"), [INT], STRING),
    }

    funs = merge_multi_dict([funs, core_funs])

    # prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    # repl_dicts = [{A: sort} for sort in sorts]
    # funs.update(get_all_instances(funs, prefixes, repl_dicts))
    repl_dicts = [{A: sort} for sort in sorts]
    funs = merge_multi_dict([funs, get_all_instances(funs, repl_dicts)])

    return sorts, funs



def arraysEX_theory():
    core_sorts, core_funs = core_theory()
    # sorts
    sorts = {
        ARRAY_NAME: ARRAY,
    }
    sorts = merge_disjoint_dict([sorts, core_sorts])
    # parameters
    X = "X"
    Y = "Y"
    funs = {
        "select":   Fun(
                        Identifier("select"),
                        [ARRAY([X, Y]), X],
                        Y,
                        [X, Y]
                    ),
        "store":    Fun(
                        Identifier("store"),
                        [ARRAY([X, Y]), X, Y],
                        ARRAY([X, Y]),
                        [X, Y]
                    ),
    }
    funs = merge_multi_dict([funs, core_funs])

    # Infinite funs be be generated
    # TODO
    # use 'generate_one_instance()' to check if is a valid instance

    return sorts, funs
