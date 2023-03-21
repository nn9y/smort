# Generated from SMTMR.g4 by ANTLR 4.9.2
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .SMTMRParser import SMTMRParser
else:
    from SMTMRParser import SMTMRParser

# This class defines a complete generic visitor for a parse tree produced by SMTMRParser.

class SMTMRVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by SMTMRParser#start.
    def visitStart(self, ctx:SMTMRParser.StartContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#simpleSymbol.
    def visitSimpleSymbol(self, ctx:SMTMRParser.SimpleSymbolContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#predefSymbol.
    def visitPredefSymbol(self, ctx:SMTMRParser.PredefSymbolContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#predefKeyword.
    def visitPredefKeyword(self, ctx:SMTMRParser.PredefKeywordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#undefinedKeyword.
    def visitUndefinedKeyword(self, ctx:SMTMRParser.UndefinedKeywordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#symbol.
    def visitSymbol(self, ctx:SMTMRParser.SymbolContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#keyword.
    def visitKeyword(self, ctx:SMTMRParser.KeywordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#status.
    def visitStatus(self, ctx:SMTMRParser.StatusContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#b_value.
    def visitB_value(self, ctx:SMTMRParser.B_valueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#spec_constant.
    def visitSpec_constant(self, ctx:SMTMRParser.Spec_constantContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#s_expr.
    def visitS_expr(self, ctx:SMTMRParser.S_exprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#index.
    def visitIndex(self, ctx:SMTMRParser.IndexContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#identifier.
    def visitIdentifier(self, ctx:SMTMRParser.IdentifierContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#attribute_value.
    def visitAttribute_value(self, ctx:SMTMRParser.Attribute_valueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#attribute.
    def visitAttribute(self, ctx:SMTMRParser.AttributeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#sort.
    def visitSort(self, ctx:SMTMRParser.SortContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#qual_identifier.
    def visitQual_identifier(self, ctx:SMTMRParser.Qual_identifierContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#sorted_var.
    def visitSorted_var(self, ctx:SMTMRParser.Sorted_varContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#term.
    def visitTerm(self, ctx:SMTMRParser.TermContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#term_template.
    def visitTerm_template(self, ctx:SMTMRParser.Term_templateContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#formula_dec.
    def visitFormula_dec(self, ctx:SMTMRParser.Formula_decContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#subst_pair.
    def visitSubst_pair(self, ctx:SMTMRParser.Subst_pairContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#seed_dec.
    def visitSeed_dec(self, ctx:SMTMRParser.Seed_decContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#mutant_dec.
    def visitMutant_dec(self, ctx:SMTMRParser.Mutant_decContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#notation_dec.
    def visitNotation_dec(self, ctx:SMTMRParser.Notation_decContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#substTemplate_dec.
    def visitSubstTemplate_dec(self, ctx:SMTMRParser.SubstTemplate_decContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#fuse_dec.
    def visitFuse_dec(self, ctx:SMTMRParser.Fuse_decContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SMTMRParser#method_dec.
    def visitMethod_dec(self, ctx:SMTMRParser.Method_decContext):
        return self.visitChildren(ctx)



del SMTMRParser