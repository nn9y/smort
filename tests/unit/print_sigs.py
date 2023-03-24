import os

from smort.src.translate.theory.available_theories import *

dir_of_file = os.path.abspath(os.path.join(__file__, os.pardir)) 
test_dir_path = os.path.abspath(os.path.join(dir_of_file, os.pardir)) 
fn = test_dir_path + '/results/signatures.txt'


with open(fn, 'w') as f:
    for key, fun in all_funs.items():
        f.write(f"{key}: {fun}\n")