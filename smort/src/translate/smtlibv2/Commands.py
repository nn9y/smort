from smort.src.tools.utils import list2str



class ConstructorDec:
    def __init__(self, name: str, sdecs):
        self.name = name 
        self.sdecs = sdecs
 
    def __str__(self):
        return f"({self.name} {list2str(self.sdecs)})"
    
    def __repr__(self):
        return self.__str__()


class DataTypeDec:
    def __init__(self, pars, cdecs):
        self.pars = pars
        self.cdecs = cdecs
    
    def __str__(self):
        if self.pars and len(self.pars) > 0:
            return f"(par ({list2str(self.pars)}) \
({list2str(self.cdecs)}))" 
        else:
            return f"({list2str(self.cdecs)})"
    
    def __repr__(self):
        return self.__str__()


class Assert:
    def __init__(self, term):
        self.term = term

    def __str__(self):
        return f"(assert {self.term})"

    def __repr__(self):
        return self.__str__()


class DeclareConst:
    def __init__(self, symbol, sort):
        self.symbol = symbol
        self.sort = sort

    def __str__(self):
        return f"(declare-const {self.symbol} {self.sort})"

    def __repr__(self):
        return self.__str__()


class DeclareDataType:
    def __init__(self, symbol, datatype_dec):
        self.symbol = symbol
        self.datatype_dec = datatype_dec

    def __str__(self):
        return f"(declare-datatype {self.symbol} {self.datatype_dec})"

    def __repr__(self):
        return self.__str__()


class DeclareDataTypes:
    def __init__(self, sort_decs, datatype_decs):
        self.sort_decs = sort_decs
        self.datatype_decs = datatype_decs

    def __str__(self):
        return f"(declare-datatypes \
({list2str(self.sort_decs)}) ({list2str(self.datatype_decs)}))"

    def __repr__(self):
        return self.__str__()


class DeclareFun:
    def __init__(self, symbol, input_sort_list, output_sort):
        self.symbol = symbol
        self.input_sort_list = input_sort_list
        self.output_sort = output_sort

    def __str__(self):
        return f"(declare-fun {self.symbol} \
({list2str(self.input_sort_list)}) {str(self.output_sort)})"

    def __repr__(self):
        return self.__str__()


class DeclareSort:
    def __init__(self, symbol, numeral):
        self.symbol = symbol
        self.numeral = numeral

    def __str__(self):
        return f"(declare-sort {self.symbol} {self.numeral})" 

    def __repr__(self):
        return self.__str__()


class DefineFun:
    def __init__(self, symbol, sorted_vars, sort, term):
        self.symbol = symbol
        self.sorted_vars = sorted_vars
        self.sort = sort
        self.term = term

    def __str__(self):
        return f"(define-fun {self.symbol} \
({list2str(self.sorted_vars)}) {str(self.sort)} {str(self.term)})"

    def __repr__(self):
        return self.__str__()


class DefineFunRec:
    def __init__(self, symbol, sorted_vars, sort, term):
        self.symbol = symbol
        self.sorted_vars = sorted_vars
        self.sort = sort
        self.term = term

    def __str__(self):
        return f"(define-fun {self.symbol} \
({list2str(self.sorted_vars)}) {str(self.sort)} {str(self.term)})"

    def __repr__(self):
        return self.__str__()


class FunDecl:
    def __init__(self, symbol, sorted_vars, sort):
        self.symbol = symbol
        self.sorted_vars = sorted_vars
        self.sort = sort

    def __str__(self):
        return f"({self.symbol} ({list2str(self.sorted_vars)}) {str(self.sort)})"

    def __repr__(self):
        return self.__str__()
 

class DefineFunsRec:
    def __init__(self, fun_decls, terms):
        self.fun_decls = fun_decls
        self.terms = terms

    def __str__(self):
        return f"(define-funs-rec ({list2str(self.fun_decls)}) ({list2str(self.terms)}))"
 
    def __repr__(self):
        return self.__str__()


class DefineSort:
    def __init__(self, symbol, par_list, sort):
        self.symbol = symbol 
        self.par_list = par_list
        self.sort = sort 

    def __str__(self):
        return f"(define-sort {self.symbol} ({list2str(self.par_list)}) {self.sort})"
    
    def __repr__(self):
        return self.__str__()


class SetLogic:
    def __init__(self, logic: str):
        self.logic = logic
    
    def __str__(self):
        return f"(set-logic {self.logic})"
    
    def __repr__(self):
        return self.__str__()


# class CheckSat:
#     def __init__(self):
#         pass

#     def __str__(self):
#         return f"(check-sat)"

#     def __repr__(self):
#         return self.__str__()


# class CheckSatAssuming:
#     def __init__(self, prop_literals):
#         self.prop_literals = prop_literals

#     def __str__(self):
#         return f"(check-sat-assuming ({list2str(self.prop_literals)}))"

#     def __repr__(self):
#         return self.__str__()


# class GetValue:
#     def __init__(self, terms):
#         self.terms = terms

#     def __str__(self):
#         return f"(get-value ({list2str(self.terms)}))"

#     def __repr__(self):
#         return self.__str__()


# class Push:
#     def __init__(self, levels):
#         self.levels = levels

#     def __str__(self):
#         return f"(push {self.levels})"

#     def __repr__(self):
#         return self.__str__()


# class Pop:
#     def __init__(self, levels):
#         self.levels = levels

#     def __str__(self):
#         return f"(pop {self.levels})"

#     def __repr__(self):
#         return self.__str__()


class SMTLIBCommand:
    """
    commands we don't care about:
        checkSat
        checkSatAssuming
        echo
        exit
        getAssertions
        getAssignment
        getInfo
        getModel
        getOption
        getProof
        getUnsatAssumptions
        getUnsatCore
        getValue
        pop
        push
        reset
        resetAssertions
        setInfo
        setLogic
        setOption
    """
    def __init__(self, cmd_str):
        self.cmd_str = cmd_str

    def __eq__(self, other):
        return self.cmd_str == other.cmd_str

    def __hash__(self):
        return self.cmd_str.__hash__()

    def __str__(self):
        return self.cmd_str
    
    def __repr__(self):
        return self.__str__()

