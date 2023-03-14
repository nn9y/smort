from SMTLIBv2Parser import SMTLIBv2Parser
from SMTLIBv2Visitor import SMTLIBv2Visitor
from Script import *
from SMTMR.src.translate.Ast import *
from SMTMR.src.translate.smtlibv2.theory.logic import *

# from yinyang.src.parsing.Types import (
#     BITVECTOR_TYPE,
#     INTEGER_TYPE,
#     REAL_TYPE,
#     STRING_TYPE,
#     BOOLEAN_TYPE,
#     REGEXP_TYPE,
#     sort2type,
# )


class ScriptException(Exception):
    pass


class ScriptVisitor(SMTLIBv2Visitor):
    def __init__(self, strict=True):
        self.strict = strict
        self.global_vars = {}

    def visitStart(self, ctx: SMTLIBv2Parser.StartContext):
        return self.visitScript(ctx.script())

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
    
    def visitProp_literal(self, ctx:SMTLIBv2Parser.Prop_literalContext):
        symbol = self.visitSymbol(ctx.symbol())
        return PropLiteral(symbol, True) if ctx.PS_Not() else PropLiteral(symbol)

    def visitScript(self, ctx: SMTLIBv2Parser.ScriptContext):
        cmds = []
        for cmd_ctx in ctx.command():
            cmds.append(self.visitCommand(cmd_ctx))
        return Script(cmds, self.global_vars)

    def _add_to_globals(self, name, input_list, output):
        self.global_vars[str(name)] = Fun(Identifier(str(name)), input_list, output)

    def handleCommand(self, ctx: SMTLIBv2Parser.CommandContext):
        if ctx.cmd_assert():
            return self.visitCmd_assert(ctx.cmd_assert())
        if ctx.cmd_checkSat():
            return CheckSat() 
        if ctx.cmd_checkSatAssuming():
            return self.visitCmd_checkSatAssuming(ctx.cmd_checkSatAssuming())
        if ctx.cmd_declareConst():
            return self.visitCmd_declareConst(ctx.cmd_declareConst())
            # var = self.visitSymbol(ctx.symbol()[0])
            # self.global_vars[var] = self.visitSort(ctx.sort()[0])
            # decl = DeclareConst(
            #     self.visitSymbol(ctx.symbol()[0]),
            #     sort2type(self.visitSort(ctx.sort()[0]))
            # )
            # return decl
        # TODO
        # declareDatatype
        # declareDatatypes
        if ctx.cmd_declareFun():
            return self.visitCmd_declareFun(ctx.cmd_declareFun())
        # TODO
        # declareSort
        if ctx.cmd_defineFun():
            return self.visitCmd_defineFun(ctx.cmd_defineFun())
        if ctx.cmd_defineFunRec():
            return self.visitCmd_defineFunRec(ctx.cmd_defineFunRec())
        if ctx.cmd_defineFunsRec():
            return self.visitCmd_defineFunsRec(ctx.cmd_defineFunsRec())
        # TODO
        # defineSort
        # ...
        # getUnsatCore
        if ctx.cmd_getValue():
            return self.visitCmd_getValue(ctx.cmd_getValue())
        if ctx.cmd_push():
            return self.visitCmd_push(ctx.cmd_push())
        if ctx.cmd_pop():
            return self.visitCmd_pop(ctx.cmd_pop())
        # TODO
        # reset
        # ...
        # setOption

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
        """
        pattern
            : symbol
            | ParOpen symbol symbol+ ParClose
            ;
        """
        # TODO
        # add symbols to local_vars?
        return [self.visitSymbol(sym_ctx) for sym_ctx in ctx.symbol()]
    
    def visitMatch_case(self, ctx: SMTLIBv2Parser.Match_caseContext, local_vars):
        return [self.visitPattern(ctx.pattern()), self.visitTerm(ctx.term(), local_vars)]

    def getString(self, ctx):
        start, stop = ctx.start.start, ctx.stop.stop
        return ctx.start.getInputStream().getText(start, stop)
    
    def visitCmd_assert(self, ctx:SMTLIBv2Parser.Cmd_assertContext):
        return Assert(self.visitTerm(ctx.term()))
    
    def visitCmd_checkSatAssuming(self, ctx:SMTLIBv2Parser.Cmd_checkSatAssumingContext):
        prop_literals = []
        for pl_ctx in ctx.prop_literal():
            prop_literals.append(self.visitProp_literal(pl_ctx))
        return CheckSatAssuming(prop_literals)
    
    def visitCmd_declareConst(self, ctx:SMTLIBv2Parser.Cmd_declareConstContext):
        var = self.visitSymbol(ctx.symbol())
        sort = self.visitSort(ctx.sort())

        self._add_to_globals(var, [], sort)

        return DeclareConst(var, sort)

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
            terms.append(self.visitTerm(term_ctx))
        # '_add_to_globals()' called in 'visitFunction_dec()'
        return DefineFunsRec(fun_decls, terms)
    
    def visitCmd_getValue(self, ctx:SMTLIBv2Parser.Cmd_getValueContext):
        terms = []
        for term_ctx in ctx.term():
            terms.append(self.visitTerm(term_ctx))
        return GetValue(terms)
    
    def visitCmd_pop(self, ctx:SMTLIBv2Parser.Cmd_popContext):
        levels = int(ctx.numeral().getText())
        return Pop(levels)

    def visitCmd_push(self, ctx:SMTLIBv2Parser.Cmd_pushContext):
        levels = ctx.numeral().getText()
        return Push(levels)

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
        #return (ctx.keyword().getText(), ctx.attribute_value().getText())

    def visitSpec_constant(self, ctx: SMTLIBv2Parser.Spec_constantContext):
        if ctx.Numeral():
            return SpecConstant(SpecConstType.NUMERAL, int(ctx.Numeral().getText()))
        elif ctx.Decimal():
            return SpecConstant(SpecConstType.DECIMAL, float(ctx.Decimal().getText()))
        elif ctx.HexDecimal():
            # number_of_digits = len(ctx.HexDecimal().getText()) - 2
            # int(ctx.HexDecimal().getText().replace('#', '0'), 16)
            return SpecConstant(SpecConstType.HEXDECIMAL, ctx.HexDecimal().getText())
        elif ctx.Binary():
            # number_of_digits = len(ctx.HexDecimal().getText()) - 2
            # int(ctx.Binary().getText().replace('#', '0'), 2)
            return SpecConstant(SpecConstType.BINARY, ctx.Binary().getText())
        elif ctx.String():
            return SpecConstant(SpecConstType.STRING, ctx.String().getText())
        else:
            return SpecConstant(
                SpecConstType.B_VALUE,
                True if ctx.b_value().getText() == "true" else False
            ) 
       # if ctx.ParOpen():
        #     X, n = (
        #         ctx.numeral()[0].getText(),
        #         ctx.numeral()[1].getText().encode("utf-8").decode("utf-8")
        #     )
        #     return "(_ bv" + X + " " + n + ")", BITVECTOR_TYPE(int(n))
        # if ctx.numeral():
        #     return ctx.getText().encode("utf-8").decode("utf-8"), INTEGER_TYPE
        # if ctx.decimal():
        #     return ctx.getText().encode("utf-8").decode("utf-8"), REAL_TYPE
        # if ctx.hexadecimal():
        #     return ctx.getText().encode("utf-8").decode("utf-8"), INTEGER_TYPE
        # if ctx.binary():
        #     return ctx.getText().encode("utf-8").decode("utf-8"), INTEGER_TYPE
        # if ctx.string():
        #     return ctx.getText().encode("utf-8").decode("utf-8"), STRING_TYPE
        # if ctx.b_value():
        #     return ctx.getText().encode("utf-8").decode("utf-8"), BOOLEAN_TYPE
        # if ctx.reg_const():
        #     return ctx.getText().encode("utf-8").decode("utf-8"), REGEXP_TYPE

    def visitTerm(self, ctx: SMTLIBv2Parser.TermContext, local_vars):
        # TODO
        # check if 'local_vars' bound correct?
        if ctx.spec_constant():
            spec_constant = self.visitSpec_constant(ctx.spec_constant())
            fun = self._check_valid_term(spec_constant, [], None, local_vars)
            return Const(name=spec_constant, sort=fun.output)
        elif ctx.qual_identifier():
            id_, sort = self.visitQual_identifier(ctx.qual_identifier())
            subterms = None
            if ctx.ParOpen(): 
                subterms = []
                input_list = []
                for term_ctx in ctx.term():
                    subterm = self.visitTerm(term_ctx, local_vars)
                    subterms.appen(subterm)
                    input_list.append(subterm.sort)
                fun = self._check_valid_term(id_, input_list, sort, local_vars)
                return Expr(name=id_, subterms=subterms, sort=fun.output)
            else:
                fun = self._check_valid_term(id_, [], sort, local_vars)
                return Var(name=id_, sort=fun.output)
        elif ctx.GRW_Let():
            var_bindings = []
            var_list = []
            for vb_ctx in ctx.var_binding():
                var, term = self.visitVar_binding(vb_ctx)
                var_list.append(var)
                var_bindings.append([var, term])
            for var in var_list:
                local_vars[str(var)] = None
            let_term = self.visitTerm(ctx.term(), local_vars)
            return LetBinding(var_bindings=var_bindings, let_term=let_term, sort=let_term.sort)
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
            match_cases = []
            for mc_ctx in ctx.match_case():
                match_cases.append(self.visitMatch_case(mc_ctx))
            # TODO
            # check if all terms in match_cases have same sort?
            return Match(term=term, match_cases=match_cases, sort=match_cases[0][1].sort)
        elif ctx.GRW_Exclamation():
            term = self.visitTerm(ctx.term())
            annotations = []
            for attr_ctx in ctx.attribute():
                annotations.append(self._get_object(attr_ctx))
            return AnnotatedTerm(term=term, annotations=annotations, sort=term.sort)

    def visitSymbol(self, ctx: SMTLIBv2Parser.SymbolContext):
        return ctx.getChild(0).getText()
 
    def visitIdentifier(self, ctx: SMTLIBv2Parser.IdentifierContext):
        symbol = self.visitSymbol(ctx.symbol())
        indices = []
        if ctx.GRW_Underscore():
            for index_ctx in ctx.index():
                indices.append(self.visitIndex(index_ctx))
        return Identifier(symbol, indices)

    def visitSort(self, ctx: SMTLIBv2Parser.SortContext):
        id_ = self.visitIdentifier(ctx.identifier())
        subsorts = []
        if ctx.ParOpen():
            for sort_ctx in ctx.sort():
                subsorts.append(self.visitSort(sort_ctx))
        return Sort(id_, subsorts)
    
    def _handle_quantifier(
            self,
            ctx: SMTLIBv2Parser.TermContext,
            quant,
            local_vars
    ):
        quant_vars = []
        for sv_ctx in ctx.sorted_var():
            var, sort = self.visitSorted_var(sv_ctx)
            quant_vars.append([var, sort])

            local_vars[str(var)] = Fun(Identifier(str(var)), [], sort)

        quant_term = self.visitTerm(ctx.term(), local_vars)
        return Quantifier(
                Quantifier=quant,
                quantified_vars=quant_vars,
                quantified_term=quant_term,
                sort=quant_term.sort
            )

    def _check_valid_term(self, op, input_list=[], output=None, local_vars = {}):
        fun = get_fun_in_theories(op, input_list)
        if fun:
            if output and output != fun.output:
                raise ScriptException(f"sort declared: '{output}' does not match output sort in theories: '{fun.output}'")
            return fun
        if str(op) in self.global_vars:
            return self.global_vars[str(op)]
        if str(op) in local_vars:
            return local_vars[str(op)]
        raise ScriptException(f"({op} {list2str(input_list)}) not in theories")
