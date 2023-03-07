# constraints

def is_numeral(n):
    return isinstance(n, int)

def numeral_greater_than_x(x):
    def f(n):
        if is_numeral(n) and n > x:
            return True
        return False
    return f

def sort_indices_numeral_greater_than_x(x, count):
    def f(indices):
        for i in range(count):
            if (not is_numeral(indices[i])) or indices[i] <= x:
                return False
        return True

def op_indices_numeral_greater_than_x(x, count):
    def f(op_indices, input_indices_list):
        for i in range(count):
            if (not is_numeral(op_indices[i])) or op_indices[i] <= x:
                return False
        return True
    return f

def extract_bound_of_bitvec(op_indices, input_indices_list):
    if len(op_indices) != 2:
        return False
    i, j = op_indices
    m = input_indices_list[0][0]
    if j < 0 or i < j or m <= i:
        return False
    return True

def eq_input_indices(op_indices, input_indices_list):
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
    if op_indices != 0:
        return False
    if input_indices_list[0][0] != 1:
        return False
    return False

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
    def f(op_indices, input_indices_list):
        # here op_indices is original text of binary or hexadecimal 
        number_of_digits = len(op_indices[0]) - 2
        return [number_of_digits * (carry / 2)]
    return f

def add_number_of_binary_digits(op_indices, input_indices_list):
    i, j = input_indices_list[0][0], input_indices_list[1][0]
    return [i + j]

def get_extract_from_bitvec(op_indices, input_indices_list):
    i, j = op_indices
    return [i - j + 1]

def get_index_of_first_input(op_indices, input_indices_list):
    return [input_indices_list[0][0]]



def get_eb_sb_from_bitvec(op_indices, input_indices_list):
    eb = input_indices_list[1][0]
    sb = input_indices_list[2][0] + 1
    return [eb, sb]

def get_indices_from_op(op_indices, input_indices_list):
    return op_indices

def get_eb_sb_from_first_input(op_indices, input_indices_list):
    for input_indices in input_indices_list:
        if input_indices != []:
            return input_indices
    return []

def m_eq_eb_plus_sb(op_indices, input_indices_list):
    eb, sb = op_indices
    return input_indices_list[0][0] == eb + sb
