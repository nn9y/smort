import pickle
import time

from smort.src.translate.smtlibv2.translate import *


filename = '/home/yang/Projects/smort/tests/testcases53.smt2'
script = translate_script_file(filename, 100)

start_time = time.time()

save_filename = "/home/yang/Projects/smort/tests/results/53_script.pkl"

with open(save_filename, "wb") as file:
    pickle.dump(script, file)

with open(save_filename, "rb") as file:
    loaded_object = pickle.load(file)

end_time = time.time()

assert loaded_object == script

print(f"Execution time: {end_time - start_time} seconds")