from __future__ import print_function
import traceback
import sys
import threading

try:
    import thread
except ImportError:
    import _thread as thread


def cdquit(fn_name):
    thread.interrupt_main()  # raises KeyboardInterrupt


def exit_after(s):
    """
    use as decorator to exit the process if
    function takes longer than s seconds
    """

    def outer(fn):
        def inner(*args, **kwargs):
            timer = threading.Timer(s, cdquit, args=[fn.__name__])
            timer.start()
            try:
                result = fn(*args, **kwargs)
            finally:
                timer.cancel()
            return result

        return inner

    return outer


def print_when_catch_exception(silent=True):
    def outer(fn):
        def inner(*args, **kwargs):
            result = None
            try:
                result = fn(*args, **kwargs)
            except KeyboardInterrupt:
                print("Translator timed out or was interrupted.")
            except Exception as e:
                if not silent:
                    print("Error generating the AST.")
                    print(e)
                    traceback.print_exc(file=sys.stdout)
            return result 

        return inner

    return outer

