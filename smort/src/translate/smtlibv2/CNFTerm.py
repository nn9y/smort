from smort.src.tools.utils import list2str


class Clause:
    """
    a disjunction of literals
    """
    def __init__(self, literals: list):
        """
        each literal is an Expr (an atom or its negation) or a Forall Term
        """
        self.literals = literals

    def __str__(self):
        if len(self.literals) > 1:
            return f"(or {list2str(self.literals)})"
        elif len(self.literals) == 1:
            return self.literals[0]
        else:
            return ""
    
    def __repr__(self):
        return self.__str__()


class CNFTerm:
    """
    a conjunction of clauses
    """
    def __init__(self, clauses: list):
        self.clauses = clauses
    
    def __str__(self):
        # assume each clauses contains at least one literal
        if len(self.clauses) > 1:
            return f"(and {list2str(self.clauses)})"
        elif len(self.clauses) == 1:
            return self.clauses[0]
        else:
            return ""
    
    def __repr__(self):
        return self.__str__()
    
    def find_terms(self, t, occs, global_free=False, inwards=False):
        for clauses in self.clauses:
            for literal in clauses.literals:
                literal.find_terms(t, occs, global_free, inwards)

