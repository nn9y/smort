import sys

from antlr4 import *
from SMTMRLexer import SMTMRLexer
from SMTMRParser import SMTMRParser
from AstVisitor import AstVisitor

def generate_ast(stream):
    lexer = SMTMRLexer(stream)
    stream = CommonTokenStream(lexer)
    parser = SMTMRParser(stream)
    tree = parser.start()
    visitor = AstVisitor()
    smtmr = visitor.visitStart(tree)
    print(smtmr)

def main(argv):
    input_stream = FileStream(argv[1])
    generate_ast(input_stream)

if __name__ == "__main__":
    main(sys.argv)