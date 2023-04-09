import itertools
import random
import string
from enum import Enum


class StrEnum(Enum):
    def __str__(self):
        return str(self.value)
    
    def __repr__(self):
        return self.__str__()



def nested_list_to_string(lst, separator=' '):
    result = ''
    if isinstance(lst, (list, tuple)):
        tmp = ''
        for i in lst:
            tmp += nested_list_to_string(i) + separator 
        if len(lst) == 1:
            result += tmp[:-1] 
        else:
            result += '(' + tmp[:-1] + ')'
    else:
        result += str(lst)
    return result


def list2str(lst, separator=' '):
    """
    Convert nested lists or tuples to string separated by separator
    reserve the nested '(' ')' of tuples and lists (to tuples)
    but without outermost '(' ')'
    """
    if len(lst) == 1:
        return nested_list_to_string(lst[0])
    result = nested_list_to_string(lst, separator)
    if result[0] == '(' and result[-1] == ')':
        return result[1:-1]
    else:
        return result


def cartesian_product(*args):
    return list(itertools.product(*args))


def random_string(length=5):
    return "".join(random.sample(string.ascii_letters + string.digits, length))


def plain(cmd):
    plain_cmd = ""
    for token in cmd.split(" "):
        plain_cmd += token.split("/")[-1]
    return escape(plain_cmd)


def escape(s):
    """
    replace all '.' by '_'
    """
    s = s.replace(".", "_")
    return s


def in_list(stdout, stderr, lst):
    stdstream = f"{stdout} {stderr}"
    for err in lst:
        if err in stdstream:
            print(err)
            print(stdstream)
            return True 
    return False 