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
    
    def enterSeed_dec(self, ctx: SMTMRParser.Seed_decContext):
        print('( seed ', end='')
        return 0
    
    def exitSeed_dec(self, ctx: SMTMRParser.Seed_decContext):
        print(')', end='')
        return 0
        
    def enterMutant_dec(self, ctx: SMTMRParser.Mutant_decContext):
        print('( mutant ', end='')
        return 0
    
    def exitMutant_dec(self, ctx: SMTMRParser.Mutant_decContext):
        print(')', end='')
        return 0

    def enterNotation_dec(self, ctx: SMTMRParser.Notation_decContext):
        print('( notation_dec ', end='')
        return 0
    
    def exitNotation_dec(self, ctx: SMTMRParser.Notation_decContext):
        print(')', end='')
        return 0
    
    def enterMethod_dec(self, ctx: SMTMRParser.Method_decContext):
        print('( method_dec ', end='')
        return 0

    def exitMethod_dec(self, ctx: SMTMRParser.Method_decContext):
        print(')', end='')
        return 0
    
    def enterAssert_dec(self, ctx: SMTMRParser.Assert_decContext):
        print('( assert_dec ', end='')
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
    
    def enterStatus(self, ctx: SMTMRParser.StatusContext):
        symbol = ctx.getChild(0).getText()
        print(":status %s " % (symbol), end='')
        return 0
    
    def enterSubstTerm_dec(self, ctx: SMTMRParser.SubstTerm_decContext):
        print('( substTerm_dec ', end='')
        return 0
    
    def exitSubstTerm_dec(self, ctx: SMTMRParser.SubstTerm_decContext):
        print(')', end='')
        return 0
    
    def enterSort(self, ctx: SMTMRParser.SortContext):
        print("( sort ", end='')
        return 0
    
    def exitSort(self, ctx: SMTMRParser.SortContext):
        print(')', end='')
        return 0
    
    def enterString(self, ctx: SMTMRParser.StringContext):
        string = ctx.getText()
        print("%s " % string, end='')
        return 0

    def enterAttribute(self, ctx: SMTMRParser.AttributeContext):
        keyword = ctx.getChild(0).getText()
        value = ctx.getChild(1)
        if value:
            v = value.getText()
            print("(attribute %s value=%s " % (keyword, v), end='')
        else:
            print("(attribute %s " % (keyword), end='')
        return 0
    
    def exitAttribute(self, ctx: SMTMRParser.AttributeContext):
        print(')', end='')
        return 0
