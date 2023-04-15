from smort.src.translate.smtlibv2.SMTLIBv2Parser import SMTLIBv2Parser
from smort.src.translate.smtlibv2.SMTLIBv2Visitor import SMTLIBv2Visitor
from smort.src.translate.smtlibv2.ADT import declare_datatype, add_functions_of_datatype
from smort.src.translate.smtlibv2.cnf_conversion import Term2CNFTerm
from smort.src.translate.smtlibv2.Script import *
from smort.src.translate.tools.Sort import *
from smort.src.translate.tools.Term import (
    TermScopeType, Const, Var, Expr, LetBinding, Quantifier, Match, AnnotatedTerm
)
from smort.src.translate.theory.signatures import *



class ScriptException(Exception):
    pass



class ScriptVisitor(SMTLIBv2Visitor):

    def __init__(self, strict=True):
        self.strict = strict
        self.global_vars = {}   # global vars:
                                # str -> Sort
        self.signatures = {}    # global self-defined signatures:
                                # str -> Fun
        self.datatypes = {}     # global self-defines datatypes, or sort declared
                                # str -> Sort
        self.synonyms = {}      # global self-defines synonyms of sorts 
                                # str -> [Sort, list]
        self.datatype_functions = {}
        self.quant_count = 0

    def visitStart(self, ctx: SMTLIBv2Parser.StartContext):
        return self.visitScript(ctx.script())
 
    def visitSymbol(self, ctx: SMTLIBv2Parser.SymbolContext):
        return ctx.getChild(0).getText()

    def visitKeyword(self, ctx: SMTLIBv2Parser.KeywordContext):
        if ctx.predefKeyword():
            return ctx.predefKeyword().getChild(0).getText()
        else:
            return ctx.Colon().getText() + ctx.simpleSymbol().getText()
    
    def visitSpec_constant(self, ctx: SMTLIBv2Parser.Spec_constantContext):
        if ctx.numeral():
            return SpecConstant(SpecConstType.NUMERAL, int(ctx.numeral().getText()))
        elif ctx.decimal():
            return SpecConstant(SpecConstType.DECIMAL, float(ctx.decimal().getText()))
        elif ctx.hexadecimal():
            return SpecConstant(SpecConstType.HEXDECIMAL, ctx.hexdecimal().getText())
        elif ctx.binary():
            return SpecConstant(SpecConstType.BINARY, ctx.binary().getText())
        elif ctx.string():
            return SpecConstant(SpecConstType.STRING, ctx.string().getText())
        else:
            return SpecConstant(SpecConstType.B_VALUE, ctx.b_value().getText()) 
 
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
        if ctx.numeral():
            return int(ctx.numeral().getText())
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
                parsort = self.visitSort(sort_ctx)
                parsorts.append(parsort)
        symbol = id_.symbol 
        # map to synonym sort
        synonym_sort = self._get_sort_in_synonym(symbol, parsorts)
        if synonym_sort:
            return synonym_sort
        # valid sort
        sort = Sort(id_, parsorts)
        if self._is_valid_sort(symbol, sort):
            return sort
        # parameter placeholder
        if len(parsorts) == 0:
            return str(id_)
        raise ScriptException("not a valid sort, a synonym of a valid sort, or a placeholder of parameter")

    def visitFunction_dec(self, ctx: SMTLIBv2Parser.Function_decContext):
        symbol = self.visitSymbol(ctx.symbol())
        sorted_vars = []
        local_vars = {}
        for sv_ctx in ctx.sorted_var():
            v, s = self.visitSorted_var(sv_ctx)
            sorted_vars.append([v, s])
            local_vars[v] = s
        sort = self.visitSort(ctx.sort())
        input_sort_list = [input_sort for _, input_sort in sorted_vars]
 
        # function_dec used in cmd_defineFunsRec,
        # function symbols are declared first,
        # terms can use them after
        if len(input_sort_list) == 0:
            self.global_vars[symbol] = sort
        else:
            self.signatures[symbol] = Fun(Identifier(symbol), input_sort_list, sort) 

        return FunDecl(symbol, sorted_vars, sort), local_vars
 
    def visitFunction_def(self, ctx:SMTLIBv2Parser.Function_defContext, rec=False):
        symbol = self.visitSymbol(ctx.symbol())
        sorted_vars = []
        local_vars = {}
        for sv_ctx in ctx.sorted_var():
            v, s = self.visitSorted_var(sv_ctx)
            sorted_vars.append([v, s])
            local_vars[v] = s
        sort = self.visitSort(ctx.sort())
        input_sort_list = [input_sort for _, input_sort in sorted_vars]

        if rec:
            # declare function first
            if len(input_sort_list) == 0:
                self.global_vars[symbol] = sort
            else:
                self.signatures[symbol] = Fun(Identifier(symbol), input_sort_list, sort) 
            term = self.visitTerm(ctx.term(), local_vars)
        else:
            # visit term first
            term = self.visitTerm(ctx.term(), local_vars)
            if len(input_sort_list) == 0:
                self.global_vars[symbol] = sort
            else:
                self.signatures[symbol] = Fun(Identifier(symbol), input_sort_list, sort) 

        return [symbol, sorted_vars, sort, term]

    def visitScript(self, ctx: SMTLIBv2Parser.ScriptContext):
        cmds = []
        for cmd_ctx in ctx.command():
            cmd = self.visitCommand(cmd_ctx)
            if isinstance(cmd, list):
                cmds.extend(cmd)
            else:
                cmds.append(cmd)
        global_sigs = {sig: fun.output for sig, fun in self.signatures.items()}
        global_sigs.update(self.global_vars)
        return Script(cmds, self.global_vars, global_sigs, self.datatype_functions)

    def handleCommand(self, ctx: SMTLIBv2Parser.CommandContext):
        if ctx.cmd_setLogic():
            return self.visitCmd_setLogic(ctx.cmd_setLogic())
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
        if ctx.cmd_declareSort():
            return self.visitCmd_declareSort(ctx.cmd_declareSort()) 
        if ctx.cmd_defineFun():
            return self.visitCmd_defineFun(ctx.cmd_defineFun())
        if ctx.cmd_defineFunRec():
            return self.visitCmd_defineFunRec(ctx.cmd_defineFunRec())
        if ctx.cmd_defineFunsRec():
            return self.visitCmd_defineFunsRec(ctx.cmd_defineFunsRec())
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
        term = self.visitTerm(ctx.term(), copy.deepcopy(local_vars))
        return [var, term]

    def visitSorted_var(self, ctx: SMTLIBv2Parser.Sorted_varContext):
        return [self.visitSymbol(ctx.symbol()), self.visitSort(ctx.sort())]

    def visitPattern(self, ctx: SMTLIBv2Parser.PatternContext, output, par_dict):
        name = self.visitSymbol(ctx.symbol(0))
        var_list = []
        if ctx.ParOpen(): 
            for sym_ctx in ctx.symbol()[1:]:
                var = self.visitSymbol(sym_ctx)
                var_list.append(var)
        var_sort_list = self._valid_pattern(name, len(var_list), output, par_dict)
        if not var_sort_list:
            var_list = [name]
            name = None
        return Pattern(name, var_list), var_sort_list 
    
    def visitMatch_case(self, ctx: SMTLIBv2Parser.Match_caseContext, output, par_dict, local_vars):
        pattern, var_sort_list = self.visitPattern(ctx.pattern(), output, par_dict)
        var_list = pattern.var_list
        _local_vars = copy.deepcopy(local_vars)
        for i, var in enumerate(var_list):
            _local_vars[var] =  var_sort_list[i]
        if not var_sort_list:
            # a single variable
            _local_vars[var_list[0]] = output
        bound_vars = copy.deepcopy(_local_vars)
        term = self.visitTerm(ctx.term(), _local_vars)
        term.update_bound_vars(bound_vars)
        return [pattern, term]

    def getString(self, ctx):
        start, stop = ctx.start.start, ctx.stop.stop
        return ctx.start.getInputStream().getText(start, stop)
    
    def visitCmd_setLogic(self, ctx:SMTLIBv2Parser.Cmd_setLogicContext):
        logic = self.visitSymbol(ctx.symbol())
        return SetLogic(logic) 
    
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
        cdecs = []
        for cd_ctx in ctx.constructor_dec():
            cdecs.append(self.visitConstructor_dec(cd_ctx))
        return [pars, cdecs]

    def visitCmd_assert(self, ctx:SMTLIBv2Parser.Cmd_assertContext):
        local_vars = {}
        term = self.visitTerm(ctx.term(), local_vars)
        # convert from Term to CNFTerm
        new_declfuns, cnf_term = Term2CNFTerm(term)

        for fun_decl in new_declfuns:
            symbol, input_sort_list, output_sort = fun_decl.symbol, fun_decl.input_sort_list, fun_decl.output_sort
            if len(input_sort_list) == 0:
                self.global_vars[symbol] = output_sort 
            else:
                self.signatures[symbol] = Fun(Identifier(symbol), input_sort_list, output_sort) 

        return new_declfuns + [Assert(cnf_term)]
    
    def visitCmd_declareConst(self, ctx:SMTLIBv2Parser.Cmd_declareConstContext):
        var = self.visitSymbol(ctx.symbol())
        sort = self.visitSort(ctx.sort())

        self.global_vars[var] = sort

        return DeclareConst(var, sort)
 
    def visitCmd_declareDatatype(self, ctx:SMTLIBv2Parser.Cmd_declareDatatypeContext):
        adt_name = self.visitSymbol(ctx.symbol())
        pars, cdecs = self.visitDatatype_dec(ctx.datatype_dec())
        adt = declare_datatype(adt_name, len(pars))
        if len(pars) > 0:
            self.datatypes[str(adt_name)] = adt(pars) 
        else:
            self.datatypes[str(adt_name)] = adt
        for cdec in cdecs:
            fun_list = add_functions_of_datatype(cdec, adt, pars)
            for fun in fun_list:
                self.signatures[str(fun.name)] = fun
                self.datatype_functions[str(fun.name)] = fun.output

        return DeclareDataType(adt_name, DataTypeDec(pars, cdecs)) 

    def visitCmd_declareDatatypes(self, ctx:SMTLIBv2Parser.Cmd_declareDatatypesContext):
        adts = []
        sort_decs = []
        for sd_ctx in ctx.sort_dec():
            adt_name, arity = self.visitSort_dec(sd_ctx)
            sort_decs.append([adt_name, arity])
            adt = declare_datatype(adt_name, arity)
            # adt with arity > 0 is a function now
            # ** instantiate later **
            self.datatypes[str(adt_name)] = adt 
            adts.append(adt)

        datatype_decs = []
        for i, dtd_ctx in enumerate(ctx.datatype_dec()):
            pars, cdecs = self.visitDatatype_dec(dtd_ctx)
            if len(pars) > 0:
                # ** instantiate adt **
                # before add functions related to it
                self.datatypes[str(adt_name)] = adts[i](pars) 
            datatype_decs.append(DataTypeDec(pars, cdecs))
            for cdec in cdecs:
                fun_list = add_functions_of_datatype(cdec, adts[i], pars)
                for fun in fun_list:
                    self.signatures[str(fun.name)] = fun
                    self.datatype_functions[str(fun.name)] = fun.output

        return DeclareDataTypes(sort_decs, datatype_decs) 
    
    def visitCmd_declareFun(self, ctx:SMTLIBv2Parser.Cmd_declareFunContext):
        symbol = self.visitSymbol(ctx.symbol())
        input_sort_list = []
        for sort_ctx in ctx.sort()[:-1]:
            input_sort_list.append(self.visitSort(sort_ctx))
        output_sort = self.visitSort(ctx.sort()[-1])

        if len(input_sort_list) == 0:
            self.global_vars[symbol] = output_sort
        else:
            self.signatures[symbol] = Fun(Identifier(symbol), input_sort_list, output_sort) 

        return DeclareFun(symbol, input_sort_list, output_sort)
    
    def visitCmd_declareSort(self, ctx:SMTLIBv2Parser.Cmd_declareSortContext):
        symbol = self.visitSymbol(ctx.symbol())
        arity = int(ctx.numeral().getText())
        sort = sort_with_arity(symbol, arity)
        if arity > 0:
            par_list = [f"P{i+1}" for i in range(arity)]
            sort = sort(par_list)

        self.datatypes[symbol] = sort

        return DeclareSort(symbol, arity)

    def visitCmd_defineFun(self, ctx:SMTLIBv2Parser.Cmd_defineFunContext):
        symbol, sorted_vars, sort, term = self.visitFunction_def(ctx.function_def)
        return DefineFun(symbol, sorted_vars, sort, term)

    def visitCmd_defineFunRec(self, ctx:SMTLIBv2Parser.Cmd_defineFunRecContext):
        symbol, sorted_vars, sort, term = self.visitFunction_def(ctx.function_def, rec=True)
        return DefineFunRec(symbol, sorted_vars, sort, term)
    
    def visitCmd_defineFunsRec(self, ctx:SMTLIBv2Parser.Cmd_defineFunsRecContext):
        fun_decls = []
        local_vars_list = []
        for fun_dec_ctx in ctx.function_dec():
            decl, local_vars = self.visitFunction_dec(fun_dec_ctx)
            fun_decls.append(decl)
            local_vars_list.append(local_vars)
        terms = []
        for i, term_ctx in enumerate(ctx.term()):
            terms.append(self.visitTerm(term_ctx, local_vars_list[i]))
        return DefineFunsRec(fun_decls, terms)

    def visitCmd_defineSort(self, ctx:SMTLIBv2Parser.Cmd_defineSortContext):
        symbol = self.visitSymbol(ctx.symbol(0))
        par_list = []
        for sym_ctx in ctx.symbol()[1:]:
            par_list.append(self.visitSymbol(sym_ctx))

        synonym_sort = self.visitSort(ctx.sort())
    
        # maybe parametric sort
        self.synonyms[symbol] = [synonym_sort, par_list]

        return DefineSort(symbol, par_list, synonym_sort)
 
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
        if ctx.spec_constant():
            spec_constant = self.visitSpec_constant(ctx.spec_constant())
            sort, _ = self._well_sorted_term(spec_constant, [], local_vars)
            return Const(name=spec_constant, sort=sort)
        elif ctx.qual_identifier():
            id_, sort = self.visitQual_identifier(ctx.qual_identifier())
            qual_id = True if sort else False
            subterms = None
            if ctx.ParOpen(): 
                subterms = []
                input_list = []
                for term_ctx in ctx.term():
                    subterm = self.visitTerm(term_ctx, local_vars)
                    # x occurs free in some e_i
                    subterms.append(subterm)
                    input_list.append(subterm.sort)
                    # bound vars will be updated by binders
                if not sort:
                    sort, _ = self._well_sorted_term(id_, input_list, local_vars)
                return Expr(
                            name=id_,
                            subterms=subterms,
                            sort=sort,
                            qual_id=qual_id,
                        )
            else:
                rsort, scope_type = self._well_sorted_term(id_, [], local_vars)
                if not sort:
                    sort = rsort
                if scope_type == TermScopeType.LOCAL_VAR:
                    return Var(name=id_, sort=sort, qual_id=qual_id, global_free=False)
                if scope_type == TermScopeType.GLOBAL_VAR:
                    return Var(name=id_, sort=sort, qual_id=qual_id, global_free=True)
                else:
                    return Expr(name=id_, subterms=[], sort=sort, qual_id=qual_id)
        elif ctx.GRW_Let():
            var_bindings = []
            var_list = []
            terms_local_free_vars_list = []
            # _local_vars for let_term
            _local_vars = copy.deepcopy(local_vars)
            for vb_ctx in ctx.var_binding():
                x, t = self.visitVar_binding(vb_ctx, local_vars)
                var_bindings.append([x, t])
                terms_local_free_vars_list.append(t.local_free_vars)
                var_list.append(x)
                # x is local var in let_term
                _local_vars[x] = t.sort 
            bound_vars = copy.deepcopy(_local_vars)
            let_term = self.visitTerm(ctx.term(0), _local_vars)
            let_term.update_bound_vars(bound_vars)
            local_free_vars = copy.deepcopy(let_term.local_free_vars)
            # any local free var x in t, and not in x_1, ..., x_n
            # x occurs free in the entire expression
            for var in var_list:
                if var in local_free_vars:
                    del local_free_vars[var]
            # any local free var x in t_i, and corresponding x_i occurs free in let_term
            # x occurs free in the entire expression
            for i, free_vars in enumerate(terms_local_free_vars_list):
                if var_list[i] in let_term.local_free_vars:
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
                            ctx.GRW_Forall().getText(),
                            local_vars
                        )
        elif ctx.GRW_Exists():
            return self._handle_quantifier(
                            ctx,
                            ctx.GRW_Exists().getText(),
                            local_vars
                        )
        elif ctx.GRW_Match():
            term = self.visitTerm(ctx.term(0), local_vars)
            # local_free_vars for entire match term
            local_free_vars = copy.deepcopy(term.local_free_vars)
            # get output sort and its parameters mapping
            output = term.output
            par_dict = self._get_par_dict_from_sort(output)
            match_cases = []
            for mc_ctx in ctx.match_case():
                p, t = self.visitMatch_case(
                    mc_ctx,
                    output=output,
                    par_dict=par_dict,
                    local_vars=local_vars
                )
                match_cases.append([p, t])
                # update local_free_vars for entire match term
                for var, sort in t.local_free_vars.items():
                    if var not in p.var_list:
                        local_free_vars[var] = sort
                
            return Match(
                term=term,
                match_cases=match_cases,
                sort=match_cases[0][1].sort, # t.sort
                local_free_vars=local_free_vars,
            )

        elif ctx.GRW_Exclamation():
            term = self.visitTerm(ctx.term(0), local_vars)
            annotations = []
            for attr_ctx in ctx.attribute():
                annotations.append(self._get_object(attr_ctx))
            return AnnotatedTerm(
                term=term, annotations=annotations, sort=term.sort
            )
    
    def _handle_quantifier(
            self,
            ctx: SMTLIBv2Parser.TermContext,
            quant,
            local_vars
    ):
        quanted_vars = []
        # local_vars for quant_term
        _local_vars = copy.deepcopy(local_vars)
        for sv_ctx in ctx.sorted_var():
            var, sort = self.visitSorted_var(sv_ctx)
            quanted_vars.append([var, sort])
            _local_vars[var] = sort 

        bound_vars = copy.deepcopy(_local_vars)
        quant_term = self.visitTerm(ctx.term(0), _local_vars)
        quant_term.update_bound_vars(bound_vars)
        # local free vars for the entier expression 
        # if occurs free in t
        local_free_vars = copy.deepcopy(quant_term.local_free_vars)
        # and does not occur in x_1, ..., x_n
        for var, _ in quanted_vars:
            if var in local_free_vars:
                del local_free_vars[var]
        self.quant_count += 1 
        return Quantifier(
                name=f'Q{self.quant_count}',
                quantifier=quant,
                sorted_vars=quanted_vars,
                quantified_term=quant_term,
                sort=quant_term.sort,
                local_free_vars=local_free_vars,
            )

    def _get_sort_in_synonym(self, symbol: str, pars: list):
        sort = get_sort_in_synonym(symbol, pars, self.synonyms)
        if sort:
            return sort
        sort = get_sort_in_synonym(symbol, pars, all_synonyms)
        if sort:
            return sort
        return None 
 
    def _get_par_dict_from_sort(self, sort):
        """
        get dict of parameters from an adt instance
        """
        parsorts = sort.parsorts
        if isinstance(parsorts, list) and (len(parsorts) > 0):
            par_dict = {}
            name = sort.id_
            if str(name) in self.datatypes:
                sort_template = self.datatypes(str(name))
                if len(sort_template.parsorts) == len(parsorts):
                    for i, par in enumerate(sort_template.parsorts):
                        par_dict[par] = parsorts[i]
                    return par_dict
            raise ScriptException(f"datatype '{sort}' not found")
        else:
            # not a parametric sort
            return {}
    
    def _is_valid_sort(self, symbol: str, sort):
        if symbol in self.datatypes:
            if sort.same_type(self.datatypes[symbol]):
                return True
        if symbol in all_sorts:
            if sort.same_type(all_sorts[symbol]):
                return True
        return False

    def _valid_pattern(self, name, inputs_len, output, par_dict):
        """
        A pttern p in turn is either:
        - a variable x of sort (output)
        - a nullary constructor c of sort (output)
        - a term of the form (c x_1 ... x_k) where c is a constructor of sort (output)

        :returns: input sort list if p is a constructor else None 
        """
        adt_name = str(output.id_)
        if adt_name in self.datatypes:
            adt = self.datatypes[adt_name]
            if name in adt.constructors:
            # constructor
                constructor = adt.constructors[name]
                return constructor.get_parametric_inputs(par_dict)
        elif inputs_len == 0:
            # variable
            return None 
        else:
            raise ScriptException("pattern is neither a variable nor a valid constructor")

    def _well_sorted_term(self, name, input_list=None, local_vars=None):
        """
        :returns: sort, scope type of this term
        """
        # scope
        # local vars
        if (str(name) in local_vars) and (input_list == []):
            return local_vars[str(name)], TermScopeType.LOCAL_VAR 
        # global vars
        if (str(name) in self.global_vars) and (input_list == []):
            return self.global_vars[str(name)], TermScopeType.GLOBAL_VAR 
        # global signatures
        fun_output = match_fun_in_signatures(name, input_list, self.signatures)
        if fun_output:
            return fun_output, TermScopeType.GLOBAL_SIG 
        # predefined signatures
        fun_output = match_fun_in_signatures(name, input_list, all_funs)
        if fun_output:
            return fun_output, TermScopeType.PREDEF_SIG 
        # support more functions
        return UNKNOWN, TermScopeType.PREDEF_SIG 
