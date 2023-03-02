
from SMTMRParser import SMTMRParser
from SMTMRVisitor import SMTMRVisitor
from SMTMR import *


class Translator(SMTMRVisitor):
    def __init__(self):
        self.seeds = {}
        self.mutant = None
        self.notations = {}
        self.subst_term_groups = []
        self.methods = []
        self.assert_term = None

    def visitStart(self, ctx: SMTMRParser.StartContext):

        for child in ctx.getChildren():
            if isinstance(child, SMTMRParser.Seed_decContext):
                symbol, status = self.visitSeed_dec(child)
                self.seeds[symbol] = status 
            elif isinstance(child, SMTMRParser.Mutant_decContext):
                self.mutant = self.visitMutant_dec(child)
            elif isinstance(child, SMTMRParser.Notation_decContext):
                symbol, info = self.visitNotation_dec(child)
                self.notations[symbol] = info
            elif isinstance(child, SMTMRParser.SubstTermGroup_decContext):
                self.subst_term_groups.append(self.visitSubstTermGroup_dec(child)) 
            elif isinstance(child, SMTMRParser.Method_decContext):
                self.methods.append(self.visitMethod_dec(child))
            elif isinstance(child, SMTMRParser.Assert_decContext):
                self.assert_term = self.visitAssert_dec(child)
            else:
                continue

        return SMTMetamorphicRelations(
            self.seeds,
            self.mutant,
            self.notations,
            self.subst_term_groups,
            self.methods,
            self.assert_term
        ) 
    
    def visitSimpleSymbol(self, ctx: SMTMRParser.SimpleSymbolContext):
        if ctx.predefSymbol():
            return ctx.predefSymbol().getChild(0).getText()
        else:
            return ctx.UndefinedSymbol().getText()
    
    def visitUndefinedKeyword(self, ctx: SMTMRParser.UndefinedKeywordContext):
        return ctx.Colon().getText() + self.visitSimpleSymbol(ctx.simpleSymbol())
    
    def visitSymbol(self, ctx: SMTMRParser.SymbolContext):
        if ctx.simpleSymbol():
            return self.visitSimpleSymbol(ctx.simpleSymbol())
        else:
            return ctx.QuotedSymbol().getText()
    
    def visitKeyword(self, ctx: SMTMRParser.KeywordContext):
        if ctx.predefKeyword():
            return ctx.predefKeyword().getChild(0).getText()
        else:
            return self.visitUndefinedKeyword(ctx.undefinedKeyword())
    
    def visitSpec_constant(self, ctx: SMTMRParser.Spec_constantContext):
        if ctx.Numeral():
            return int(ctx.Numeral().getText())
        elif ctx.Decimal():
            return float(ctx.Decimal().getText())
        elif ctx.HexDecimal():
            return int(ctx.HexDecimal().getText().replace('#', '0'), 16)
        elif ctx.Binary():
            return int(ctx.Binary().getText(), 2)
        else:
            return ctx.String().getText()
    
    def visitS_expr(self, ctx: SMTMRParser.S_exprContext):
        if ctx.spec_constant():
            return SExperssion(value=self.visitSpec_constant(ctx.spec_constant()), is_spec_const=True)
        elif ctx.symbol():
            return SExperssion(value=self.visitSymbol(ctx.symbol()), is_symbol=True)
        elif ctx.keyword():
            return SExperssion(value=self.visitKeyword(ctx.keyword()), is_keyword=True)
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
        indices = None
        if ctx.GRW_Underscore():
            indices = []
            for index_ctx in ctx.index():
                indices.append(self.visitIndex(index_ctx))
        return Identifier(symbol, indices)
        
    def visitAttribute_value(self, ctx: SMTMRParser.Attribute_valueContext):
        if ctx.spec_constant():
            return AttributeValue(value=self.visitSpec_constant(ctx.spec_constant()), is_spec_const=True)
        elif ctx.symbol():
            return AttributeValue(value=self.visitSymbol(ctx.symbol()), is_symbol=True)
        else:
            sexprs = []
            if ctx.s_expr():
                for sexpr_ctx in ctx.s_expr():
                    sexprs.append(self.visitS_expr(sexpr_ctx))
            return AttributeValue(sexprs=sexprs)
 
    def visitAttribute(self, ctx: SMTMRParser.AttributeContext):
        keyword = self.visitKeyword(ctx.keyword())
        attribute_value = None
        if ctx.attribute_value():
            attribute_value = self.visitAttribute_value(ctx.attribute_value())
        return Attribute(keyword, attribute_value)
    
    def visitSort(self, ctx: SMTMRParser.SortContext):
        id_ = self.visitIdentifier(ctx.identifier())
        subsorts = None
        if ctx.ParOpen():
            subsorts = []
            for sort_ctx in ctx.sort():
                subsorts.append(self.visitSort(sort_ctx))
        return Sort(id_, subsorts)
    
    def visitQual_identifier(self, ctx: SMTMRParser.Qual_identifierContext):
        id_ = self.visitIdentifier(ctx.identifier())
        sort = None
        if ctx.GRW_As():
            sort = self.visitSort(ctx.sort())
        # TODO check sort
        return [id_, sort]
    
    def visitVar_binding(self, ctx: SMTMRParser.Var_bindingContext):
        return [self.visitSymbol(ctx.symbol()), self.visitTerm(ctx.term())]
    
    def visitSorted_var(self, ctx: SMTMRParser.Sorted_varContext):
        return [self.visitSymbol(ctx.symbol()), self.visitSort(ctx.sort())]
    
    def visitPattern(self, ctx: SMTMRParser.PatternContext):
        if ctx.ParOpen():
            op = self.visitSymbol(ctx.symbol(0))
            subterms = []
            for symbol_ctx in ctx.symbol():
                if symbol_ctx != ctx.symbol(0):
                    subterms.append(self.visitSymbol(symbol_ctx))
            return Expr(op=op, sort=None, subterms=subterms)
        else:
            return Var(id_=self.visitSymbol(ctx.symbol(0)))
    
    def visitMatch_case(self, ctx: SMTMRParser.Match_caseContext):
        return [self.visitPattern(ctx.pattern()), self.visitTerm(ctx.term())]
    
    def visitTerm(self, ctx: SMTMRParser.TermContext):
        if ctx.spec_constant():
            spec_constant = self.visitSpec_constant(ctx.spec_constant())
            return Const(value=spec_constant, sort=None)
            # TODO check sort
        elif ctx.qual_identifier():
            id_, sort = self.visitQual_identifier(ctx.qual_identifier())
            subterms = None
            if ctx.ParOpen(): 
                subterms = []
                for term_ctx in ctx.term():
                    subterms.append(self.visitTerm(term_ctx))
                return Expr(op=id_, sort=sort, subterms=subterms)
            else:
                return Var(id_=id_, sort=sort)
        elif ctx.GRW_Let():
            var_bindings = []
            for vb_ctx in ctx.var_binding():
                var_bindings.append(self.visitVar_binding(vb_ctx))
            term = self.visitTerm(ctx.term())
            return LetTerm(var_bindings=var_bindings, term=term)
        elif ctx.GRW_Forall():
            sorted_vars = []
            for sv_ctx in ctx.sorted_var():
                sorted_vars.append(self.visitSorted_var(sv_ctx))
            term = self.visitTerm()
            return QuantifiedTerm(
                quantifier=Quantifier(ctx.GRW_Forall().getText()),
                sorted_vars=sorted_vars,
                term=term
            )
        elif ctx.GRW_Exists():
            sorted_vars = []
            for sv_ctx in ctx.sorted_var():
                sorted_vars.append(self.visitSorted_var(sv_ctx))
            term = self.visitTerm()
            return QuantifiedTerm(
                quantifier=Quantifier(ctx.GRW_Exists().getText()),
                sorted_vars=sorted_vars,
                term=term
            )
        elif ctx.GRW_Match():
            term = self.visitTerm(ctx.term())
            match_cases = []
            for mc_ctx in ctx.match_case():
                match_cases.append(self.visitMatch_case(mc_ctx))
            # TODO check if all terms in match_cases have same sort
            return MatchTerm(term=term, match_cases=match_cases)
        elif ctx.GRW_Exclamation():
            term = self.visitTerm(ctx.term())
            annotations = []
            for attr_ctx in ctx.attribute():
                annotations.append(self._get_object(attr_ctx))
            return AnnotatedTerm(term=term, annotations=annotations)
    
    def visitFormula_dec(self, ctx: SMTMRParser.Formula_decContext):
        symbol = self.visitSymbol(ctx.symbol(0)) 
        self._check_conflicted_decl(symbol)
        status = None
        status_text = self.visitSymbol(ctx.symbol(1))
        status = text_to_status(status_text)
        return [symbol, status]

    def visitSubstTerm_pair(self, ctx: SMTMRParser.SubstTerm_pairContext):
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
                attributes.append(self.visitAttribute(attr_ctx))
        return symbol, NotationInfo(formula_in, attributes)
    
    def visitSubstTermGroup_dec(self, ctx: SMTMRParser.SubstTermGroup_decContext):
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
        return SubstTermGroup(sorted_vars=sorted_vars, repl_pairs=subst_term_pairs)
    
    def visitAssert_dec(self, ctx: SMTMRParser.Assert_decContext):
        # TODO special terms
        # and check symbols
        return self.visitTerm(ctx.term())

    def visitMethod_dec(self, ctx: SMTMRParser.Method_decContext):
        method_name = ctx.String().getText()
        formula_symbol = self.visitSymbol(ctx.symbol())
        formula_attribute = self.visitAttribute(ctx.attribute())
        return Method(name=method_name, formula=formula_symbol, attribute=formula_attribute)

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
            
        
 
