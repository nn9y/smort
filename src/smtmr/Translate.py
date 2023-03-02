import sys

from antlr4 import *
from SMTMRLexer import SMTMRLexer
from SMTMRParser import SMTMRParser
from Translator import Translator

def generate_ast(stream):
    lexer = SMTMRLexer(stream)
    stream = CommonTokenStream(lexer)
    parser = SMTMRParser(stream)
    tree = parser.start()
    translator = Translator()
    smtmr = translator.visitStart(tree)
    print(smtmr)

def main(argv):
    input_stream = FileStream(argv[1])
    generate_ast(input_stream)

if __name__ == "__main__":
    main(sys.argv)