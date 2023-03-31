import random
import importlib

from smort.src.misc.utils import cartesian_product
from smort.src.translate.smtlibv2.Script import * 


def merge(scripts, add_cmds, fused):
    # add new decls and defs
    merged_cmds = add_cmds 
    # merge decls and defs
    for script in scripts:
        for cmd in script.commands:
            if isinstance(cmd, DeclareConst):
                merged_cmds.append(cmd)
            if isinstance(cmd, DeclareDataType):
                merged_cmds.append(cmd)
            if isinstance(cmd, DeclareDataTypes):
                merged_cmds.append(cmd)
            if isinstance(cmd, DeclareFun):
                merged_cmds.append(cmd)
            if isinstance(cmd, DeclareSort):
                merged_cmds.append(cmd)
            if isinstance(cmd, DefineFun):
                merged_cmds.append(cmd)
            if isinstance(cmd, DefineFunRec):
                merged_cmds.append(cmd)
            if isinstance(cmd, DefineFunsRec):
                merged_cmds.append(cmd)
            if isinstance(cmd, DefineSort):
                merged_cmds.append(cmd)
    
    merged_cmds.append(Assert(fused))
 
    return Script(merged_cmds)


def random_tuple_list(lsts, lower_bound=1):
    """
    Generate a random list of tuples (t_1, t_2, ..., t_n)
        where t_i is in lst_i
    """
    product = cartesian_product(lsts) 

    skip_template = False 

    if len(product) == 0:
        skip_template = True
        k = 0
    if len(product) == 1:
        skip_template = True
    else:
        k = random.randint(lower_bound, len(product))
    tups = random.sample(product, k)
    random.shuffle(tups)

    n = len(lsts)
    new_tups = []
    dups = [[] for _ in range(n)]
    for tup in tups:
        for i in n:
            if tup[i] in dups[i]:
                continue
            else:
                dups[i].append(tup[i])
        new_tups.append(tup)
    return new_tups, skip_template


def random_term_tuples(formulas, template):
    """
    :return:
    [a list of random term tuples (to be replaced)] and
    [a dict mapping from var name in template to:
        var name in actual formula]
    """
    var_name_map = {}
    term_occs_list = []
    for i, repl_pair in enumerate(template.repl_pairs):
        term_occs = []
        term, _ = repl_pair
        # assuming assertions have been merged into single one in each formula
        formulas[i].assert_cmds[0].term.find_all_terms(term, term_occs, var_name_map, template.free)
        term_occs_list.append(term_occs)
    rnd_tuples, skip_teamplate = random_tuple_list(term_occs_list)
    return [rnd_tuples, var_name_map, skip_teamplate]


def valid_template_index_list(formulas, templates):
    valid_index_list = []
    for k, template in enumerate(templates):
        matched = True
        for i, formula in enumerate(formulas):
            term, _ = template.repl_pairs[i]
            term_occs = []
            # assuming assertions have been merged into single one in each formula
            formula.assert_cmds[0].term.find_all_terms(term, term_occs, {}, template.free)
            # invalid template
            if len(term_occs) == 0:
                matched = False
                break 
        if matched:
            valid_index_list.append(k)
    return valid_index_list 
  

def call_function_from_module(path, function_name, *args):
    module = importlib.import_module(path)
    function = getattr(module, function_name)
    return function(*args)