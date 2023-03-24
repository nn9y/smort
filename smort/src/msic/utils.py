import itertools
import random
import string


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


def random_string(length=5):
    return "".join(random.sample(string.ascii_letters + string.digits, length))


def plain(cli):
    plain_cli = ""
    for token in cli.split(" "):
        plain_cli += token.split("/")[-1]
    return escape(plain_cli)


def escape(s):
    s = s.replace(".", "")
    s = s.replace("=", "")
    return s


def in_list(stdout, stderr, lst):
    stdstream = f"{stdout} {stderr}"
    for err in lst:
        if err in stdstream:
            return True
    return False