import sys
from antlr4 import *
from SMTLIBv2Lexer import SMTLIBv2Lexer
from SMTLIBv2Parser import SMTLIBv2Parser

def main(argv):
    input_stream = FileStream(argv[1])
    lexer = SMTLIBv2Lexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = SMTLIBv2Parser(stream)
    tree = parser.start()

if __name__ == '__main__':
    main(sys.argv)