import sys
from Fun import *
from util import *

# sorts 
BOOL = Sort(Identifier("Bool"), [])
INT = Sort(Identifier("Int"), [])
REAL = Sort(Identifier("Real"), [])
ROUNDING_MODE = Sort(Identifier("RoundingMode"), [])
BIT_VECTOR = indexed_sort(
    "BitVec",
    sort_indices_numeral_greater_than_x(0, 1)
)
FLOATING_POINT = indexed_sort(
    "FloatingPoint",
    sort_indices_numeral_greater_than_x(1, 2)
)
FLOAT16 = Sort(Identifier("Float16"), [])
FLOAT32 = Sort(Identifier("Float32"), [])
FLOAT64 = Sort(Identifier("Float64"), [])
FLOAT128 = Sort(Identifier("Float128"), [])
STRING = Sort(Identifier("String"), [])
REG_LAN = Sort(Identifier("RegLan"), [])
ARRAY = arity_sort("Array", 2) 

# parameters
A = "A"
X = "X"
Y = "Y"

def core_theory():
    sorts = [BOOL]
    funs = {
        "boolTrue": Fun(Identifier("true"), [], BOOL),
        "boolFalse": Fun(Identifier("false"), [], BOOL),
        "boolNot": Fun(Identifier("not"), [BOOL], BOOL),
        "boolImplies": Fun(Identifier("=>"), [BOOL, BOOL], BOOL),
        "boolAnd": Fun(Identifier("and"), [BOOL, BOOL], BOOL),
        "boolOr": Fun(Identifier("or"), [BOOL, BOOL], BOOL),
        "boolXor": Fun(Identifier("xor"), [BOOL, BOOL], BOOL),
        # parametric functions
        "_Eq": Fun(Identifier("="), [A, A], BOOL, [A]),
        "_Distinct": Fun(Identifier("distinct"), [A, A], BOOL, [A]),
        "_Ite": Fun(Identifier("ite"), [BOOL, A, A], A, [A]),
    }

    prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    repl_dicts = [{A: sort} for sort in sorts]
    funs.update(get_all_instances(funs, prefixes, repl_dicts))
    
    return [sorts, funs]

def ints_theory(): 
    _, core_funs = core_theory()
    # :sorts
    sorts = [BOOL, INT]
    funs = {
        # :funs
        "intNumeral": Fun(Identifier("NUMERAL"), [], INT),
        "intNegation": Fun(Identifier("-"), [INT], INT),
        "intSubtraction": Fun(Identifier("-"), [INT, INT], INT),
        "intAddition": Fun(Identifier("+"), [INT, INT], INT),
        "intMultiplication": Fun(Identifier("*"), [INT, INT], INT),
        "intDivision": Fun(Identifier("div"), [INT, INT], INT),
        "intModulo": Fun(Identifier("mod"), [INT, INT], INT),
        "intAbsolute": Fun(Identifier("abs"), [INT], INT),
        "intLE": Fun(Identifier("<="), [INT, INT], BOOL),
        "intLess": Fun(Identifier("<"), [INT, INT], BOOL),
        "intGE": Fun(Identifier(">="), [INT, INT], BOOL),
        "intGreater": Fun(Identifier(">"), [INT, INT], BOOL),
        # :fun-description
        "intDivisible": indexed_fun(
                        "divisible",
                        op_indices_numeral_greater_than_x(0, 1),
                        [INT],
                        BOOL),
    }

    funs.update(core_funs)

    prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    repl_dicts = [{A: sort} for sort in sorts]
    funs.update(get_all_instances(funs, prefixes, repl_dicts))

    return [sorts, funs]

def reals_theory():
    _, core_funs = core_theory()
    # :sorts
    sorts = [BOOL, REAL] 
    # :funs
    funs = {
        "realNumeral": Fun(Identifier("NUMERAL"), [], REAL),
        "realDecimal": Fun(Identifier("DECIMAL"), [], REAL),
        "realNegation": Fun(Identifier("-"), [REAL], REAL),
        "realSubtraction": Fun(Identifier("-"), [REAL, REAL], REAL),
        "realAddition": Fun(Identifier("+"), [REAL, REAL], REAL),
        "realMultiplication": Fun(Identifier("*"), [REAL, REAL], REAL),
        "realDivision": Fun(Identifier("/"), [REAL, REAL], REAL),
        "realLE": Fun(Identifier("<="), [REAL, REAL], BOOL),
        "realLess": Fun(Identifier("<"), [REAL, REAL], BOOL),
        "realGE": Fun(Identifier(">="), [REAL, REAL], BOOL),
        "realGreater": Fun(Identifier(">"), [REAL, REAL], BOOL),
    }
    funs.update(core_funs)

    prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    repl_dicts = [{A: sort} for sort in sorts]
    funs.update(get_all_instances(funs, prefixes, repl_dicts))

    return sorts, funs

