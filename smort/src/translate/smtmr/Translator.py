from smort.src.translate.smtmr.SMTMRParser import SMTMRParser
from smort.src.translate.smtmr.SMTMRVisitor import SMTMRVisitor
from smort.src.translate.smtmr.MetamorphicRelation import *
from smort.src.translate.theory.signatures import *
from src.translate.Ast import *


class SMTMRException(Exception):
    pass



class Translator(SMTMRVisitor):
    def __init__(self):
        self.seed_status_list = []
        self.index_of_seed = {}
        self.mutant = None
        self.notations = {}
        self.subst_templates = []
        self.methods = []
        self.fuse_term = None

    def visitStart(self, ctx: SMTMRParser.StartContext):

        seed_idx = 0
        for child in ctx.getChildren():
            if isinstance(child, SMTMRParser.Seed_decContext):
                symbol, status = self.visitSeed_dec(child)
                self.seed_status_list.append(status)
                self.index_of_seed[symbol] = seed_idx
                seed_idx += 1
            elif isinstance(child, SMTMRParser.Mutant_decContext):
                self.mutant = self.visitMutant_dec(child)
            elif isinstance(child, SMTMRParser.Notation_decContext):
                symbol, info = self.visitNotation_dec(child)
                self.notations[symbol] = info
            elif isinstance(child, SMTMRParser.SubstTemplate_decContext):
                self.subst_templates.append(self.visitSubstTermGroup_dec(child)) 
            elif isinstance(child, SMTMRParser.Method_decContext):
                self.methods.append(self.visitMethod_dec(child))
            elif isinstance(child, SMTMRParser.Fuse_decContext):
                self.fuse_term = self.visitFuse_dec(child)
            else:
                continue

        return MetamorphicRelation(
            self.seed_status_list,
            self.index_of_seed,
            self.mutant,
            self.notations,
            self.subst_templates,
            self.methods,
            self.fuse_term
        ) 
 
    def visitUndefinedKeyword(self, ctx: SMTMRParser.UndefinedKeywordContext):
        return ctx.Colon().getText() + ctx.simpleSymbol().getText()
    
    def visitSymbol(self, ctx: SMTMRParser.SymbolContext):
        return ctx.getChild(0).getText()
    
    def visitKeyword(self, ctx: SMTMRParser.KeywordContext):
        if ctx.predefKeyword():
            return ctx.predefKeyword().getChild(0).getText()
        else:
            return self.visitUndefinedKeyword(ctx.undefinedKeyword())
    
    def visitSpec_constant(self, ctx: SMTMRParser.Spec_constantContext):
        if ctx.Numeral():
            return SpecConstant(SpecConstType.NUMERAL, int(ctx.Numeral().getText()))
        elif ctx.Decimal():
            return SpecConstant(SpecConstType.DECIMAL, float(ctx.Decimal().getText()))
        elif ctx.HexDecimal():
            return SpecConstant(SpecConstType.HEXDECIMAL, ctx.HexDecimal().getText())
        elif ctx.Binary():
            return SpecConstant(SpecConstType.BINARY, ctx.Binary().getText())
        elif ctx.String():
            return SpecConstant(SpecConstType.STRING, ctx.String().getText())
        else:
            return SpecConstant(
                SpecConstType.B_VALUE,
                True if ctx.b_value().getText() == "true" else False
            ) 
 
    def visitS_expr(self, ctx: SMTMRParser.S_exprContext):
        if ctx.spec_constant():
            return SExperssion(value=self.visitSpec_constant(ctx.spec_constant()))
        elif ctx.symbol():
            return SExperssion(value=self.visitSymbol(ctx.symbol()))
        elif ctx.keyword():
            return SExperssion(value=self.visitKeyword(ctx.keyword()))
        else:
            subsexprs = []
            if ctx.s_expr():
                for sexpr_ctx in ctx.s_expr():
                    subsexprs.append(self.visitS_expr(sexpr_ctx))
            return SExperssion(subsexprs=subsexprs)
    
    def visitIndex(self, ctx: SMTMRParser.IndexContext):
        if ctx.Numeral():
            return int(ctx.Numeral().getText())
        else:
            return self.visitSymbol(ctx.symbol())
    
    def visitIdentifier(self, ctx: SMTMRParser.IdentifierContext):
        symbol = self.visitSymbol(ctx.symbol())
        indices = []
        if ctx.GRW_Underscore():
            for index_ctx in ctx.index():
                indices.append(self.visitIndex(index_ctx))
        return Identifier(symbol, indices)
  
    def visitAttribute_value(self, ctx: SMTMRParser.Attribute_valueContext):
        if ctx.spec_constant():
            return AttributeValue(value=self.visitSpec_constant(ctx.spec_constant()))
        elif ctx.symbol():
            return AttributeValue(value=self.visitSymbol(ctx.symbol()))
        else:
            sexprs = []
            if ctx.s_expr():
                for sexpr_ctx in ctx.s_expr():
                    sexprs.append(self.visitS_expr(sexpr_ctx))
            return AttributeValue(sexprs=sexprs)
 
    def visitAttribute(self, ctx: SMTMRParser.AttributeContext):
        keyword = self.visitKeyword(ctx.keyword())
        try:
            keyword = SMTMRKeyword(str(keyword))
        except Exception:
            return None
        attribute_value = None
        if ctx.attribute_value():
            attribute_value = self.visitAttribute_value(ctx.attribute_value())
        return Attribute(keyword, attribute_value)
 
    def visitSort(self, ctx: SMTMRParser.SortContext):
        id_ = self.visitIdentifier(ctx.identifier())
        parsorts = []
        if ctx.ParOpen():
            for sort_ctx in ctx.sort():
                parsorts.append(self.visitSort(sort_ctx))
        return Sort(id_, parsorts)
    
    def visitQual_identifier(self, ctx: SMTMRParser.Qual_identifierContext):
        id_ = self.visitIdentifier(ctx.identifier())
        sort = self.visitSort(ctx.sort()) if ctx.GRW_As() else None
        return [id_, sort]
  
    def visitSorted_var(self, ctx: SMTMRParser.Sorted_varContext):
        return [self.visitSymbol(ctx.symbol()), self.visitSort(ctx.sort())]

    def visitTerm(self, ctx: SMTMRParser.TermContext):
        if ctx.spec_constant():
            spec_constant = self.visitSpec_constant(ctx.spec_constant())
            fun = self._well_sorted_term(spec_constant, [], None)
            return Const(name=spec_constant, sort=fun.output)
        elif ctx.qual_identifier():
            id_, sort = self.visitQual_identifier(ctx.qual_identifier())
            subterms = None
            if ctx.ParOpen(): 
                subterms = []
                input_list = []
                for term_ctx in ctx.term():
                    subterm = self.visitTerm(term_ctx)
                    subterms.appen(subterm)
                    input_list.append(subterm.sort)
                fun = self._well_sorted_term(id_, input_list, sort)
                return Expr(name=id_, subterms=subterms, sort=fun.output)
            else:
                fun = self._well_sorted_term(id_, [], sort)
                return Var(name=id_, sort=fun.output) 
    
    def visitFormula_dec(self, ctx: SMTMRParser.Formula_decContext):
        symbol = self.visitSymbol(ctx.symbol()) 
        self._check_conflicted_decl(symbol)
        status = Status(ctx.status().getText())
        return [symbol, status]

    def visitSubst_pair(self, ctx: SMTMRParser.SubstTerm_pairContext):
        return [self.visitTerm(ctx.term(0)), self.visitTerm(ctx.term(1))]

    def visitSeed_dec(self, ctx: SMTMRParser.Seed_decContext):
        return self.visitFormula_dec(ctx.formula_dec())
    
    def visitMutant_dec(self, ctx: SMTMRParser.Mutant_decContext):
        return self.visitFormula_dec(ctx.formula_dec())
    
    def visitNotation_dec(self, ctx: SMTMRParser.Notation_decContext):
        symbol = self.visitSymbol(ctx.symbol(0)) 
        self._check_conflicted_decl(symbol)
        formula_in = None
        attributes = None
        if ctx.symbol(1):
            formula_in = self.visitSymbol(ctx.symbol(1)) 
            self._check_valid_seed(formula_in)
        if ctx.attribute():
            attributes = []
            for attr_ctx in ctx.attribute():
                attr = self.visitAttribute(attr_ctx)
                if attr:
                    attributes.append(attr)
        return symbol, NotationInfo(formula_in, attributes)
    
    def visitSubstTemplate_dec(self, ctx: SMTMRParser.SubstTermGroup_decContext):
        sorted_vars = []
        for sv_ctx in ctx.sorted_var():
            symbol, sort = self.visitSorted_var(sv_ctx)
            self._check_valid_notation(symbol)
            sorted_vars.append([symbol, sort])
        subst_term_pairs = []
        for stp_ctx in ctx.substTerm_pair():
            term, repl = self.visitSubstTerm_pair(stp_ctx)        
            # TODO check symbols and sorts
            subst_term_pairs.append([term, repl])
        return SubstTemplate(sorted_vars=sorted_vars, repl_pairs=subst_term_pairs)
    
    def visitFuse_dec(self, ctx: SMTMRParser.Assert_decContext):
        # TODO special terms
        # and check symbols
        return self.visitTerm(ctx.term())

    def visitMethod_dec(self, ctx: SMTMRParser.Method_decContext):
        method_name = ctx.String().getText()
        formula_symbol = self.visitSymbol(ctx.symbol())
        formula_attribute = self.visitAttribute(ctx.attribute())
        return Method(name=method_name, formula=formula_symbol, attribute=formula_attribute)
    
    def _well_sorted_term(self, name, input_list=None, output=None):
        # predefined signatures
        fun = match_fun_in_signatures(name, input_list, output, all_funs)
        if fun:
            return fun
        else:
            raise SMTMRException(f"function ({name} {list2str(input_list)}) is not declared")

    def _check_conflicted_decl(self, symbol):
        conflict = False
        if self._is_seed(symbol):
            conflict = True
        elif self._is_mutant(symbol):
            conflict = True
        elif self._is_notation(symbol):
            conflict = True
        if conflict:
            raise  SMTMRException(f"'{symbol}' has already defined")
    
    def _check_valid_seed(self, symbol):
        if not self._is_seed(symbol):
            raise  SMTMRException(f"'{symbol}' is not a seed")
    
    def _check_valid_notation(self, symbol):
        if not self._is_notation(symbol):
            raise  SMTMRException(f"'{symbol}' is not a notation")
    
    def _is_seed(self, symbol):
        if symbol in self.seeds:
            return True
    
    def _is_mutant(self, symbol):
        if self.mutant and (symbol == self.mutant[0]):
            return True
    
    def _is_notation(self, symbol):
        if symbol in self.notations:
            return True
            
        
 
