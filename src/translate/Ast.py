
class Identifier:
    def __init__(self, symbol, indices=None):
        self.symbol = symbol
        self.indices = indices
    
    def __str__(self):
        str_ = "[Identifier: symbol->" + self.symbol
        if self.indices:
            str_ += " indices->"
            for index in self.indices:
                str_ += " " + str(index)
        str_ += "]"
        return str_


class Sort:
    def __init__(self, id_=None, subsorts=[]):
        self.id_ = id_
        self.subsorts = subsorts
    
    def __str__(self):
        str_ = "[sort: id->" + self.id_.__str__()
        if self.subsorts:
            str_ += " subsorts->"
            for sort in self.subsorts:
                str_ += " " + sort.__str__()
        str_ += "]"
        return str_
