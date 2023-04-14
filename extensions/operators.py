from smort.src.translate.tools.Sort import Identifier
from smort.src.translate.theory.SMTLIBv2Sorts import BOOL, INT, REAL, STRING



support_sorts = {INT, REAL, STRING}


LS = Identifier('<')
LE = Identifier('<=')
GT = Identifier('>')
GE = Identifier('>=')
EQ = Identifier('=')
UE = Identifier('distinct')

STRING_LS = Identifier('str.<')
STRING_LE = Identifier('str.<=')
STRING_PRE = Identifier('str.prefixof')
STRING_SUF = Identifier('str.suffixof')
STRING_COT = Identifier('str.contains')

INT_COMPARE_OPERATORS = [
    LS, LE, GT, GE, EQ, UE
]

REAL_COMPARE_OPERATORS = [
    LS, LE, GT, GE, EQ, UE
]

STRING_COMPARE_OPERATORS = [
    STRING_LS, STRING_LE, STRING_PRE, STRING_SUF, STRING_COT 
]

PLUS = Identifier('+')
MINUS = Identifier('-')
MUL = Identifier('*')

INT_DIV = Identifier('div')
INT_MOD = Identifier('mod')

REAL_DIV = Identifier('/')

STRING_ADD = Identifier('str.++')

LINEAR_INT_ARITH_OPERATORS = [
    PLUS, MINUS
]

LINEAR_REAL_ARITH_OPERATORS = [
    PLUS, MINUS
]

INT_ARITH_OPERATORS = [
    PLUS, MINUS, MUL, INT_DIV, INT_MOD
]

REAL_ARITH_OPERATORS = [
    PLUS, MINUS, MUL, REAL_DIV 
]

STRING_ARITH_OPERATORS = [
    STRING_ADD
]