(set-logic ALL)
(declare-fun seed0_T_1 () Bool)
(declare-fun seed0_var_0xINPUT_180686 () String)
(assert (and (or (= seed0_T_1 (= "-" seed0_var_0xINPUT_180686)) (and (str.prefixof (str.++ seed0_var_0xINPUT_180686 "T7sz") (str.++ seed0_var_0xINPUT_180686 "WDTfchx9")) (str.prefixof (str.++ seed0_var_0xINPUT_180686 "5dm7s4Nf2ov6kzFCYHQj") (str.++ seed0_var_0xINPUT_180686 "QSZ7ECbPgxoVu4")))) (or seed0_T_1 (=> (str.contains (str.++ seed0_var_0xINPUT_180686 "g6YcNLzEZX3MIjA5wvoB") (str.++ seed0_var_0xINPUT_180686 "1idL5a0OG7mK")) (str.contains (str.++ seed0_var_0xINPUT_180686 "03mpOKHFqX6oB") (str.++ seed0_var_0xINPUT_180686 "mize"))))))
(check-sat)
(exit)