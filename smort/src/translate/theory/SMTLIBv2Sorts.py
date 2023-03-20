from smort.src.translate.theory.Fun import *


# sort names
BOOL_NAME = "Bool"
INT_NAME = "Int"
REAL_NAME = "Real"
ROUNDING_MODE_NAME = "RoundingMode"
BIT_VECTOR_NAME = "BitVec"
FLOATING_POINT_NAME = "FloatingPoint"
FLOAT16_NAME = "Float16"
FLOAT32_NAME = "Float32"
FLOAT64_NAME = "Float64"
FLOAT128_NAME = "Float128"
STRING_NAME = "String"
REG_LAN_NAME = "RegLan"
ARRAY_NAME = "Array" 

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


# sort parameters
A = "A"
X = "X"
Y = "Y"


# synonyms

synonym2fp = {
    FLOAT16_NAME: FLOATING_POINT([5, 11]),
    FLOAT32_NAME: FLOATING_POINT([8, 24]),
    FLOAT64_NAME: FLOATING_POINT([11, 53]),
    FLOAT128_NAME: FLOATING_POINT([15, 113]),
}

# TODO

def get_constant_value(sort):
    pass