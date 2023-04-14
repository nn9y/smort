import sys

from smort.src.translate.smtlibv2.Script import *
from smort.src.translate.smtlibv2.translate import *

def main(argv):
    script = translate_script_file(argv[1], 10, False)
    script.merge_asserts()
    print(script)

if __name__ == "__main__":
    main(sys.argv)