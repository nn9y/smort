import sys
from antlr4 import *
from SMTMRLexer import SMTMRLexer
from SMTMRParser import SMTMRParser
from TestPrinter import TestPrinter

def main(argv):
    input_stream = FileStream(argv[1])
    lexer = SMTMRLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = SMTMRParser(stream)
    tree = parser.start()
    printer = TestPrinter()
    walker = ParseTreeWalker()
    walker.walk(printer, tree)

if __name__ == '__main__':
    main(sys.argv)