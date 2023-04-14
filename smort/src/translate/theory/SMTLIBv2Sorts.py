from smort.src.translate.tools.Sort import sort_with_arity, indexed_sort, Sort, Identifier 
from smort.src.translate.theory.utils import numeral_greater_than_x
from smort.src.translate.theory.SMTLIBv2SortNames import *


# sorts
BOOL = Sort(Identifier(BOOL_NAME))
INT = Sort(Identifier(INT_NAME))
REAL = Sort(Identifier(REAL_NAME))
ROUNDING_MODE = Sort(Identifier(ROUNDING_MODE_NAME))
BIT_VECTOR = indexed_sort(
    BIT_VECTOR_NAME,
    1,
    numeral_greater_than_x(0, 1)
)
FLOATING_POINT = indexed_sort(
    FLOATING_POINT_NAME, 
    2,
    numeral_greater_than_x(1, 2)
)
FLOAT16 = Sort(Identifier(FLOAT16_NAME))
FLOAT32 = Sort(Identifier(FLOAT32_NAME))
FLOAT64 = Sort(Identifier(FLOAT64_NAME))
FLOAT128 = Sort(Identifier(FLOAT128_NAME))
STRING = Sort(Identifier(STRING_NAME))
REG_LAN = Sort(Identifier(REG_LAN_NAME))
ARRAY = sort_with_arity(ARRAY_NAME, 2) 

UNKNOWN = Sort(Identifier("Unknown"))


# sort parameters used in parametric sort templates
A = "A"
X = "X"
Y = "Y"



smtlibv2_sorts = {
    BOOL_NAME: BOOL,
    INT_NAME: INT,
    REAL_NAME: REAL,
    BIT_VECTOR_NAME: BIT_VECTOR,
    ROUNDING_MODE_NAME: ROUNDING_MODE,
    REAL_NAME: REAL,
    BIT_VECTOR_NAME: BIT_VECTOR,
    FLOATING_POINT_NAME: FLOATING_POINT,
    FLOAT16_NAME: FLOAT16,
    FLOAT32_NAME: FLOAT32,
    FLOAT64_NAME: FLOAT64,
    FLOAT128_NAME: FLOAT128,
}


# synonyms
# parameters is allowed

synonym2fp = {
    FLOAT16_NAME: [FLOATING_POINT.get_indexed_instance([5, 11]), []],
    FLOAT32_NAME: [FLOATING_POINT.get_indexed_instance([8, 24]), []],
    FLOAT64_NAME: [FLOATING_POINT.get_indexed_instance([11, 53]), []],
    FLOAT128_NAME: [FLOATING_POINT.get_indexed_instance([15, 113]), []],
}

