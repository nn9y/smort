(set-logic ALL)
(declare-const z_random0_0 String)
(declare-const z_random0_1 String)
(declare-const z_random0_2 String)
(declare-const z_random0_3 String)
(declare-const z_random1_0 String)
(declare-const z_random1_1 String)
(declare-const z_random1_2 String)
(declare-const z_random1_3 String)
(declare-const z_random1_4 String)
(declare-const z_random1_5 String)
(declare-const z_random1_6 String)
(declare-const z_random1_7 String)
(declare-fun seed0_x () String)
(declare-fun seed1_x () String)
(assert (and (and (not (= (str.in_re (str.substr z_random0_3 0 (str.indexof z_random0_3 (str.++ "A" "A") (str.len seed0_x))) (re.++ (re.* re.allchar ) re.allchar  (re.* re.allchar ) (str.to_re "B") (re.* re.allchar ) (str.to_re (str.++ "B" (str.substr z_random1_2 0 (str.len (str.++ "A" "C"))))) (re.* re.allchar ))) (str.in_re seed0_x (re.++ (re.* re.allchar ) re.allchar  (re.* re.allchar ) re.allchar  (re.* re.allchar ) (str.to_re (str.++ "C" (str.++ "A" (str.substr z_random1_3 0 (str.len (str.++ "A" "B")))))) (re.* re.allchar ))))) (not (= (str.in_re (str.substr z_random1_0 0 (str.len seed0_x)) (re.++ (re.* re.allchar ) re.allchar  (re.* re.allchar ) (str.to_re (str.++ "B" (str.++ "C" (str.substr z_random1_7 0 (str.len (str.++ "A" "C")))))) (re.* re.allchar ) re.allchar  (re.* re.allchar ))) (str.in_re (str.substr z_random0_1 0 (str.indexof z_random0_1 seed1_x (str.len seed0_x))) (re.++ (re.* re.allchar ) re.allchar  (re.* re.allchar ) re.allchar  (re.* re.allchar ) (str.to_re (str.++ "A" (str.++ "B" (str.substr z_random1_4 0 (str.len (str.++ "B" "A")))))) (re.* re.allchar )))))) (and (not (= (str.in_re seed1_x (re.++ (re.* re.allchar ) re.allchar  (re.* re.allchar ) re.allchar  (re.* re.allchar ) (str.to_re (str.++ "C" (str.++ "B" (str.substr z_random1_3 (str.indexof z_random1_3 (str.++ "A" "C") (str.len (str.++ "A" "B"))) (str.len (str.++ "A" "C")))))) (re.* re.allchar ))) (str.in_re (str.substr z_random1_7 (str.indexof z_random1_7 seed1_x (str.len (str.++ "A" "C"))) (str.len seed1_x)) (re.++ (re.* re.allchar ) re.allchar  (re.* re.allchar ) re.allchar  (re.* re.allchar ) (str.to_re (str.++ "B" (str.++ "B" (str.substr z_random1_4 (str.indexof z_random1_4 (str.++ "B" "C") (str.len (str.++ "B" "A"))) (str.len (str.++ "B" "C")))))) (re.* re.allchar ))))) (not (= (str.in_re (str.substr z_random0_1 (str.len seed0_x) (str.len seed1_x)) (re.++ (re.* re.allchar ) re.allchar  (re.* re.allchar ) (str.to_re (str.++ "C" (str.substr z_random1_5 (str.indexof z_random1_5 (str.++ "B" "A") (str.len (str.++ "A" "C"))) (str.len (str.++ "B" "A"))))) (re.* re.allchar ) (str.to_re "A") (re.* re.allchar ))) (str.in_re seed1_x (re.++ (re.* re.allchar ) re.allchar  (re.* re.allchar ) (str.to_re "C") (re.* re.allchar ) (str.to_re (str.++ "B" (str.substr z_random1_6 (str.indexof z_random1_6 (str.++ "A" "A") (str.len (str.++ "A" "C"))) (str.len (str.++ "A" "A"))))) (re.* re.allchar ))))))))
(check-sat)
(exit)