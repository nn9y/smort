import sys

from antlr4.CommonTokenStream import CommonTokenStream

from smort.src.translate.utils import translate, StreamType, ErrorListener
from smort.src.translate.smtmr.SMTMRLexer import SMTMRLexer
from smort.src.translate.smtmr.SMTMRParser import SMTMRParser 
from smort.src.translate.smtmr.Translator import Translator 


def generate_mr(sytream):
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


def translate_mr(s, stream_type, timeout_limit, slient=True):
    return translate(generate_mr, s, stream_type, timeout_limit, slient) 

def translate_mr_file(fn, timeout_limit=30, slient=True):
    return translate_mr(fn, StreamType.FILE, timeout_limit, slient)
    

def main(argv):
    smtmr = translate(argv[1], StreamType.File, 10000000, False)
    print(smtmr)

if __name__ == "__main__":
    main(sys.argv)