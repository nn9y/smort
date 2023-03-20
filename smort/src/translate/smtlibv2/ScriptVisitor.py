from smort.src.translate.smtlibv2.SMTLIBv2Parser import SMTLIBv2Parser
from smort.src.translate.smtlibv2.SMTLIBv2Visitor import SMTLIBv2Visitor
from smort.src.translate.smtlibv2.ADT import create_adt, deal_constructor_dec
from smort.src.translate.smtlibv2.Script import *
from smort.src.translate.Ast import *
from smort.src.translate.theory.signatures import *


### !!! TODO !!!
### bound vars
###

### and def dec commands

class ScriptException(Exception):
    pass


class ScriptVisitor(SMTLIBv2Visitor):

    def __init__(self, strict=True):
        self.strict = strict
        self.global_vars = {}   # global vars (nullary funs):
                                # var_symbol -> Sort
        self.signatures = {}    # global self-defined signatures:
                                # fun_symbol -> Fun
        self.datatypes = {}     # global self-defines datatypes
                                # sort_symbol -> Sort
        self.synonyms = {}      # global self-defines synonyms 
                                # syn_sort_symbol -> Sort

    def visitStart(self, ctx: SMTLIBv2Parser.StartContext):
        return self.visitScript(ctx.script())

    def visitUndefinedKeyword(self, ctx: SMTLIBv2Parser.UndefinedKeywordContext):
        return ctx.Colon().getText() + ctx.simpleSymbol().getText()
    
    def visitSymbol(self, ctx: SMTLIBv2Parser.SymbolContext):
        return ctx.getChild(0).getText()

    def visitKeyword(self, ctx: SMTLIBv2Parser.KeywordContext):
        if ctx.predefKeyword():
            return ctx.predefKeyword().getChild(0).getText()
        else:
            return self.visitUndefinedKeyword(ctx.undefinedKeyword())
    
    def visitSpec_constant(self, ctx: SMTLIBv2Parser.Spec_constantContext):
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
 
    def visitS_expr(self, ctx: SMTLIBv2Parser.S_exprContext):
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
    
    def visitIndex(self, ctx: SMTLIBv2Parser.IndexContext):
        if ctx.Numeral():
            return int(ctx.Numeral().getText())
        else:
            return self.visitSymbol(ctx.symbol())
    
    def visitIdentifier(self, ctx: SMTLIBv2Parser.IdentifierContext):
        symbol = self.visitSymbol(ctx.symbol())
        indices = []
        if ctx.GRW_Underscore():
            for index_ctx in ctx.index():
                indices.append(self.visitIndex(index_ctx))
        return Identifier(symbol, indices)

    def visitAttribute_value(self, ctx:SMTLIBv2Parser.Attribute_valueContext):
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

    def visitAttribute(self, ctx: SMTLIBv2Parser.AttributeContext):
        keyword = self.visitKeyword(ctx.keyword())
        attribute_value = None
        if ctx.attribute_value():
            attribute_value = self.visitAttribute_value(ctx.attribute_value())
        return Attribute(keyword, attribute_value) 
    
    def visitSort(self, ctx: SMTLIBv2Parser.SortContext):
        id_ = self.visitIdentifier(ctx.identifier())
        parsorts = []
        if ctx.ParOpen():
            for sort_ctx in ctx.sort():
                parsorts.append(self.visitSort(sort_ctx))
        return Sort(id_, parsorts)

    def visitFunction_dec(self, ctx: SMTLIBv2Parser.Function_decContext):
        symbol = self.visitSymbol(ctx.symbol())
        sorted_vars = []
        for var_ctx in ctx.sorted_var():
            sorted_vars.append(self.visitSorted_var(var_ctx))
        sort = self.visitSort(ctx.sort())
        input_sort_list = [input_sort for _, input_sort in sorted_vars]
        self._add_to_globals(symbol, input_sort_list, sort)
        return FunDecl(symbol, sorted_vars, sort)
    
    def visitFunction_def(self, ctx:SMTLIBv2Parser.Function_defContext):
        symbol = self.visitSymbol(ctx.symbol())
        sorted_vars = []
        for sorted_var_ctx in ctx.sorted_var():
            sorted_vars.append(self.visitSorted_var(sorted_var_ctx))
        sort = self.visitSort(ctx.sort())
        term = self.visitTerm(ctx.term())
        input_sort_list = [input_sort for _, input_sort in sorted_vars]
        self._add_to_globals(symbol, input_sort_list, sort)
        return [symbol, sorted_vars, sort, term]

    def visitScript(self, ctx: SMTLIBv2Parser.ScriptContext):
        cmds = []
        for cmd_ctx in ctx.command():
            cmds.append(self.visitCommand(cmd_ctx))
        return Script(cmds, self.global_vars)

    def handleCommand(self, ctx: SMTLIBv2Parser.CommandContext):
        if ctx.cmd_assert():
            return self.visitCmd_assert(ctx.cmd_assert())
        # if ctx.cmd_checkSat():
        #     return CheckSat() 
        # if ctx.cmd_checkSatAssuming():
        #     return self.visitCmd_checkSatAssuming(ctx.cmd_checkSatAssuming())
        if ctx.cmd_declareConst():
            return self.visitCmd_declareConst(ctx.cmd_declareConst())
        if ctx.cmd_declareDatatype():
            return self.visitCmd_declareDatatype(ctx.cmd_declareDatatype())
        if ctx.cmd_declareDatatypes():
            return self.visitCmd_declareDatatypes(ctx.cmd_declareDatatypes())
        if ctx.cmd_declareFun():
            return self.visitCmd_declareFun(ctx.cmd_declareFun())
        # if ctx.cmd_declareSort():
        #     return self.visitCmd_declareSort(ctx.cmd_declareSort()) 
        if ctx.cmd_defineFun():
            return self.visitCmd_defineFun(ctx.cmd_defineFun())
        if ctx.cmd_defineFunRec():
            return self.visitCmd_defineFunRec(ctx.cmd_defineFunRec())
        if ctx.cmd_defineFunsRec():
            return self.visitCmd_defineFunsRec(ctx.cmd_defineFunsRec())
        # TODO
        if ctx.cmd_defineSort():
            return self.visitCmd_defineSort(ctx.cmd_defineSort()) 
        # if ctx.cmd_push():
        #     return self.visitCmd_push(ctx.cmd_push())
        # if ctx.cmd_pop():
        #     return self.visitCmd_pop(ctx.cmd_pop())
        else:
            return None # commands we won't deal with

    def visitQual_identifier(self, ctx: SMTLIBv2Parser.Qual_identifierContext):
        id_ = self.visitIdentifier(ctx.identifier())
        sort = self.visitSort(ctx.sort()) if ctx.GRW_As() else None
        return [id_, sort]
    
    def visitVar_binding(self, ctx: SMTLIBv2Parser.Var_bindingContext, local_vars):
        var = self.visitSymbol(ctx.symbol())
        term = self.visitTerm(ctx.term(), local_vars)
        return [var, term]

    def visitSorted_var(self, ctx: SMTLIBv2Parser.Sorted_varContext):
        return [self.visitSymbol(ctx.symbol()), self.visitSort(ctx.sort())]

    def visitPattern(self, ctx: SMTLIBv2Parser.PatternContext):
        name = self.visitSymbol(ctx.symbol(0))
        var_list = []
        for sym_ctx in ctx.symbol()[1:]:
            var = self.visitSymbol(sym_ctx)
            var_list.append(var)
        return name, var_list
    
    def visitMatch_case(self, ctx: SMTLIBv2Parser.Match_caseContext, local_vars):
        name, var_list = self.visitPattern(ctx.pattern())
        _local_vars = copy.deepcopy(local_vars)
        for var in var_list:
            _local_vars[str(var)] = Fun(Identifier(str(var)), [], None)
        bound_vars = copy.deepcopy(_local_vars)
        term = self.visitTerm(ctx.term(), _local_vars)
        term.bound_vars = bound_vars
        return [[name] + var_list, term]

    def getString(self, ctx):
        start, stop = ctx.start.start, ctx.stop.stop
        return ctx.start.getInputStream().getText(start, stop)
    
    def visitSort_dec(self, ctx:SMTLIBv2Parser.Sort_decContext):
        return [self.visitSymbol(ctx.symbol()), int(ctx.numeral().getText())]

    def visitSelector_dec(self, ctx:SMTLIBv2Parser.Selector_decContext):
        return [self.visitSymbol(ctx.symbol()), self.visitSort(ctx.sort())]

    def visitConstructor_dec(self, ctx:SMTLIBv2Parser.Constructor_decContext):
        name = self.visitSymbol(ctx.symbol())
        selector_list = []
        for sd_ctx in ctx.selector_dec():
            selector_list.append(self.visitSelector_dec(sd_ctx))
        return ConstructorDec(name, selector_list)
 
    def visitDatatype_dec(self, ctx:SMTLIBv2Parser.Datatype_decContext):
        pars = []
        if ctx.GRW_Par():
            for sym_ctx in ctx.symbol():
                pars.append(self.visitSymbol(sym_ctx))
        decs = []
        for cd_ctx in ctx.constructor_dec():
            decs.append(self.visitConstructor_dec(cd_ctx))
        return [pars, decs]

    def visitCmd_assert(self, ctx:SMTLIBv2Parser.Cmd_assertContext):
        local_vars = set()
        term = self.visitTerm(ctx.term(), local_vars)
        term.update_global_free_vars()
        return Assert(term)
    
    def visitCmd_declareConst(self, ctx:SMTLIBv2Parser.Cmd_declareConstContext):
        var = self.visitSymbol(ctx.symbol())
        sort = self.visitSort(ctx.sort())

        self._add_to_globals(var, [], sort)

        return DeclareConst(var, sort)
 
    def visitCmd_declareDatatype(self, ctx:SMTLIBv2Parser.Cmd_declareDatatypeContext):
        adt_name = self.visitSymbol(ctx.symbol())
        pars, constructor_decs = self.visitDatatype_dec(ctx.datatype_dec())
        adt = create_adt(adt_name, len(pars))
        self._add_to_datatypes(adt_name, adt)
        for dec in constructor_decs:
            funs_list = deal_constructor_dec(dec, adt, pars)
            for fun in funs_list:
                self._add_to_signatures(fun)
        return DeclareDataType(adt_name, DataTypeDec(pars, constructor_decs)) 

    def visitCmd_declareDatatypes(self, ctx:SMTLIBv2Parser.Cmd_declareDatatypesContext):
        adts = []
        sort_decs = []
        for sd_ctx in ctx.sort_dec():
            adt_name, arity = self.visitSort_dec(sd_ctx)
            sort_decs.append([adt_name, arity])
            adt = create_adt(adt_name, arity)
            self._add_to_datatypes(adt_name, adt)
            adts.append(adt)
        datatype_decs = []
        for i, dtd_ctx in enumerate(ctx.datatype_dec()):
            pars, decs = self.visitDatatype_dec(dtd_ctx)
            datatype_decs.append(DataTypeDec(pars, decs))
            for dec in decs:
                funs_list = deal_constructor_dec(dec, adts[i], pars)
                for fun in funs_list:
                    self._add_to_signatures(fun)
        return DeclareDataTypes(sort_decs, datatype_decs) 

    def visitCmd_declareFun(self, ctx:SMTLIBv2Parser.Cmd_declareFunContext):
        symbol = self.visitSymbol(ctx.symbol())
        input_sort_list = []
        for sort_ctx in ctx.sort()[:-1]:
            input_sort_list.append(self.visitSort(sort_ctx))
        output_sort = self.visitSort(ctx.sort()[-1])

        self._add_to_globals(symbol, input_sort_list, output_sort)

        return DeclareFun(symbol, input_sort_list, output_sort)
    
    def visitCmd_defineFun(self, ctx:SMTLIBv2Parser.Cmd_defineFunContext):
        symbol, sorted_vars, sort, term = self.visitFunction_def(ctx.function_def)
        # '_add_to_globals()' called in 'visitFunction_def()'
        return DefineFun(symbol, sorted_vars, sort, term)

    def visitCmd_defineFunRec(self, ctx:SMTLIBv2Parser.Cmd_defineFunRecContext):
        symbol, sorted_vars, sort, term = self.visitFunction_def(ctx.function_def)
        # '_add_to_globals()' called in 'visitFunction_def()'
        return DefineFunRec(symbol, sorted_vars, sort, term)
    
    def visitCmd_defineFunsRec(self, ctx:SMTLIBv2Parser.Cmd_defineFunsRecContext):
        fun_decls = []
        for fun_dec_ctx in ctx.function_dec():
            fun_decls.append(self.visitFunction_dec(fun_dec_ctx))
        terms = []
        for term_ctx in ctx.term():
            # TODO
            # deal terms here?
            terms.append(self.visitTerm(term_ctx))
        # '_add_to_globals()' called in 'visitFunction_dec()'
        return DefineFunsRec(fun_decls, terms)

    def visitCmd_defineSort(self, ctx:SMTLIBv2Parser.Cmd_defineSortContext):
        symbol = self.visitSymbol(ctx.symbol(0))
        pars = []
        for sym_ctx in ctx.symbol()[1:]:
            pars.append(self.visitSymbol(sym_ctx))
        sort = self.visitSort(ctx.sort())
        # TODO
        # get parametric sort ^
        self.synonyms[symbol] = sort
        ## 
        return DefineSort(symbol, pars, sort)
 
    def visitCommand(self, ctx: SMTLIBv2Parser.CommandContext):
        if not self.strict:
            try:
                cmd = self.handleCommand(ctx)
                if not cmd:
                    return SMTLIBCommand(self.getString(ctx))
                else:
                    return cmd
            except Exception:
                return SMTLIBCommand(self.getString(ctx))
        else:
            cmd = self.handleCommand(ctx)
            if not cmd:
                return SMTLIBCommand(self.getString(ctx))
            else:
                return cmd
 
    def visitTerm(self, ctx: SMTLIBv2Parser.TermContext, local_vars):
        # TODO
        # bound vars
        if ctx.spec_constant():
            spec_constant = self.visitSpec_constant(ctx.spec_constant())
            fun = self._well_sorted_term(spec_constant, [], None, local_vars)
            return Const(name=spec_constant, sort=fun.output)
        elif ctx.qual_identifier():
            id_, sort = self.visitQual_identifier(ctx.qual_identifier())
            qual_id = True if sort else False
            subterms = None
            if ctx.ParOpen(): 
                subterms = []
                input_list = []
                local_free_vars = {}
                for term_ctx in ctx.term():
                    subterm = self.visitTerm(term_ctx, local_vars)
                    subterms.appen(subterm)
                    input_list.append(subterm.sort)
                    local_free_vars.update(subterms.local_free_vars)
                fun = self._well_sorted_term(id_, input_list, sort, local_vars)
                return Expr(
                            name=id_,
                            subterms=subterms,
                            sort=fun.output,
                            local_free_vars=local_free_vars,
                            qual_id=qual_id,
                        )
            else:
                fun = self._well_sorted_term(id_, [], sort, local_vars)
                return Var(name=id_, sort=fun.output, qual_id=qual_id)
        elif ctx.GRW_Let():
            var_bindings = []
            var_list = []
            bound_vars = set()
            term_local_free_vars = []
            _local_vars = copy.deepcopy(local_vars)
            for vb_ctx in ctx.var_binding():
                var, term = self.visitVar_binding(vb_ctx, local_vars)
                term_local_free_vars.append(term.local_free_vars)
                var_list.append(var)
                bound_vars.add(var)
                var_bindings.append([var, term])
                _local_vars[str(var)] = Fun(Identifier(str(var)), [], None)
            let_term = self.visitTerm(ctx.term(), _local_vars)
            let_term.bound_vars = bound_vars
            let_term_free_vars = let_term.local_free_vars
            local_free_vars = let_term_free_vars 
            for var in var_list:
                let_term_free_vars.remove(var)
            for i, free_vars in enumerate(term_local_free_vars):
                if var_list[i] in let_term_free_vars:
                    local_free_vars.update(free_vars)
            return LetBinding(
                    var_bindings=var_bindings,
                    let_term=let_term,
                    sort=let_term.sort,
                    local_free_vars=local_free_vars,
                )
        elif ctx.GRW_Forall():
            return self._handle_quantifier(
                            ctx,
                            Quantifier(ctx.GRW_Forall().getText()),
                            local_vars
                        )
        elif ctx.GRW_Exists():
            return self._handle_quantifier(
                            ctx,
                            Quantifier(ctx.GRW_Exists().getText()),
                            local_vars
                        )
        elif ctx.GRW_Match():
            term = self.visitTerm(ctx.term(), local_vars)
            local_free_vars = term.local_free_vars
            match_cases = []
            for mc_ctx in ctx.match_case():
                # TODO
                pat, term = self.visitMatch_case(mc_ctx, local_vars)
                match_cases.append([pat, term])
                for var in term.local_free_vars:
                    if not var in pat[1:]:
                        local_free_vars.add(var)
            # TODO sort
            return Match(
                term=term,
                match_cases=match_cases,
                sort=match_cases[0][1].sort,
                local_free_vars=local_free_vars,
            )
        elif ctx.GRW_Exclamation():
            term = self.visitTerm(ctx.term())
            annotations = []
            for attr_ctx in ctx.attribute():
                annotations.append(self._get_object(attr_ctx))
            return AnnotatedTerm(term=term, annotations=annotations, sort=term.sort)
    
    def _handle_quantifier(
            self,
            ctx: SMTLIBv2Parser.TermContext,
            quant,
            local_vars
    ):
        quant_vars = []
        _local_vars = copy.deepcopy(local_vars)
        bound_vars = set()
        for sv_ctx in ctx.sorted_var():
            var, sort = self.visitSorted_var(sv_ctx)
            quant_vars.append([var, sort])

            _local_vars[str(var)] = Fun(Identifier(str(var)), [], sort)
            bound_vars.add(var)

        quant_term = self.visitTerm(ctx.term(), _local_vars)
        local_free_vars = quant_term.local_free_vars
        for var, _ in quant_vars:
            local_free_vars.remove(var)
        quant_term.bound_vars = bound_vars
        return Quantifier(
                Quantifier=quant,
                quantified_vars=quant_vars,
                quantified_term=quant_term,
                sort=quant_term.sort,
                local_free_vars=local_free_vars,
            )
    
    def _add_to_global_vars(self, name, sort):
        self.global_vars[str(name)] = sort 
    
    def _add_to_signatures(self, name, input_list, output):
        self.signatures[str(name)] = Fun(name, input_list, output) 

    def _add_to_signatures(self, fun):
        self.signatures[str(fun.name)] = fun 
    
    def _add_to_datatypes(self, name, sort):
        self.datatypes[str(name)] = sort
    
    def _get_sort_synonym(self, name, par_dict):
        if name in self.synonyms:
            return Sort(self.synonyms[name].get_parametric_instance(par_dict))
        if name in all_synonyms:
            return Sort(all_synonyms[name].get_parametric_instance(par_dict))
        return None
    
    # def _valid_sort(self, name, sort):
    #     if str(name) in self.datatypes:
    #         if sort.same_type(self.datatypes[str(name)]):
    #             return True
    #         if sort in all_synonyms and all_synonyms(sort).same_type(self.datatypes[str(name)]):
    #             return True
    #         return False
    #     if str(name) in all_sorts:
    #         if sort.same_type(all_sorts[str(name)]):
    #             return True
    #         if sort in all_synonyms and all_synonyms(sort).same_type(all_sorts[str(name)]):
    #             return True
    #         return False

    def _well_sorted_term(self, name, input_list=None, output=None, local_vars=None):
        # scope
        # local vars
        if str(name) in local_vars and input_list == []:
            return Fun(Identifier(str(name)), [], local_vars[str(name)]) 
        # global signatures
        fun = match_fun_in_signatures(name, input_list, output, self.signatures)
        if fun:
            return fun
        # predefined signatures
        fun = match_fun_in_signatures(name, input_list, output, all_funs)
        if fun:
            return fun
        else:
            raise ScriptException(f"function ({name} {list2str(input_list)}) is not declared")
