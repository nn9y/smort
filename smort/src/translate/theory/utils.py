from smort.src.translate.Ast import *


def merge_sorts_dict(dict_list):
    merged_dict = {}
    for sorts_dict in dict_list:
        for key, value in sorts_dict:
            if not key in merged_dict:
                merged_dict[key] = value
    return merged_dict


def merge_funs_dict(dict_list):
    merged_dict = {}
    for funs_dict in dict_list:
        for key, value in funs_dict:
            if not isinstance(value, list):
                if (key in merged_dict) and (value in merged_dict[key]):
                    continue
                value = [value]
            if key in merged_dict:
                merged_dict[key] = merged_dict[key] + value 
            else:
                merged_dict[key] = value
    return merged_dict

def get_par_dict(par_list, sort_list):
    if len(par_list) != len(sort_list):
        return {}
    par_dict = {}
    for i in range(len(par_list)):
        if len(par_list[i].subsorts) > 0:
            if not par_list[i].same_parametric_type(sort_list[i]):
                return {}
            else:
                for j in len(par_list[i].subsorts):
                    par = par_list[i].subsorts[j]
                    sort = sort_list[i].subsorts[j]
                    if (
                        (isinstance(par, Sort) and (par != sort))
                        or (not isinstance(sort, Sort))
                    ):
                        return {}
                    if not isinstance(par, Sort) and isinstance(sort, Sort):
                        if par in par_dict:
                            if par_dict[par] != sort:
                                return {}
                        else:
                            par_dict[par] = sort
    return par_dict

# constraints

def is_numeral(n):
    return isinstance(n, int)

def numeral_greater_than_x(x, count):
    def f(*indices_list):
        indices = indices_list[0]
        if len(indices) != count:
            return False
        for i in range(count):
            if (not is_numeral(indices[i])) or indices[i] <= x:
                return False
        return True
    return f


def extract_bound_of_bitvec(op_indices, input_indices_list):
    if len(op_indices) != 2:
        return False
    if len(input_indices_list) != 1:
        return False
    i, j = op_indices
    m = input_indices_list[0][0]
    if j < 0 or i < j or m <= i:
        return False
    return True

def eq_input_indices(op_indices, input_indices_list):
    if len(input_indices_list) == 0:
        return True
    last_input_indices = input_indices_list[0]
    for i in range(1, len(input_indices_list)):
        if input_indices_list[i] == []:
            continue
        elif input_indices_list[i] != last_input_indices: 
            return False
        else:
            last_input_indices = input_indices_list[i]
    return True

def bitvec_bound_of_fp(op_indices, input_indices_list):
    # TODO
    if len(op_indices) != 0:
        return False
    if len(input_indices_list) != 1 or input_indices_list[0][0] != 1:
        return False
    return True 

def eb_plus_sb_eq_m(op_indices, input_indices_list):
    if len(input_indices_list) != 1 or len(input_indices_list[0]) != 1:
        return False
    if len(op_indices) != 2:
        return False
    eb, sb = op_indices
    m = input_indices_list[0][0]
    return eb + sb == m

def hex_is_char(op_indices, input_indices_list):
    number_of_digits = len(op_indices) - 2
    if number_of_digits > 5:
        return False
    if number_of_digits == 5:
        h = op_indices[2]
        if '0' <= h <= '2':
            return True
        return False
    return True

# get output sort indices

def get_number_of_binary_digits(carry):
    """
    carry shold be divisble by 2
    """
    if carry % 2 != 0:
        raise Exception("TO BE DONE")
    def f(spec_const_value, input_indices_list):
        # spec_const_value is original text of a binary or hexadecimal 
        number_of_digits = len(spec_const_value[0]) - 2
        return [number_of_digits * (carry / 2)]
    return f

def add_number_of_binary_digits_in_bitvecs(op_indices, input_indices_list):
    total = 0
    for input_indices in input_indices_list:
        total += input_indices[0]
    return [total]

def get_extract_length_from_bitvec(op_indices, input_indices_list):
    i, j = op_indices
    return [i - j + 1]

def get_indices_of_first_input(op_indices, input_indices_list):
    for input_indices in input_indices_list:
        if input_indices != []:
            return input_indices
    return []

def get_eb_sb_from_bitvec(op_indices, input_indices_list):
    eb = input_indices_list[1][0]
    sb = input_indices_list[2][0] + 1
    return [eb, sb]

def get_indices_from_op(op_indices, input_indices_list):
    return op_indices

