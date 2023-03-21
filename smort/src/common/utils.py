import itertools


def nested_list_to_string(lst, separator=' '):
    result = ''
    if isinstance(lst, (list, tuple)):
        result += '('
        for i in lst:
            result += nested_list_to_string(i) + separator 
        result = result[:-1] + ')'
    else:
        result += str(lst)
    return result

def list2str(lst, separator=' '):
    """
    Convert nested lists or tuples to string separated by separator
    reserve the nested '(' ')' of tuples and lists (to tuples)
    but without outermost '(' ')'
    """
    return nested_list_to_string(lst, separator)[1:-1]


def cartesian_product(*args):
    return list(itertools.product(*args))