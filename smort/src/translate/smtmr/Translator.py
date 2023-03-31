from smort.src.translate.smtmr.SMTMRParser import SMTMRParser
from smort.src.translate.smtmr.SMTMRVisitor import SMTMRVisitor
from smort.src.translate.smtmr.MetamorphicRelation import *
from smort.src.translate.theory.signatures import *
from smort.src.translate.Ast import *


class SMTMRException(Exception):
    pass



class Translator(SMTMRVisitor):
    def __init__(self):
        self.seed_status_list = []
        self.index_of_seed = {}
        self.seed_on_index = {} 
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
                self.seed_on_index[seed_idx] = symbol 
                seed_idx += 1
            elif isinstance(child, SMTMRParser.Mutant_decContext):
                self.mutant = self.visitMutant_dec(child)
            elif isinstance(child, SMTMRParser.Notation_decContext):
                symbol, info = self.visitNotation_dec(child)
                self.notations[symbol] = info
            elif isinstance(child, SMTMRParser.SubstTemplate_decContext):
                self.subst_templates.append(self.visitSubstTemplate_dec(child)) 
            elif isinstance(child, SMTMRParser.Method_decContext):
                self.methods.append(self.visitMethod_dec(child))
            elif isinstance(child, SMTMRParser.Fuse_decContext):
                self.fuse_term = self.visitFuse_dec(child)
            else:
                continue

        return MetamorphicRelation(
            self.seed_status_list,
            self.index_of_seed,
            self.seed_on_index,
            self.mutant,
            self.notations,
            self.subst_templates,
            self.methods,
            self.fuse_term
        ) 
 
    def visitUndefinedKeyword(self, ctx: SMTMRParser.UndefinedKeywordContext):
        return ctx.Colon().getText() + ctx.simpleSymbol().getText()
    
    def visitSymbol(self, ctx: SMTMRParser.SymbolContext):
        # TODO
        # convert symbol to Identifier object
        # for convenience of comparing
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
            return SpecConstant(SpecConstType.B_VALUE, ctx.b_value().getText()) 
 
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
                parsort = self.visitSort(sort_ctx)
                parsorts.append(parsort)
        symbol = id_.symbol
        # map to synonym sort
        synonym_sort = get_sort_in_synonym(symbol, parsorts, all_synonyms)
        if synonym_sort:
            return synonym_sort
        # valid sort
        sort = Sort(id_, parsorts)
        if self._is_valid_sort(symbol, sort):
            return sort
        raise SMTMRException("not a valid sort, or a synonym of a valid sort")
 
    def visitQual_identifier(self, ctx: SMTMRParser.Qual_identifierContext):
        id_ = self.visitIdentifier(ctx.identifier())
        sort = self.visitSort(ctx.sort()) if ctx.GRW_As() else None
        return [id_, sort]
 
    def visitSorted_var(self, ctx: SMTMRParser.Sorted_varContext):
        return [self.visitSymbol(ctx.symbol()), self.visitSort(ctx.sort())]

    def visitTerm(self, ctx: SMTMRParser.TermContext, local_vars):
        if ctx.spec_constant():
            spec_constant = self.visitSpec_constant(ctx.spec_constant())
            ret_sort, flag = self._well_sorted_term(spec_constant, [], None, local_vars)
            if flag != 1:
                raise SMTMRException(f"notation name '{spec_constant.const_type}' overrides signature in theories")
            return Const(name=spec_constant, sort=ret_sort)
        elif ctx.qual_identifier():
            id_, sort = self.visitQual_identifier(ctx.qual_identifier())
            qual_id = True if sort else False
            if ctx.ParOpen(): 
                subterms = []
                input_list = []
                for term_ctx in ctx.term():
                    # in current grammar of SMTMR, visiting term does not modify local_vars
                    subterm = self.visitTerm(term_ctx, local_vars)
                    subterms.append(subterm)
                    input_list.append(subterm.sort)
                ret_sort, flag = self._well_sorted_term(id_, input_list, sort, local_vars)
                if flag != 1:
                    raise SMTMRException(f"notation name '{id_}' overrides signature in theories")
                return Expr(name=id_, subterms=subterms, sort=ret_sort, qual_id=qual_id)
            else:
                ret_sort, flag = self._well_sorted_term(id_, [], sort, local_vars)
                if flag == 1:
                    return Expr(name=id_, subterms=[], sort=ret_sort, qual_id=qual_id)
                else:
                    return Var(name=id_, sort=ret_sort, qual_id=qual_id)
    
    def visitBoolean_term_template(self, ctx:SMTMRParser.Boolean_term_templateContext):
        sym = self.visitSymbol(ctx.symbol())
        if ctx.ParOpen(): 
            subterms = []
            input_list = []
            for btt_ctx in ctx.boolean_term_template():
                subbtt = self.visitBoolean_term_template(btt_ctx)
                subterms.append(subbtt)
                input_list.append(BOOL)
            self._check_boolean_fun(sym, input_list)
            return Expr(name=Identifier(sym), subterms=subterms, sort=BOOL)
        else:
            self._check_valid_formula_symbol(sym)
            return Var(name=Identifier(sym), sort=BOOL)
    
    def visitFormula_dec(self, ctx: SMTMRParser.Formula_decContext):
        symbol = self.visitSymbol(ctx.symbol()) 
        self._check_conflicted_decl(symbol)
        status = Status(ctx.status().getText())
        return [symbol, status]

    def visitSubst_pair(self, ctx: SMTMRParser.Subst_pairContext, local_vars):
        # in current grammar of SMTMR, visiting term does not modify local_vars
        # _local_vars = copy.deepcopy(local_vars)
        # term = self.visitTerm(ctx.term(0), _local_vars)
        term = self.visitTerm(ctx.term(0), local_vars)
        # _local_vars = copy.deepcopy(local_vars)
        # repl = self.visitTerm(ctx.term(1), _local_vars)
        repl = self.visitTerm(ctx.term(1), local_vars)
        return [term, repl]

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
    
    def visitSubstTemplate_dec(self, ctx: SMTMRParser.SubstTemplate_decContext):
        attributes = []
        for attr_ctx in ctx.attribute():
            attributes.append(self.visitAttribute(attr_ctx))
        local_vars = {}
        sorted_vars = []
        for sv_ctx in ctx.sorted_var():
            symbol, sort = self.visitSorted_var(sv_ctx)
            self._check_valid_notation(symbol)
            local_vars[symbol] = sort
            sorted_vars.append([symbol, sort])
        subst_term_pairs = []
        for stp_ctx in ctx.subst_pair():
            term, repl = self.visitSubst_pair(stp_ctx, local_vars)        
            if (term.sort and repl.sort) and (term.sort != repl.sort):
                raise SMTMRException("sort of terms before and after substitution should be the same")
            subst_term_pairs.append([term, repl])
        return SubstTemplate(attributes=attributes, sorted_vars=sorted_vars, repl_pairs=subst_term_pairs)
 
    def visitFuse_dec(self, ctx: SMTMRParser.Fuse_decContext):
        return self.visitBoolean_term_template(ctx.boolean_term_template())

    def visitMethod_dec(self, ctx: SMTMRParser.Method_decContext):
        method_name = ctx.String().getText()
        formula_symbol = self.visitSymbol(ctx.symbol())
        formula_attribute = self.visitAttribute(ctx.attribute())
        return Method(name=method_name, formula=formula_symbol, attribute=formula_attribute)

    def _well_sorted_term(self, name, input_list=None, output=None, local_vars=None):
        if str(name) in local_vars:
            # sorted symbols declared in each subst template
            sort = local_vars[str(name)]
            if (
                (output and sort == output)
                or not output
            ):
                return sort, 0 
        # predefined signatures
        # constants, functions
        fun = match_fun_in_signatures(name, input_list, output, all_funs)
        if fun:
            return fun.output, 1 
        # accept more functions 
        # only need function name and input list sort
        return None, 1 
        # raise SMTMRException(f"signature ({name} {list2str(input_list)}) is not defined")

    def _check_valid_formula_symbol(self, symbol: str):
        if str(symbol) in self.index_of_seed:
            return
        for method in self.methods:
            if str(symbol) == str(method.formula):
                return
        for sym, info in self.notations.items():
            if str(symbol) == str(sym):
                for attr in info.attributes:
                    if attr.keyword == SMTMRKeyword.GEN:
                        return
        raise SMTMRException(f"'{symbol}' is not a valid seed symbol, \
symbol returned by extended method, or notation with :gen attributes")
    
    def _check_boolean_fun(self, symbol: str, input_list):
        fun = match_fun_in_signatures(Identifier(symbol), input_list, None, core_funs)
        if fun:
            return
        raise SMTMRException(f"'({symbol} {list2str(input_list)})' is not a valid boolean signature")

    def _check_conflicted_decl(self, symbol: str):
        conflict = False
        if self._is_seed(symbol):
            conflict = True
        elif self._is_mutant(symbol):
            conflict = True
        elif self._is_notation(symbol):
            conflict = True
        if conflict:
            raise  SMTMRException(f"'{symbol}' has already defined")
    
    def _check_valid_seed(self, symbol: str):
        if not self._is_seed(symbol):
            raise  SMTMRException(f"'{symbol}' is not a seed")
    
    def _check_valid_notation(self, symbol: str):
        if not self._is_notation(symbol):
            raise SMTMRException(f"'{symbol}' is not a notation")
 
    def _is_valid_sort(self, symbol: str, sort):
        if symbol in all_sorts:
            if sort.same_type(all_sorts[symbol]):
                return True
        return False
    
    def _is_seed(self, symbol: str):
        if symbol in self.index_of_seed:
            return True
    
    def _is_mutant(self, symbol: str):
        if self.mutant and (symbol == self.mutant[0]):
            return True
    
    def _is_notation(self, symbol: str):
        if symbol in self.notations:
            return True
            
        
 
