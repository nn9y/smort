
def list2str(lst, layers=1):
    for i in range(1, layers):
        lst = [tuple(l) for l in lst]
    return " ".join([str(l) for l in lst])