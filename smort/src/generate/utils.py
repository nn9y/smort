import random
import importlib

from smort.src.tools.utils import cartesian_product, random_string
from smort.src.translate.theory.available_sorts import random_constant_value 
from smort.src.translate.smtmr.MetamorphicRelation import SMTMRKeyword
from smort.src.translate.smtlibv2.Script import * 


def merge(scripts, fused, decls, defs, asserts, snpts):
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
    for snpt in snpts:
        merged_cmds.append(Assert(snpt)) 

    # check-sat
    merged_cmds.append(SMTLIBCommand('(check-sat)'))
 
    return Script(merged_cmds)


def random_tuple_list(lsts, dups, multiple_substs=False):
    """
    Generate a random list of tuples (t_1, t_2, ..., t_n)
        where t_i is in lst_i
    """
    product = cartesian_product(*lsts) 

    if len(product) == 0:
        k = 0
    elif multiple_substs:
        k = random.randint(1, len(product))
    else:
        # single substitution for each template
        k = 1
    tups = random.sample(product, k)
    random.shuffle(tups)

    n = len(lsts)
    new_tups = []
    for tup in tups:
        for i in range(n):
            if tup[i] in dups[i]:
                continue
            else:
                dups[i].append(tup[i])
        new_tups.append(tup)
    return new_tups


def random_term_tuples(formulas, templates, multiple_substs=False):
    """
    :return: a list, index is mapping to index of templates:
        [0]: a list of random term (to be replaced) tuples
        [1]: a dict mapping from var name in the template to var name in actual formulas
    """
    lst = []
    # make sure no term will be replaced more than once in each generation, which may cause invalid formula
    dups = [[] for _ in range(len(formulas))]
    for k, template in enumerate(templates): 
        term_occs_list = []
        for i, formula in enumerate(formulas):
            term_occs = []
            term, _ = template.repl_pairs[i]
            # assuming assertions have been merged into single one in each formula
            # formula.assert_cmds[0].term.find_all_terms(term, term_occs, template.free)
            # here occs list are already "deepcopied"
            term_occs = formula.assert_cmds[0].term.pointers_map[k]
            term_occs_list.append(term_occs)
        rnd_tuples = random_tuple_list(term_occs_list, dups, multiple_substs)
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
        lst.append([rnd_tuples, var_name_maps])
    return lst 


def find_valid_templates(formulas, templates):
    valid_index_list = []
    valid_count = 0
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
            # save occs list
            formula.assert_cmds[0].term.pointers_map[valid_count] = term_occs
        if matched:
            valid_index_list.append(k)
            valid_count += 1
    return valid_index_list 
  

def call_function_from_module(path, function_name, *args):
    module = importlib.import_module(path)
    function = getattr(module, function_name)
    return function(*args)

def generate_additions(template, notations, var_name_map, decls, defs, asserts):
    # generate new variables and constants
    for var, sort in template.sorted_vars:
        attrs = notations[var].attributes 
        if attrs and (var in var_name_map):
            mapped_name = var_name_map[var]
            for attr in attrs:
                if attr.keyword == SMTMRKeyword.VAR:
                    decls.append(DeclareConst(mapped_name, sort))
                if attr.keyword == SMTMRKeyword.CONS:
                    value = random_constant_value(sort)
                    term = Const(name=value, sort=sort)
                    defs.append(DefineFun(mapped_name, [], sort, term))
                if attr.keyword == SMTMRKeyword.GEN:
                    # operator = Identifier(attr.value)
                    for t, r in template.repl_pairs:
                        if t.term_type == TermType.VAR and t.name == var:
                            repl = r.replace_var_name(var_name_map) 
                            break
                    # asserts.append(Assert(term=Expr(name=Identifier("="), subterms=[Var(var), repl])))
                    asserts.append(Assert(term=Expr(name="=", subterms=[Var(var), repl])))

def replace(template, term_tup, var_name_map, formulas):
    # replace terms in seed formulas
    for i, formula in enumerate(formulas):
        _, repl = template.repl_pairs[i]
        formula.assert_cmds[0].term.substitute([term_tup[i]], repl, var_name_map)

