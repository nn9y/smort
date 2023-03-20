import itertools


def list2str(lst, layers=1, separator=' '):
    """
    Convert nested lists or tuples to string separated by :separator
    """
    for i in range(1, layers):
        lst = [tuple(l) for l in lst]
    return separator.join([str(l) for l in lst])


def cartesian_product(*args):
    return list(itertools.product(*args))