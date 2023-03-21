import random
import importlib

from smort.src.msic.utils import cartesian_product
from smort.src.translate.smtlibv2.Script import Script


def merge(op, scripts, add_decls, fused):
    # TODO
    # script1.merge_asserts()
    # script2.merge_asserts()
    cmds = []
    for script in scripts:
        for cmd in script.commands:
            # TODO
            # merge decls defs cmds first
            # add add_decls to front
            cmds.append(cmd)
            # TODO
            # add fused and
            # remove all assertion
    # TODO replace
    return Script(cmds, {}) # test script only need commands


def random_tuple_list(lsts, lower_bound=1):
    """
    Generate a random list of tuples (t_1, t_2, ..., t_n) where t_i is in lst_i
    """
    product = cartesian_product(lsts) 

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
        for i in n:
            if tup[i] in dups[i]:
                continue
            else:
                dups[i].append(tup[i])
        new_tups.append(tup)
    return new_tups


def random_term_tuples(formulas, mr):
    # sort_var_maps = []
    # for glob_vars in glob_vars_list:
    #     sort_var_maps.append(sort2vars_map(glob_vars))
    # mapping = []
    # # TODO
    # # how to choose template each iteration in fuzzing loop?
    # for template in mr.subst_templates:
    #     lsts = []
    #     # check if sort of each var used in this template appears in its corresponding seed formula 
    #     # and get list of matched vars in each formula
    #     for symbol, sort in template.sorted_vars:
    #         seed_symbol = mr.notaions[symbol].formula_in
    #         if seed_symbol:
    #             idx = mr.index_of_seed[seed_symbol]
    #             if sort not in sort_var_maps[idx]:
    #                 continue
    #             else:
    #                 lsts.append(sort_var_maps[idx][sort])
    #     rnd_tuples = random_tuple_list(lsts)
    #     for tup in rnd_tuples:
    #         # TODO
    #         # get mapping?
    #         mapping.append(tup, random.choice(template[tup]))
    # return mapping
    # TODO will var_name_map duplicated?
    mapping = {}
    for k, template in enumerate(mr.subst_templates):
        var_name_map = {}
        matched = True
        term_occs_list = []
        for i, repl_pair in enumerate(template.repl_pairs):
            term_occs = []
            term, repl = repl_pair
            # TODO
            # assume 1 assert cmd here
            # modify SMTMR.g4 declare :free and :bound in each template
            formulas[i].assert_cmds[0].term.find_all_terms(term, term_occs, template.is_free, var_name_map)
            # invalid template
            if len(term_occs) == 0:
                matched = False
                break 
            term_occs_list.append(term_occs)
        if matched:
            rnd_tuples = random_tuple_list(term_occs_list, mr)
            mapping[k] = [rnd_tuples, var_name_map]
    return mapping
  

def call_function_from_module(path, function_name, *args):
    module = importlib.import_module(path)
    function = getattr(module, function_name)
    return function(*args)