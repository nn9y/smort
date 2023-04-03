import random
import importlib

from smort.src.misc.utils import cartesian_product, random_string
from smort.src.translate.smtlibv2.Script import * 


def merge(scripts, fused, decls, defs, asserts):
    merged_cmds = []
    # set-logic ALL 
    merged_cmds.append(SMTLIBCommand('(set-logic ALL)'))
    # add new decls and defs
    merged_cmds += decls + defs 
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
    # add asserts
    merged_cmds.append(Assert(fused))
    merged_cmds += asserts 

    # check-sat
    merged_cmds.append(SMTLIBCommand('(check-sat)'))
 
    return Script(merged_cmds)


def random_tuple_list(lsts, lower_bound=1):
    """
    Generate a random list of tuples (t_1, t_2, ..., t_n)
        where t_i is in lst_i
    """
    product = cartesian_product(*lsts) 

    if len(product) == 0:
        k = 0
    else:
        k = random.randint(lower_bound, len(product))
    tups = random.sample(product, k)
    random.shuffle(tups)

    n = len(lsts)
    new_tups = []
    dups = [[] for _ in range(n)]
    for tup in tups:
        for i in range(n):
            if tup[i] in dups[i]:
                continue
            else:
                dups[i].append(tup[i])
        new_tups.append(tup)
    return new_tups


def random_term_tuples(formulas, templates, valid_index_list):
    """
    :return: a dict, mapping index of template to
                a list of [a list of random term tuple (to be replaced)] and
                    [a dict mapping from var name in template to var name in actual formula]
    """
    mapping = {}
    for k in valid_index_list: 
        template = templates[k]
        term_occs_list = []
        for i, formula in enumerate(formulas):
            term_occs = []
            term, _ = template.repl_pairs[i]
            # assuming assertions have been merged into single one in each formula
            formula.assert_cmds[0].term.find_all_terms(term, term_occs, template.free)
            term_occs_list.append(term_occs)
        rnd_tuples = random_tuple_list(term_occs_list)
        var_name_maps = []
        for i, tup in enumerate(rnd_tuples):
            var_name_map = {}
            for j, t in enumerate(tup):
                term, _ = template.repl_pairs[j]
                t.update_var_name_mapping(term, var_name_map)
            # new vars and cons
            for var, _ in template.sorted_vars:
                if not var in var_name_map:
                    var_name_map[var] = f"{var}_random{k}_{i}"
            var_name_maps.append(var_name_map)
        mapping[k] = [rnd_tuples, var_name_maps]
    return mapping


def valid_template_index_list(formulas, templates):
    valid_index_list = []
    for k, template in enumerate(templates):
        matched = True
        for i, formula in enumerate(formulas):
            term, _ = template.repl_pairs[i]
            term_occs = []
            # assuming assertions have been merged into single one in each formula
            formula.assert_cmds[0].term.find_all_terms(term, term_occs, template.free)
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