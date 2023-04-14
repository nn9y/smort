import copy
import random
import importlib

from smort.src.tools.utils import cartesian_product
from smort.src.translate.tools.Sort import Identifier
from smort.src.translate.tools.Term import (
    TermType,
    Const,
    Var,
    Expr,
)
from smort.src.translate.theory.SMTLIBv2Sorts import BOOL
from smort.src.translate.theory.SMTLIBv2Theories import BOOLEAN_EQUAL
from smort.src.translate.theory.constants import random_constant_value 
from smort.src.translate.smtlibv2.Script import (
    Script,
    SMTLIBCommand,
    DeclareConst,
    DeclareDataType,
    DeclareDataTypes,
    DeclareFun,
    DeclareSort,
    DefineFun,
    DefineFunRec,
    DefineFunsRec,
    DefineSort,
    Assert,
) 


def merge(scripts, fused, decls, asserts, snpts):
    merged_cmds = []
    # set-logic ALL 
    merged_cmds.append(SMTLIBCommand('(set-logic ALL)'))
    # add new decls
    merged_cmds += decls
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

    # check-sat and exit
    merged_cmds.append(SMTLIBCommand("(check-sat)"))
    merged_cmds.append(SMTLIBCommand("(exit)"))

    return Script(merged_cmds, {})


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


def random_term_tuples(formulas, templates, multiple_substs, index_list, notations):
    """
    :returns: a list of 3-tuples:
        [0]: index of mr.subst_templates
        [1]: a list of random term (to be replaced) tuples
        [2]: a dict mapping from var name in the template to the corresponding term in actual formulas
    """
    lst = []
    # make sure no term will be replaced more than once in each generation, which may cause invalid formula
    dups = [[] for _ in range(len(formulas))]
    for k in index_list: 
        template = templates[k]
        term_occs_list = []
        for i, formula in enumerate(formulas):
            term_occs = []
            term, _ = template.repl_pairs[i]
            # assume assertions have been merged into single one (CNFTerm) in each formula
            formula.assert_merged.term.find_terms(term, term_occs, template.global_free, template.inwards)
            term_occs_list.append(term_occs)
        rnd_tuples = random_tuple_list(term_occs_list, dups, multiple_substs)
        notation2terms = []
        for i, tup in enumerate(rnd_tuples):
            notation2term = {}
            for j, t in enumerate(tup):
                term, _ = template.repl_pairs[j]
                t.update_notation2term(term, notation2term)
            # generate term of new functions, variables and contants
            for var, sort in template.sorted_vars:
                if not var in notation2term:
                    info = notations[var]
                    mapped_id = Identifier(f"{var}_random{k}_{i}")
                    if info.is_cons:
                        value = random_constant_value(sort)
                        const = Const(name=value, sort=sort)
                        notation2term[var] = const 
                    if info.is_var:
                        notation2term[var] = Var(
                            name=mapped_id,
                            sort=sort,
                            global_free=True
                        ) 
                    if info.is_fun:
                        subterms = []
                        for inp in info.input_notations:
                            subterms.append(notation2term[inp])
                        notation2term[var] = Expr(
                            name=mapped_id,
                            subterms=subterms,
                            sort=sort
                        )
            notation2terms.append(notation2term)
        lst.append((k, rnd_tuples, notation2terms))
    return lst


def find_valid_templates(formulas, templates):
    valid_index_list = []
    for k, template in enumerate(templates):
        matched = True
        for i, formula in enumerate(formulas):
            term, _ = template.repl_pairs[i]
            term_occs = []
            # assume assertions have been merged into single one (CNFTerm) in each formula
            formula.assert_merged.term.find_terms(term, term_occs, template.global_free, template.inwards)
            # invalid template
            if len(term_occs) == 0:
                matched = False
                break 
        if matched:
            valid_index_list.append(k)
    return valid_index_list 
  

def call_function_from_module(path, function_name, formulas):
    module = importlib.import_module(path)
    function = getattr(module, function_name)
    return function(formulas)


def generate_additions(template, notations, notation2term, decls, asserts):
    # generate new variables and constants
    for var, sort in template.sorted_vars:
        if var in notation2term:
            info = notations[var]
            mapped_term = notation2term[var]
            if len(sort.id_.indices) > 0:
                sym = sort.id_.indices[0]
                # get actual sort
                sort = notation2term[sym].sort
            if info.is_var:
                symbol = str(mapped_term.name)
                decls.append(DeclareConst(symbol, sort))
            if info.is_fun:
                input_sort_list = [s.sort for s in mapped_term.subterms]
                decls.append(DeclareFun(str(mapped_term.name), input_sort_list, sort))
            if info.gen_assert:
                repl = None
                for t, r in template.repl_pairs:
                    if (t.term_type == TermType.VAR) and (str(t.name) == var):
                        repl = copy.deepcopy(r)
                        repl.replace_notation_by_term(notation2term)
                        break
                if repl:
                    asserts.append(
                        Assert(
                            term=repl
                        )
                    )


def replace(template, term_tup, notation2term):
    # replace terms in seed formulas
    for i, term in enumerate(term_tup):
        _, repl = template.repl_pairs[i]
        term.substitute(repl, notation2term)

