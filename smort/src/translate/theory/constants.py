import random

from smort.src.tools.utils import random_string
from smort.src.translate.tools.Sort import SpecConstant, SpecConstType 
from smort.src.translate.tools.Term import Const, Expr 
from smort.src.translate.theory.utils import TheoryException 
from smort.src.translate.theory.available_sorts import *



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
        bitwidth = sort.id_.indices[0]
        return _random_bitvec_literal(bitwidth)
    elif sort.same_indexed_type(FLOATING_POINT):
        eb, sb = sort.id_.indices
        return _random_fp_literal(eb, sb)
    elif sort == FLOAT16:
        fp_sort = synonym2fp[FLOAT16_NAME]
        eb, sb = fp_sort.id_.indices
        return _random_fp_literal(eb, sb)
    elif sort == FLOAT32:
        fp_sort = synonym2fp[FLOAT32_NAME]
        eb, sb = fp_sort.id_.indices
        return _random_fp_literal(eb, sb)
    elif sort == FLOAT64:
        fp_sort = synonym2fp[FLOAT64_NAME]
        eb, sb = fp_sort.id_.indices
        return _random_fp_literal(eb, sb)
    elif sort == FLOAT128:
        fp_sort = synonym2fp[FLOAT128_NAME]
        eb, sb = fp_sort.id_.indices
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
    elif sort == REG_LAN:
        name_list= [
            "re.none", 
            "re.all",
            "re.allchar",
        ]
        return Expr(
                name=Identifier(
                        random.choice(name_list)
                    ),
                subterms=[],
                sort=REG_LAN
                )
    # elif sort.same_parametric_type(ARRAY):
    #     pass 
    else:
        raise TheoryException(f"Does not support generating constant of sort: '{sort}'.")


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

