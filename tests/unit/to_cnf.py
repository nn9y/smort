from smort.src.translate.theory.SMTLIBv2Sorts import *
from smort.src.translate.tools.Term import *

a = Var(Identifier('a'), sort=BOOL)
b = Var(Identifier('b'), sort=BOOL)
t = Expr(Identifier('=>'), subterms=[a, b], sort=BOOL)

t.to_cnf()

print(t)

t2 = Expr(Identifier('not'), [t])
print(t2)
t2.to_cnf()

print(t2)