def reals_ints_theory():
    _, ints_funs = ints_theory()
    _, reals_funs = reals_theory()
    # :sorts
    sorts = [BOOL, INT, REAL]
    # :funs
    ints_funs.update(reals_funs)
    funs = ints_funs
    del funs["realNumeral"]
    funs["intToReal"] = Fun(Identifier("to_real"), [INT], REAL)
    funs["realToInt"] = Fun(Identifier("to_int"), [REAL], INT)
    funs["realIsInt"] = Fun(Identifier("is_int"), [REAL], BOOL)

    prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    repl_dicts = [{A: sort} for sort in sorts]
    funs.update(get_all_instances(funs, prefixes, repl_dicts))

    return sorts, funs

def fixedsizebitvectors_theory():
    _, core_funs = core_theory()
    # :sorts
    sorts = [BOOL]
    # :sorts_description
    sorts.append(BIT_VECTOR)
    # :funs_description
    funs = {
        # Bitvector literals
        "bitvecBinary": indexed_fun(
                        "BINARY",
                        None,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(2)),
        "bitvecHexdecimal": indexed_fun(
                        "HEXDECIMAL",
                        None,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(16)),
        "bitvecConcat": indexed_fun(
                        "concat",
                        None,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        add_number_of_binary_digits),
        "bitvecExtract": indexed_fun(
                        "extract",
                        extract_bound_of_bitvec,
                        [BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_extract_from_bitvec),
        "bitvecNot": indexed_fun(
                        "bvnot", 
                        None,
                        [BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecNeg": indexed_fun(
                        "bvneg", 
                        None,
                        [BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecAnd": indexed_fun(
                        "bvand", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecOr": indexed_fun(
                        "bvor", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecAdd": indexed_fun(
                        "bvadd", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecMul": indexed_fun(
                        "bvmul", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecUdiv": indexed_fun(
                        "bvudiv", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecUrem": indexed_fun(
                        "bvurem", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecShl": indexed_fun(
                        "bvshl", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecLshr": indexed_fun(
                        "bvlshr", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BIT_VECTOR,
                        None,
                        get_index_of_first_input),
        "bitvecUlt": indexed_fun(
                        "bvult", 
                        eq_input_indices,
                        [BIT_VECTOR, BIT_VECTOR],
                        BOOL),
    }

    funs.update(core_funs)

    prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    repl_dicts = [{A: sort} for sort in sorts]
    funs.update(get_all_instances(funs, prefixes, repl_dicts))

    return sorts, funs

def floatingPoints_theory():
    _, core_funs = core_theory()
    # :sorts
    sorts = [BOOL, ROUNDING_MODE, REAL]
    # :sorts_description
    sorts.append(BIT_VECTOR)
    sorts.append(FLOATING_POINT)
    # :sorts
    # Short name for common floating point sorts
    sorts += [FLOAT16, FLOAT32, FLOAT64, FLOAT128]
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
        "bitvecBinary": indexed_fun(
                        "BINARY",
                        None,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(2)),
        "bitvecHexdecimal": indexed_fun(
                        "HEXDECIMAL",
                        None,
                        [],
                        BIT_VECTOR,
                        None,
                        get_number_of_binary_digits(16)),
        #   FP literals as bit string triples
        "fpIteral": indexed_fun(
                        "fp",
                        bitvec_bound_of_fp,
                        [BIT_VECTOR, BIT_VECTOR, BIT_VECTOR],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_bitvec),
        #   Plus and minus infinity
        "fpPlusInfinity": indexed_fun(
                        "+oo",
                        op_indices_numeral_greater_than_x(1, 2),
                        [],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        "fpMinusInfinity": indexed_fun(
                        "-oo",
                        op_indices_numeral_greater_than_x(1, 2),
                        [],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        #   Plus and minus zero
        "fpPlusZero": indexed_fun(
                        "+zero",
                        op_indices_numeral_greater_than_x(1, 2),
                        [],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        "fpMinusZero": indexed_fun(
                        "-zero",
                        op_indices_numeral_greater_than_x(1, 2),
                        [],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        #   Non-numbers
        "fpNaN": indexed_fun(
                        "NaN",
                        op_indices_numeral_greater_than_x(1, 2),
                        [],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        #   Operators
        "fpAbs": indexed_fun(
                        "fp.abs",
                        None,
                        [FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpNeg": indexed_fun(
                        "fp.neg",
                        None,
                        [FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpAdd": indexed_fun(
                        "fp.add",
                        eq_input_indices,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpSub": indexed_fun(
                        "fp.sub",
                        eq_input_indices,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpMul": indexed_fun(
                        "fp.mul",
                        eq_input_indices,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpDiv": indexed_fun(
                        "fp.div",
                        eq_input_indices,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpFma": indexed_fun(
                        "fp.fma",
                        eq_input_indices,
                        [ROUNDING_MODE, FLOATING_POINT, FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpSqrt": indexed_fun(
                        "fp.sqrt",
                        eq_input_indices,
                        [ROUNDING_MODE, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpRem": indexed_fun(
                        "fp.rem",
                        eq_input_indices,
                        [FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpRoundingToIntegral": indexed_fun(
                        "fp.roundToIntegral",
                        eq_input_indices,
                        [ROUNDING_MODE, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpMin": indexed_fun(
                        "fp.min",
                        eq_input_indices,
                        [FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpMax": indexed_fun(
                        "fp.max",
                        eq_input_indices,
                        [FLOATING_POINT, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_eb_sb_from_first_input),
        "fpLeq": indexed_fun(
                        "fp.leq",
                        eq_input_indices,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL),
        "fpLt": indexed_fun(
                        "fp.lt",
                        eq_input_indices,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL),
        "fpGeq": indexed_fun(
                        "fp.geq",
                        eq_input_indices,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL),
        "fpGt": indexed_fun(
                        "fp.gt",
                        eq_input_indices,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL),
        "fpEq": indexed_fun(
                        "fp.eq",
                        eq_input_indices,
                        [FLOATING_POINT, FLOATING_POINT],
                        BOOL),
        "fpIsNormal": indexed_fun(
                        "fp.isNormal",
                        None,
                        [FLOATING_POINT],
                        BOOL),
        "fpIsSubnormal": indexed_fun(
                        "fp.isSubnormal",
                        None,
                        [FLOATING_POINT],
                        BOOL),
        "fpIsZero": indexed_fun(
                        "fp.isZero",
                        None,
                        [FLOATING_POINT],
                        BOOL),
        "fpIsInfinite": indexed_fun(
                        "fp.isInfinite",
                        None,
                        [FLOATING_POINT],
                        BOOL),
        "fpIsNaN": indexed_fun(
                        "fp.isNaN",
                        None,
                        [FLOATING_POINT],
                        BOOL),
        "fpIsNegative": indexed_fun(
                        "fp.isNegative",
                        None,
                        [FLOATING_POINT],
                        BOOL),
        "fpIsPositive": indexed_fun(
                        "fp.isPositive",
                        None,
                        [FLOATING_POINT],
                        BOOL),
        #   Conversions from other sorts
        "bitvecToFp": indexed_fun(
                        "to_fp",
                        m_eq_eb_plus_sb,
                        [BIT_VECTOR],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        "fpToFp": indexed_fun(
                        "to_fp",
                        None,
                        [ROUNDING_MODE, FLOATING_POINT],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        "realToFp": indexed_fun(
                        "to_fp",
                        None,
                        [ROUNDING_MODE, REAL],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        "signedBitvecToFp": indexed_fun(
                        "to_fp",
                        None,
                        [ROUNDING_MODE, BIT_VECTOR],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        "unsignedBitvecToFp": indexed_fun(
                        "to_fp_unsigned",
                        None,
                        [ROUNDING_MODE, BIT_VECTOR],
                        FLOATING_POINT,
                        None,
                        get_indices_from_op),
        #   Conversions to other sorts
        "fpToUnsignedBitvec": indexed_fun(
                        "fp.to_ubv",
                        None,
                        [ROUNDING_MODE, FLOATING_POINT],
                        BIT_VECTOR,
                        None,
                        get_indices_from_op),
        "fpToSignedBitvec": indexed_fun(
                        "fp.to_sbv",
                        None,
                        [ROUNDING_MODE, FLOATING_POINT],
                        BIT_VECTOR,
                        None,
                        get_indices_from_op),
        "fpToReal": indexed_fun(
                        "fp.to_real",
                        None,
                        [FLOATING_POINT],
                        REAL),
    }

    funs.update(core_funs)

    prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    repl_dicts = [{A: sort} for sort in sorts]
    funs.update(get_all_instances(funs, prefixes, repl_dicts))

    return sorts, funs

def strings_theory():
    _, core_funs = core_theory()
    # :sorts
    sorts = [BOOL, STRING, REG_LAN, INT]
    funs = {
    # :funs_description
    #   strings consisting of exactly one character
        "stringChar": indexed_fun(
                        "char",
                        hex_is_char,
                        [],
                        STRING),
    #   string iterals "<STRING>"
        "stringIterals": Fun(Identifier("STRING"), [], STRING),
    # :funs
    # Core functions
    #   String functions
        "stringConcatenation":
            Fun(Identifier("str.++"), [STRING, STRING], STRING),
        "stringLength":
            Fun(Identifier("str.len"), [STRING], INT),
        "stringLexicalOrder":
            Fun(Identifier("str.<"), [STRING, STRING], BOOL),
    #   Regular expression functions
        "stringToRe":
            Fun(Identifier("str.to_re"), [STRING], REG_LAN),
        "stringMemberOfRe":
            Fun(Identifier("str.in_re"), [STRING, REG_LAN], BOOL),
        "reEmptySet":
            Fun(Identifier("re.none"), [], REG_LAN),
        "reAllStringSet":
            Fun(Identifier("re.all"), [], REG_LAN),
        "reAllCharSet":
            Fun(Identifier("re.allchar"), [], REG_LAN),
        "reConcatenation": Fun(Identifier("re.++"), [REG_LAN, REG_LAN], REG_LAN),
        "reUnion":
            Fun(Identifier("re.union"), [REG_LAN, REG_LAN], REG_LAN),
        "reIntersection":
            Fun(Identifier("re.inter"), [REG_LAN, REG_LAN], REG_LAN),
        "reClosure":
            Fun(Identifier("re.*"), [REG_LAN], REG_LAN),
    #   Additional functions
        "stringReflexiveClosure":
            Fun(Identifier("str.<="), [STRING, STRING], BOOL),
        "stringCharAt":
            Fun(Identifier("str.at"), [STRING, INT], STRING),
        "stringSubstr":
            Fun(Identifier("str.substr"), [STRING, INT, INT], STRING),
        "stringPrefixOf":
            Fun(Identifier("str.prefixof"), [STRING, STRING], BOOL),
        "stringSuffixOf":
            Fun(Identifier("str.suffixof"), [STRING, STRING], BOOL),
        "stringContains":
            Fun(Identifier("str.contains"), [STRING, STRING], BOOL),
        "stringIndexOf":
            Fun(Identifier("str.indexof"), [STRING, STRING, INT], INT),
        "stringReplace":
            Fun(Identifier("str.replace"), [STRING, STRING, STRING], STRING),
        "stringReplaceAll":
            Fun(Identifier("str.replace_all"), [STRING, STRING, STRING], STRING),
        "stringReplaceRe":
            Fun(Identifier("str.replace_re"), [STRING, REG_LAN, STRING], STRING),
        "stringReplaceReAll":
            Fun(Identifier("str.replace_re_all"), [STRING, REG_LAN, STRING], STRING),
        "reComplement":
            Fun(Identifier("re.comp"), [REG_LAN], REG_LAN),
        "reDifference":
            Fun(Identifier("re.diff"), [REG_LAN, REG_LAN], REG_LAN),
        "reCross":
            Fun(Identifier("re.+"), [REG_LAN], REG_LAN),
        "reOption":
            Fun(Identifier("re.opt"), [REG_LAN], REG_LAN),
        "reRange":
            Fun(Identifier("re.range"), [STRING, STRING], REG_LAN),
        # :funs_description
        "reNthPower": indexed_fun(
                        "re.^",
                        op_indices_numeral_greater_than_x(-sys.maxint -1, 1) 
                        [REG_LAN],
                        REG_LAN),
        "reLoop": indexed_fun(
                        "re.loop",
                        op_indices_numeral_greater_than_x(-sys.maxint -1, 2) 
                        [REG_LAN],
                        REG_LAN),
        "stringDigitCheck":
            Fun(Identifier("str.is_digit"), [STRING], BOOL),
        "stringToCode":
            Fun(Identifier("str.to_code"), [STRING], INT),
        "stringFromCode":
            Fun(Identifier("str.from_code"), [INT], STRING),
        "stringToInt":
            Fun(Identifier("str.to_int"), [STRING], INT),
        "stringFromInt":
            Fun(Identifier("str.from_int"), [INT], STRING),
    }

    funs.update(core_funs)

    prefixes = [ pascal_case_to_snake_case(sort.id_.symbol) for sort in sorts ]
    repl_dicts = [{A: sort} for sort in sorts]
    funs.update(get_all_instances(funs, prefixes, repl_dicts))

    return sorts, funs



def arraysex_theory():
    _, core_funs = core_theory()
    # sorts
    sorts = [BOOL, ARRAY]
    # parameters
    X = "X"
    Y = "Y"
    funs = {
        "arraySelect": Fun(
                        Identifier("_select"),
                        [ARRAY([X, Y]), X],
                        Y,
                        [X, Y]),
        "arrayStore": Fun(
                        Identifier("_store"),
                        [ARRAY([X, Y]), X, Y],
                        ARRAY([X, Y]),
                        [X, Y]),
    }
    funs.update(core_funs)

    # Infinity funs be be generated
    # TODO

    return sorts, funs
