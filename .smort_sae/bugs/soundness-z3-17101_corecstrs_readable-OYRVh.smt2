(set-logic ALL)
(declare-fun seed0_T_1 () Bool)
(declare-fun seed0_var_0xINPUT_136330 () String)
(assert (and (or (= seed0_T_1 (= "-" seed0_var_0xINPUT_136330)) (or (str.suffixof (str.++ seed0_var_0xINPUT_136330 "BUSj4vzrnbG95ZKa") (str.++ seed0_var_0xINPUT_136330 "eTSfryEWpgbN7A25")) (str.contains (str.++ seed0_var_0xINPUT_136330 "sSfuTLAmP6") (str.++ seed0_var_0xINPUT_136330 "Q7EdO8")))) (or seed0_T_1 (=> (str.prefixof (str.++ seed0_var_0xINPUT_136330 "WmBSHM56z1N") (str.++ seed0_var_0xINPUT_136330 "7Oat")) (str.prefixof (str.++ seed0_var_0xINPUT_136330 "3u") (str.++ seed0_var_0xINPUT_136330 "DsJ"))))))
(check-sat)
(exit)