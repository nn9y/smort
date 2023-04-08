import sys

from antlr4.CommonTokenStream import CommonTokenStream

from smort.src.translate.tools.utils import translate_file, ErrorListener
from smort.src.translate.smtmr.SMTMRLexer import SMTMRLexer
from smort.src.translate.smtmr.SMTMRParser import SMTMRParser 
from smort.src.translate.smtmr.Translator import Translator 
from smort.src.translate.smtmr.preprocessor import preprocess


def generate_mr(stream):
    err_lis = ErrorListener()
    lexer = SMTMRLexer(stream)
    lexer.removeErrorListeners()
    lexer.addErrorListener(err_lis)
    stream = CommonTokenStream(lexer)
    parser = SMTMRParser(stream)
    parser.removeErrorListeners()
    tree = parser.start()
    translator = Translator()
    return translator.visitStart(tree)


def translate_mr_file(fn, timeout_limit, silent=True):
    new_fn = preprocess(fn)  # replace all import statements 
    return translate_file(generate_mr, new_fn, timeout_limit, silent) 


def main(argv):
    smtmr = translate_mr_file(argv[1], 10, False)
    print(smtmr)

if __name__ == "__main__":
    main(sys.argv)