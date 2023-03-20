from enum import Enum
import logging

from antlr4.error.ErrorListener import ErrorListener
from antlr4.FileStream import FileStream
from antlr4.InputStream import InputStream

from smort.src.translate.decorators import exit_after, print_when_catch_exception


class StreamType(Enum):
    FILE = 0
    INPUT = 1 

class ErrorListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        logging.debug("Parser error on line %d column %d."
                      % (line, column), flush=True)

def get_char_stream(s, stream_type):
    if stream_type == StreamType.FILE:
        return FileStream(s, encoding="utf8")
    if stream_type == StreamType.INPUT:
        return InputStream(s)
    else:
        return None

def translate(gen_ast_fct, s, stream_type, timeout_limit, slient=True):
    @print_when_catch_exception(slient)
    def _translate_stream_with_timeout(s, stream_type, timeout_limit):
        @exit_after(timeout_limit)
        def _translate_stream(s):
            stream = get_char_stream(s, stream_type) 
            result = gen_ast_fct(stream)
            return result 
        
        return _translate_stream(s)

    return _translate_stream_with_timeout(s, stream_type, timeout_limit)

