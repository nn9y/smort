(set-logic ALL)
(declare-fun seed0_T_1 () Bool)
(declare-fun seed0_var_0xINPUT_47251 () String)
(assert (and (or (= seed0_T_1 (= "-" seed0_var_0xINPUT_47251)) (xor (str.contains (str.++ seed0_var_0xINPUT_47251 "4VZ6I") (str.++ seed0_var_0xINPUT_47251 "Ws6")) (str.prefixof (str.++ seed0_var_0xINPUT_47251 "S7MWhz91nvfjYrg") (str.++ seed0_var_0xINPUT_47251 "QZ1p8F")))) (or seed0_T_1 (str.contains (str.++ seed0_var_0xINPUT_47251 "") (str.++ seed0_var_0xINPUT_47251 "")))))
(check-sat)
(exit)