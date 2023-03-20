from smort.src.translate.theory.SMTLIBv2Theories import *
from smort.src.translate.theory.available_sorts import *


# other theories
# add more theories here

# get sorts and funs
# add sorts and funs above 

ints_sorts, ints_funs = ints_theory()
reals_sorts, reals_funs = reals_theory()
reals_ints_sorts, reals_ints_funs = reals_ints_theory()
bitvecs_sorts, bitvecs_funs = fixedSizeBitVectors_theory()
fps_sorts, fps_funs = floatingPoints_theory()
strs_sorts, strs_funs = strings_theory()
ax_sorts, ax_funs = arraysEX_theory()

_sorts_dicts = [ints_sorts, reals_sorts, reals_ints_sorts,
    bitvecs_sorts, fps_sorts, strs_sorts, ax_sorts]
_funs_dicts = [ints_funs, reals_funs, reals_ints_funs,
    bitvecs_funs, fps_funs, strs_funs, ax_funs]


# all sorts and funs defined
all_sorts = merge_sorts_dict(_sorts_dicts)
all_funs = merge_funs_dict(_funs_dicts)