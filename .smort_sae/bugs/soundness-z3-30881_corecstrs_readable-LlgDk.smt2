(set-logic ALL)
(declare-fun seed0_T_1 () Int)
(declare-fun seed0_T_2 () Bool)
(declare-fun seed0_var_0xINPUT_364698 () String)
(assert (and (or (>= seed0_T_1 (str.len seed0_var_0xINPUT_364698)) (xor (> (mod seed0_T_1 seed0_T_1) (- seed0_T_1 (- 197))) (>= (div seed0_T_1 seed0_T_1) (+ seed0_T_1 5)))) (or (= seed0_T_2 (= seed0_T_1 0)) (and (str.suffixof (str.++ seed0_var_0xINPUT_364698 "tFoMn") (str.++ seed0_var_0xINPUT_364698 "8ZpIhTXm")) (str.suffixof (str.++ seed0_var_0xINPUT_364698 "7VO") (str.++ seed0_var_0xINPUT_364698 "3fcTQNz6SKEPaD0eV")))) (or seed0_T_2 (or (distinct (div seed0_T_1 seed0_T_1) (+ seed0_T_1 724)) (distinct (div seed0_T_1 seed0_T_1) (+ seed0_T_1 268))))))
(check-sat)
(exit)