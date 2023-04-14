import sys

from smort.src.translate.smtmr.translate import *


def main(argv):
    mr = translate_mr_file(argv[1], 10, False)
    print(mr)

if __name__ == "__main__":
    main(sys.argv)