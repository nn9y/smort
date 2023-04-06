import sys

from antlr4.CommonTokenStream import CommonTokenStream

from smort.src.translate.tools.utils import translate_file, ErrorListener
from smort.src.translate.smtlibv2.SMTLIBv2Lexer import SMTLIBv2Lexer 
from smort.src.translate.smtlibv2.SMTLIBv2Parser import SMTLIBv2Parser 
from smort.src.translate.smtlibv2.ScriptVisitor import ScriptVisitor 


def generate_script(stream):
    err_lis = ErrorListener()
    lexer = SMTLIBv2Lexer(stream)
    lexer.removeErrorListeners()
    lexer.addErrorListener(err_lis)
    stream = CommonTokenStream(lexer)
    parser = SMTLIBv2Parser(stream)
    parser.removeErrorListeners()
    tree = parser.start()
    vis = ScriptVisitor()
    return vis.visitStart(tree)


def translate_script_file(fn, timeout_limit, silent=True):
    return translate_file(generate_script, fn, timeout_limit, silent) 


def main(argv):
    script = translate_script_file(argv[1], 10000000, False)
    print(script)

if __name__ == "__main__":
    main(sys.argv)