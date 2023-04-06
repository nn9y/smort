import random

from smort.src.tools.utils import random_string
from smort.src.translate.tools.Ast import Const, Expr, SpecConstant
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



# sort parameters used in parametric sort templates
A = "A"
X = "X"
Y = "Y"



# synonyms
# parameters is allowed

synonym2fp = {
    FLOAT16_NAME: [FLOATING_POINT.get_indexed_instance([5, 11]), []],
    FLOAT32_NAME: [FLOATING_POINT.get_indexed_instance([8, 24]), []],
    FLOAT64_NAME: [FLOATING_POINT.get_indexed_instance([11, 53]), []],
    FLOAT128_NAME: [FLOATING_POINT.get_indexed_instance([15, 113]), []],
}



# generate random constants of specified sort

def random_constant_value(sort):
    if sort == BOOL:
        return Const(
                name=SpecConstant(
                        SpecConstType.B_VALUE, 
                        random.choice(['true', 'false'])
                    ),
                sort=BOOL
                )
    elif sort == INT:
        i = random.randint(-1000, 1000)
        if i < 0:
            return Expr(name='-',
                        subterms=[Const(
                                    name=SpecConstant(
                                        SpecConstType.NUMERAL,
                                        -i
                                        ),
                                    sort=INT
                                    )
                                ],
                        sort=INT)
        else:
            return Const(
                name=SpecConstant(
                        SpecConstType.NUMERAL, 
                        i
                    ),
                sort=INT
                )
    elif sort == REAL:
        r = round(random.uniform(-1000, 1000), 5)
        if r < 0:
            return Expr(name='-',
                        subterms=[Const(
                                    name=SpecConstant(
                                        SpecConstType.DECIMAL,
                                        -r
                                        ),
                                    sort=REAL
                                    )
                                ],
                        sort=REAL)
        else:
            return Const(
                name=SpecConstant(
                        SpecConstType.NUMERAL, 
                        r
                    ),
                sort=REAL
                )
    elif sort == ROUNDING_MODE:
        name_list= [
            "roundNearestTiesToEven", "RNE",
            "roundNearestTiesToAway", "RNA", 
            "roundTowardPositive", "RTP", 
            "roundTowardNegative", "RTN", 
            "roundTowardZero", "RTZ", 
        ]
        return Expr(
                name=Identifier(
                        random.choice(name_list)
                    ),
                subterms=[],
                sort=ROUNDING_MODE
                )
    elif sort.same_indexed_type(BIT_VECTOR):
        bitwidth = sort.name.indices[0]
        return _random_bitvec_literal(bitwidth)
    elif sort.same_indexed_type(FLOATING_POINT):
        eb, sb = sort.name.indices
        return _random_fp_literal(eb, sb)
    elif sort == FLOAT16:
        fp_sort = synonym2fp[FLOAT16_NAME]
        eb, sb = fp_sort.name.indices
        return _random_fp_literal(eb, sb)
    elif sort == FLOAT32:
        fp_sort = synonym2fp[FLOAT32_NAME]
        eb, sb = fp_sort.name.indices
        return _random_fp_literal(eb, sb)
    elif sort == FLOAT64:
        fp_sort = synonym2fp[FLOAT64_NAME]
        eb, sb = fp_sort.name.indices
        return _random_fp_literal(eb, sb)
    elif sort == FLOAT128:
        fp_sort = synonym2fp[FLOAT128_NAME]
        eb, sb = fp_sort.name.indices
        return _random_fp_literal(eb, sb)
    elif sort == STRING:
        length = random.randint(0, 20)
        return Const(
                name=SpecConstant(
                        SpecConstType.STRING, 
                       f'"{random_string(length)}"' 
                    ),
                sort=STRING
                )
    # elif sort == REG_LAN:
    #     pass 
    # elif sort.same_parametric_type(ARRAY):
    #     pass 
    else:
        raise TheoryException(f"'random_constant_value' does not support sort: {sort}")


def _random_bitvec_literal(bitwidth):
    return Const(
            name=SpecConstant(
                    SpecConstType.BINARY, 
                    f'#b{random.getrandbits(bitwidth):0{bitwidth}b}'
                ),
            sort=BIT_VECTOR.get_indexed_instance([bitwidth])
            )


def _random_fp_literal(eb, sb):
    b1 = _random_bitvec_literal(1)
    b2 = _random_bitvec_literal(eb)
    b3 = _random_bitvec_literal(sb-1)
    return Expr(
            name=Identifier('fp'),
            subterms=[b1, b2, b3],
            sort=FLOATING_POINT.get_indexed_instance([eb, sb])
            )

