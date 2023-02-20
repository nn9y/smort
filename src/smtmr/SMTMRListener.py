# Generated from SMTMR.g4 by ANTLR 4.9.2
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .SMTMRParser import SMTMRParser
else:
    from SMTMRParser import SMTMRParser

# This class defines a complete listener for a parse tree produced by SMTMRParser.
class SMTMRListener(ParseTreeListener):

    # Enter a parse tree produced by SMTMRParser#start.
    def enterStart(self, ctx:SMTMRParser.StartContext):
        pass

    # Exit a parse tree produced by SMTMRParser#start.
    def exitStart(self, ctx:SMTMRParser.StartContext):
        pass


    # Enter a parse tree produced by SMTMRParser#simpleSymbol.
    def enterSimpleSymbol(self, ctx:SMTMRParser.SimpleSymbolContext):
        pass

    # Exit a parse tree produced by SMTMRParser#simpleSymbol.
    def exitSimpleSymbol(self, ctx:SMTMRParser.SimpleSymbolContext):
        pass


    # Enter a parse tree produced by SMTMRParser#quotedSymbol.
    def enterQuotedSymbol(self, ctx:SMTMRParser.QuotedSymbolContext):
        pass

    # Exit a parse tree produced by SMTMRParser#quotedSymbol.
    def exitQuotedSymbol(self, ctx:SMTMRParser.QuotedSymbolContext):
        pass


    # Enter a parse tree produced by SMTMRParser#predefSymbol.
    def enterPredefSymbol(self, ctx:SMTMRParser.PredefSymbolContext):
        pass

    # Exit a parse tree produced by SMTMRParser#predefSymbol.
    def exitPredefSymbol(self, ctx:SMTMRParser.PredefSymbolContext):
        pass


    # Enter a parse tree produced by SMTMRParser#predefKeyword.
    def enterPredefKeyword(self, ctx:SMTMRParser.PredefKeywordContext):
        pass

    # Exit a parse tree produced by SMTMRParser#predefKeyword.
    def exitPredefKeyword(self, ctx:SMTMRParser.PredefKeywordContext):
        pass


    # Enter a parse tree produced by SMTMRParser#status.
    def enterStatus(self, ctx:SMTMRParser.StatusContext):
        pass

    # Exit a parse tree produced by SMTMRParser#status.
    def exitStatus(self, ctx:SMTMRParser.StatusContext):
        pass


    # Enter a parse tree produced by SMTMRParser#symbol.
    def enterSymbol(self, ctx:SMTMRParser.SymbolContext):
        pass

    # Exit a parse tree produced by SMTMRParser#symbol.
    def exitSymbol(self, ctx:SMTMRParser.SymbolContext):
        pass


    # Enter a parse tree produced by SMTMRParser#numeral.
    def enterNumeral(self, ctx:SMTMRParser.NumeralContext):
        pass

    # Exit a parse tree produced by SMTMRParser#numeral.
    def exitNumeral(self, ctx:SMTMRParser.NumeralContext):
        pass


    # Enter a parse tree produced by SMTMRParser#decimal.
    def enterDecimal(self, ctx:SMTMRParser.DecimalContext):
        pass

    # Exit a parse tree produced by SMTMRParser#decimal.
    def exitDecimal(self, ctx:SMTMRParser.DecimalContext):
        pass


    # Enter a parse tree produced by SMTMRParser#hexadecimal.
    def enterHexadecimal(self, ctx:SMTMRParser.HexadecimalContext):
        pass

    # Exit a parse tree produced by SMTMRParser#hexadecimal.
    def exitHexadecimal(self, ctx:SMTMRParser.HexadecimalContext):
        pass


    # Enter a parse tree produced by SMTMRParser#binary.
    def enterBinary(self, ctx:SMTMRParser.BinaryContext):
        pass

    # Exit a parse tree produced by SMTMRParser#binary.
    def exitBinary(self, ctx:SMTMRParser.BinaryContext):
        pass


    # Enter a parse tree produced by SMTMRParser#string.
    def enterString(self, ctx:SMTMRParser.StringContext):
        pass

    # Exit a parse tree produced by SMTMRParser#string.
    def exitString(self, ctx:SMTMRParser.StringContext):
        pass


    # Enter a parse tree produced by SMTMRParser#keyword.
    def enterKeyword(self, ctx:SMTMRParser.KeywordContext):
        pass

    # Exit a parse tree produced by SMTMRParser#keyword.
    def exitKeyword(self, ctx:SMTMRParser.KeywordContext):
        pass


    # Enter a parse tree produced by SMTMRParser#spec_constant.
    def enterSpec_constant(self, ctx:SMTMRParser.Spec_constantContext):
        pass

    # Exit a parse tree produced by SMTMRParser#spec_constant.
    def exitSpec_constant(self, ctx:SMTMRParser.Spec_constantContext):
        pass


    # Enter a parse tree produced by SMTMRParser#s_expr.
    def enterS_expr(self, ctx:SMTMRParser.S_exprContext):
        pass

    # Exit a parse tree produced by SMTMRParser#s_expr.
    def exitS_expr(self, ctx:SMTMRParser.S_exprContext):
        pass


    # Enter a parse tree produced by SMTMRParser#index.
    def enterIndex(self, ctx:SMTMRParser.IndexContext):
        pass

    # Exit a parse tree produced by SMTMRParser#index.
    def exitIndex(self, ctx:SMTMRParser.IndexContext):
        pass


    # Enter a parse tree produced by SMTMRParser#identifier.
    def enterIdentifier(self, ctx:SMTMRParser.IdentifierContext):
        pass

    # Exit a parse tree produced by SMTMRParser#identifier.
    def exitIdentifier(self, ctx:SMTMRParser.IdentifierContext):
        pass


    # Enter a parse tree produced by SMTMRParser#attribute_value.
    def enterAttribute_value(self, ctx:SMTMRParser.Attribute_valueContext):
        pass

    # Exit a parse tree produced by SMTMRParser#attribute_value.
    def exitAttribute_value(self, ctx:SMTMRParser.Attribute_valueContext):
        pass


    # Enter a parse tree produced by SMTMRParser#attribute.
    def enterAttribute(self, ctx:SMTMRParser.AttributeContext):
        pass

    # Exit a parse tree produced by SMTMRParser#attribute.
    def exitAttribute(self, ctx:SMTMRParser.AttributeContext):
        pass


    # Enter a parse tree produced by SMTMRParser#sort.
    def enterSort(self, ctx:SMTMRParser.SortContext):
        pass

    # Exit a parse tree produced by SMTMRParser#sort.
    def exitSort(self, ctx:SMTMRParser.SortContext):
        pass


    # Enter a parse tree produced by SMTMRParser#qual_identifer.
    def enterQual_identifer(self, ctx:SMTMRParser.Qual_identiferContext):
        pass

    # Exit a parse tree produced by SMTMRParser#qual_identifer.
    def exitQual_identifer(self, ctx:SMTMRParser.Qual_identiferContext):
        pass


    # Enter a parse tree produced by SMTMRParser#var_binding.
    def enterVar_binding(self, ctx:SMTMRParser.Var_bindingContext):
        pass

    # Exit a parse tree produced by SMTMRParser#var_binding.
    def exitVar_binding(self, ctx:SMTMRParser.Var_bindingContext):
        pass


    # Enter a parse tree produced by SMTMRParser#sorted_var.
    def enterSorted_var(self, ctx:SMTMRParser.Sorted_varContext):
        pass

    # Exit a parse tree produced by SMTMRParser#sorted_var.
    def exitSorted_var(self, ctx:SMTMRParser.Sorted_varContext):
        pass


    # Enter a parse tree produced by SMTMRParser#pattern.
    def enterPattern(self, ctx:SMTMRParser.PatternContext):
        pass

    # Exit a parse tree produced by SMTMRParser#pattern.
    def exitPattern(self, ctx:SMTMRParser.PatternContext):
        pass


    # Enter a parse tree produced by SMTMRParser#match_case.
    def enterMatch_case(self, ctx:SMTMRParser.Match_caseContext):
        pass

    # Exit a parse tree produced by SMTMRParser#match_case.
    def exitMatch_case(self, ctx:SMTMRParser.Match_caseContext):
        pass


    # Enter a parse tree produced by SMTMRParser#term.
    def enterTerm(self, ctx:SMTMRParser.TermContext):
        pass

    # Exit a parse tree produced by SMTMRParser#term.
    def exitTerm(self, ctx:SMTMRParser.TermContext):
        pass


    # Enter a parse tree produced by SMTMRParser#formula_dec.
    def enterFormula_dec(self, ctx:SMTMRParser.Formula_decContext):
        pass

    # Exit a parse tree produced by SMTMRParser#formula_dec.
    def exitFormula_dec(self, ctx:SMTMRParser.Formula_decContext):
        pass


    # Enter a parse tree produced by SMTMRParser#vars_dec.
    def enterVars_dec(self, ctx:SMTMRParser.Vars_decContext):
        pass

    # Exit a parse tree produced by SMTMRParser#vars_dec.
    def exitVars_dec(self, ctx:SMTMRParser.Vars_decContext):
        pass


    # Enter a parse tree produced by SMTMRParser#funs_dec.
    def enterFuns_dec(self, ctx:SMTMRParser.Funs_decContext):
        pass

    # Exit a parse tree produced by SMTMRParser#funs_dec.
    def exitFuns_dec(self, ctx:SMTMRParser.Funs_decContext):
        pass


    # Enter a parse tree produced by SMTMRParser#seeds_dec.
    def enterSeeds_dec(self, ctx:SMTMRParser.Seeds_decContext):
        pass

    # Exit a parse tree produced by SMTMRParser#seeds_dec.
    def exitSeeds_dec(self, ctx:SMTMRParser.Seeds_decContext):
        pass


    # Enter a parse tree produced by SMTMRParser#mutant_dec.
    def enterMutant_dec(self, ctx:SMTMRParser.Mutant_decContext):
        pass

    # Exit a parse tree produced by SMTMRParser#mutant_dec.
    def exitMutant_dec(self, ctx:SMTMRParser.Mutant_decContext):
        pass


    # Enter a parse tree produced by SMTMRParser#replace_dec.
    def enterReplace_dec(self, ctx:SMTMRParser.Replace_decContext):
        pass

    # Exit a parse tree produced by SMTMRParser#replace_dec.
    def exitReplace_dec(self, ctx:SMTMRParser.Replace_decContext):
        pass


    # Enter a parse tree produced by SMTMRParser#assert_dec.
    def enterAssert_dec(self, ctx:SMTMRParser.Assert_decContext):
        pass

    # Exit a parse tree produced by SMTMRParser#assert_dec.
    def exitAssert_dec(self, ctx:SMTMRParser.Assert_decContext):
        pass


    # Enter a parse tree produced by SMTMRParser#algorithms_dec.
    def enterAlgorithms_dec(self, ctx:SMTMRParser.Algorithms_decContext):
        pass

    # Exit a parse tree produced by SMTMRParser#algorithms_dec.
    def exitAlgorithms_dec(self, ctx:SMTMRParser.Algorithms_decContext):
        pass



del SMTMRParser