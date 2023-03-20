import sys

from antlr4.CommonTokenStream import CommonTokenStream

from smort.src.translate.utils import translate, StreamType, ErrorListener
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


def translate_script(s, stream_type, timeout_limit, slient=True):
    return translate(generate_script, s, stream_type, timeout_limit, slient) 


def translate_script_file(fn, timeout_limit=30, slient=True):
    return translate_script(fn, StreamType.FILE, timeout_limit, slient)


def main(argv):
    script = translate(argv[1], StreamType.File, 10000000, False)
    print(script)

if __name__ == "__main__":
    main(sys.argv)