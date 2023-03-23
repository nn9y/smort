from math import sqrt
from collections import defaultdict

from smort.src.translate.Ast import *


def merge_disjoint_dict(dict_list):
    """
    merge dicts, assmuing keys in dicts are all different
    """
    merged_dict = {}
    for _dict in dict_list:
        merged_dict.update(_dict)
        # for key, value in _dict:
        #     if not key in merged_dict:
        #         merged_dict[key] = value
    return merged_dict


def merge_multi_dict(dict_list):
    """
    merge dicts, values with the same key are combined into a list
    no nested list
    """
    merged_dict = defaultdict(list)
    for _dict in dict_list:
        for key, value in _dict.items():
            if isinstance(value, list):
                merged_dict[key].extend(value)
            else:
                merged_dict[key].append(value)
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


def is_string(s):
    return isinstance(s, str)


def numeral_greater_than_x(x, count):
    def f(*indices_list):
        """
        indices_list: in order to match:
            op_indices
            op_indices, input_indices_list
        """
        indices = indices_list[0]
        if len(indices) != count:
            return False
        for i in range(count):
            if not (is_numeral(indices[i]) and indices[i] > x):
                return False
        return True
    return f


def extract_bound_of_bitvec(op_indices, input_indices_list):
    """
    check for ((_ extract i j) (_ BitVec m) (_ BitVec n))
    extract [i, j] range of (_ BitVec m) to get (_ BitVec n)
    - i, j, m, n are numerals
    - m > i ≥ j ≥ 0,
    - n = i - j + 1
    """
    if len(op_indices) != 2:
        return False
    if len(input_indices_list) != 1 or len(input_indices_list[0]) != 1:
        return False
    i, j = op_indices
    m = input_indices_list[0][0]
    if not (is_numeral(i) and is_numeral(j) and is_numeral(m)):
        return False
    if j < 0 or i < j or m <= i:
        return False
    return True


def eq_input_indices(a, b, c):
    """
    check input_indices in [a, b) of list are equal,
        and op_indices should be empty
    c is excepted length of input_indices_list
    assuming each input_indices itself are checked by Sort before
    - a < b <= c
    """
    if not (is_numeral(a) and is_numeral(b)) or (a < 0) or (a >= b) or (b > c):
        raise ValueError("a, b, c must be an non-negative integer, and a < b <= c") 
    def _eq_input_indices(op_indices, input_indices_list):
        if len(op_indices) != 0:
            return False
        if len(input_indices_list) != c:
            return False
        last_input_indices = input_indices_list[a]
        for i in range(a+1, b):
            if input_indices_list[i] != last_input_indices: 
                return False
            last_input_indices = input_indices_list[i]
        return True
    return _eq_input_indices


def bitvec_bound_of_fp(op_indices, input_indices_list):
    """
    check for (fp (_ BitVec 1) (_ BitVec eb) (_ BitVec i) (_ FloatingPoint eb sb))

    - eb and sb are numerals greater than 1
    - i = sb - 1 (=> i > 0)
        - eb > 1
        - i > 0
    """
    if len(op_indices) != 0:
        return False
    if len(input_indices_list) != 3:
        return False
    b1, b2, b3 = input_indices_list
    if not (len(b1) == 1 and b1[0] == 1):
        return False
    if not (len(b2) == 1 and is_numeral(b2[0]) and b2[0] > 1):
        return False
    if not (len(b3) == 1 and is_numeral(b3[0]) and b3[0] > 0):
        return False
    return True 


def eb_plus_sb_eq_m(op_indices, input_indices_list):
    """
    check for ((_ to_fp eb sb) (_ BitVec m) (_ FloatingPoint eb sb))
    from single bitstring representation in IEEE 754-2008 interchange format,
    - m = eb + sb
    """
    if len(op_indices) != 2:
        return False
    if (len(input_indices_list) != 1) or (len(input_indices_list[0]) != 1):
        return False
    eb, sb = op_indices
    m = input_indices_list[0][0]
    if not (is_numeral(eb) and is_numeral(sb) and is_numeral(m)):
        return False
    return eb + sb == m


