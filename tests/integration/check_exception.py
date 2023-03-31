import os
import pytest
import glob

from smort.src.translate.smtlibv2.translate import *


def read_smt2_files(root_dir):
    smt2_files = glob.glob(root_dir + '/**/*.smt2', recursive=True)
    return smt2_files


def test_no_exception_in_translate_script_files():
    files = read_smt2_files('/home/yang/Projects/yinyang/semantic-fusion-seeds')
    for file in files:
        assert os.path.isfile(file)
        try:
            translate_script_file(file, 10000000)
        except Exception as e:
            pytest.fail(f"{file} raised an exception: {str(e)}")