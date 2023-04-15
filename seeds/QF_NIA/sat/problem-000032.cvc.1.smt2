(set-info :smt-lib-version 2.6)
(set-logic QF_NIA)
(set-info :source |
    Sequential equivalence checking.
    Calypto Design Systems, Inc. <www.calypto.com>
  |)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun P_2 () Int)
(declare-fun P_3 () Int)
(declare-fun P_4 () Int)
(declare-fun P_5 () Int)
(declare-fun P_6 () Int)
(declare-fun P_7 () Int)
(declare-fun P_8 () Int)
(declare-fun P_9 () Bool)
(declare-fun P_10 () Int)
(declare-fun mux_I_382591 () Int)
(declare-fun mux_I_382626 () Int)
(declare-fun mux_I_382607 () Int)
(assert (<= 0 P_2))
(assert (<= P_2 43))
(assert (<= 0 P_3))
(assert (<= P_3 1073741760))
(assert (<= 0 P_4))
(assert (<= P_4 3))
(assert (<= 0 P_5))
(assert (<= P_5 3))
(assert (<= 0 P_6))
(assert (<= P_6 3848290795520))
(assert (<= 0 P_7))
(assert (<= P_7 15))
(assert (<= 0 P_8))
(assert (<= P_8 67108860))
(assert (<= 0 P_10))
(assert (<= P_10 15))
(assert (<= 0 mux_I_382591))
(assert (<= mux_I_382591 4398046511103))
(assert (<= 0 mux_I_382626))
(assert (<= mux_I_382626 1073741823))
(assert (<= (* 16 (- 1)) mux_I_382607))
(assert (<= mux_I_382607 15))
(declare-fun dz () Int)
(declare-fun rz () Bool)
(assert (let ((?v_0 (+ 4 P_5))) (let ((?v_1 (ite (< ?v_0 4) ?v_0 (- ?v_0 8)))) (let ((?v_3 (+ 8388608 (+ (* P_4 2097152) (ite (>= ?v_1 0) ?v_1 (+ ?v_1 2097152))))) (?v_2 (+ (ite P_9 16 0) P_10))) (let ((?v_4 (< (+ (+ (+ (+ mux_I_382626 (* (* ?v_3 (* 3 (- 1))) 64)) P_6) (* mux_I_382607 P_8)) (+ (* (* (ite (< ?v_2 16) ?v_2 (- ?v_2 32)) ?v_3) 4) 0)) 0))) (= (+ (* 2 dz) 1) (- (ite (and (not (= mux_I_382591 0)) ?v_4) 1 0) (ite ?v_4 1 0))))))))
(check-sat)
(exit)