def hex_is_char(op_indices, input_indices_list):
    """
    check for (_ char ⟨H⟩) 
   
    where ⟨H⟩ is an SMT-LIB hexadecimal generated by the following BNF grammar

      ⟨H⟩ ::= #x⟨F⟩ | #x⟨F⟩⟨F⟩ | #x⟨F⟩⟨F⟩⟨F⟩ | #x⟨F⟩⟨F⟩⟨F⟩⟨F⟩ | #x⟨2⟩⟨F⟩⟨F⟩⟨F⟩⟨F⟩
      ⟨2⟩ ::= 0 | 1 | 2 
      ⟨F⟩ ::= ⟨2⟩ | 3 | 4 | 5 | 6 | 7 | 8 | 9
            | a | b | b | d | e | f
            | A | B | C | D | E | F
    """
    if (len(op_indices) != 1) or (len(input_indices_list) != 0):
        return False
    hex_str = op_indices[0]
    if (not is_string(hex_str)) or (len(hex_str) < 3):
        return False
    if hex_str[0:2] != '#x':
        return False
    number_of_digits = len(hex_str) - 2
    if number_of_digits > 5:
        return False
    st = 2
    if number_of_digits == 5:
        h = hex_str[st]
        if (h < '0') or (h > '2'):
            return False 
        st = 3
    for x in hex_str[st:]:
        if ('0' <= x <= '9') or ('a' <= x <= 'f') or ('A' <= x <= 'F'):
            continue
        else:
            return False
    return True



# get output sort indices, assuming input has been checked

def get_number_of_binary_digits(carry):
    """
    Converting HEX, BINARY constant to index of BitVec
    """
    if carry % 2 != 0:
        raise ValueError("'carry' should be divisible by 2")
    def _get_number_of_binary_digits(spec_const_value, input_indices_list):
        # spec_const_value is original text of a binary or hexadecimal 
        #   compare to op_indices, spec_const_value is just value, not list of values
        # assuming text format has been checked by parser already
        # The correspondence between spec_const_value and carry
        #   is guaranteed by the user
        if not (is_string(spec_const_value) or len(input_indices_list) == 0):
            return False
        number_of_digits = len(spec_const_value) - 2
        return [number_of_digits * int((sqrt(carry)))]
    return _get_number_of_binary_digits 


def add_bitvecs_indices(op_indices, input_indices_list):
    """
    get output indices of (concat (_ BitVec i) (_ BitVec j) (_ BitVec m))
    - i, j, m are numerals
    - i > 0, j > 0
    - i + j = m
    """
    [i], [j] = input_indices_list
    return [i + j]


def get_extract_length_of_bitvec(op_indices, input_indices_list):
    """
    get output indices of ((_ extract i j) (_ BitVec m) (_ BitVec n))
    extract [i, j] range of (_ BitVec m) to get (_ BitVec n)
    - i, j, m, n are numerals
    - m > i ≥ j ≥ 0,
    - n = i - j + 1
    """
    i, j = op_indices
    return [i - j + 1]


def get_indices_of_first_indexed_input(op_indices, input_indices_list):
    for input_indices in input_indices_list:
        if input_indices != []:
            return input_indices
    return []


def get_eb_sb_from_bitvec(op_indices, input_indices_list):
    """
    get output indices of (fp (_ BitVec 1) (_ BitVec eb) (_ BitVec i) (_ FloatingPoint eb sb))
    - eb and sb are numerals greater than 1
    - i = sb - 1
    """
    eb = input_indices_list[1][0]
    sb = input_indices_list[2][0] + 1
    return [eb, sb]


def get_indices_from_op(op_indices, input_indices_list):
    return op_indices

