from antlr4 import *
from SMTMRParser import SMTMRParser
from SMTMRListener import SMTMRListener

class TestPrinter(SMTMRListener):

    def enterStart(self, ctx: SMTMRParser.StartContext):
        print('( start ', end='')
        return 0
    
    def exitStart(self, ctx: SMTMRParser.StartContext):
        print(')')
        return 0
    
    def enterSeeds_dec(self, ctx: SMTMRParser.Seeds_decContext):
        print('( seeds ', end='')
        return 0
    
    def exitSeeds_dec(self, ctx: SMTMRParser.Seeds_decContext):
        print(')', end='')
        return 0
        
    def enterMutant_dec(self, ctx: SMTMRParser.Mutant_decContext):
        print('( mutant ', end='')
        return 0
    
    def exitMutant_dec(self, ctx: SMTMRParser.Mutant_decContext):
        print(')', end='')
        return 0

    def enterReplace_dec(self, ctx: SMTMRParser.Replace_decContext):
        print('( replace ', end='')
        return 0
    
    def exitReplace_dec(self, ctx: SMTMRParser.Replace_decContext):
        print(')', end='')
        return 0

    def enterAlgorithms_dec(self, ctx: SMTMRParser.Algorithms_decContext):
        print('( algorithm ', end='')
        return 0
    
    def exitAlgorithms_dec(self, ctx: SMTMRParser.Algorithms_decContext):
        print(')', end='')
        return 0
    
    def enterAssert_dec(self, ctx: SMTMRParser.Assert_decContext):
        print('( assert ', end='')
        return 0
    
    def exitAssert_dec(self, ctx: SMTMRParser.Assert_decContext):
        print(')', end='')
        return 0
    
    def enterFormula_dec(self, ctx: SMTMRParser.Formula_decContext):
        print('( formula_dec ', end='')
        return 0
    
    def exitFormula_dec(self, ctx: SMTMRParser.Formula_decContext):
        print(')', end='')
        return 0
    
    def enterSymbol(self, ctx: SMTMRParser.SymbolContext):
        symbol = ctx.getChild(0).getText()
        print("%s " % (symbol), end='')
        return 0
    
    def enterVars_dec(self, ctx: SMTMRParser.Vars_decContext):
        print('( vars_dec ', end='')
        return 0
    
    def exitVars_dec(self, ctx: SMTMRParser.Vars_decContext):
        print(')', end='')
        return 0
    
    def enterTerms_dec(self, ctx: SMTMRParser.Terms_decContext):
        print('( terms_dec ', end='')
        return 0
    
    def exitTerms_dec(self, ctx: SMTMRParser.Terms_decContext):
        print(')', end='')
        return 0
    
    def enterVar_dec(self, ctx: SMTMRParser.Var_decContext):
        print('( var_dec ', end='')
        return 0
    
    def exitVar_dec(self, ctx: SMTMRParser.Var_decContext):
        print(')', end='')
        return 0
    
    def enterSort_term_dec(self, ctx: SMTMRParser.Sort_term_decContext):
        print('( sort_term_dec ', end='')
        return 0
    
    def exitSort_term_dec(self, ctx: SMTMRParser.Sort_term_decContext):
        print(')', end='')
        return 0
    
    def enterTerm_dec(self, ctx: SMTMRParser.Term_decContext):
        print('( term_dec ', end='')
        return 0

    def exitTerm_dec(self, ctx: SMTMRParser.Term_decContext):
        print(')', end='')
        return 0
    
    def enterTerm(self, ctx: SMTMRParser.TermContext):
        print("( term ", end='')
        return 0
    
    def exitTerm(self, ctx: SMTMRParser.TermContext):
        print(')', end='')
        return 0

    def enterSort(self, ctx: SMTMRParser.SortContext):
        print("( sort ", end='')
        return 0
    
    def exitSort(self, ctx: SMTMRParser.SortContext):
        print(')', end='')
        return 0
    
    def enterAlgorithem_dec(self, ctx: SMTMRParser.Algorithem_decContext):
        print("( algorithm_dec ", end='')
        return 0
    
    def exitAlgorithem_dec(self, ctx: SMTMRParser.Algorithem_decContext):
        print(')', end='')
        return 0
    
    def enterString(self, ctx: SMTMRParser.StringContext):
        string = ctx.getText()
        print("%s " % string, end='')
        return 0

    def enterAttribute(self, ctx: SMTMRParser.AttributeContext):
        keyword = ctx.getChild(0).getText()
        print("(attribute %s " % (keyword), end='')
        return 0
    
    def exitAttribute(self, ctx: SMTMRParser.AttributeContext):
        print(')', end='')
        return 0


        