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
(declare-fun P_4 () Bool)
(declare-fun P_5 () Bool)
(declare-fun P_6 () Bool)
(declare-fun P_7 () Bool)
(declare-fun P_8 () Bool)
(declare-fun P_9 () Bool)
(declare-fun P_10 () Bool)
(declare-fun P_11 () Bool)
(declare-fun P_12 () Bool)
(declare-fun P_13 () Bool)
(declare-fun P_14 () Bool)
(declare-fun P_15 () Bool)
(declare-fun P_16 () Bool)
(declare-fun P_17 () Bool)
(declare-fun P_18 () Bool)
(declare-fun P_19 () Bool)
(declare-fun P_20 () Bool)
(declare-fun P_21 () Bool)
(declare-fun P_22 () Bool)
(declare-fun P_23 () Bool)
(declare-fun P_24 () Bool)
(declare-fun P_25 () Bool)
(declare-fun P_26 () Int)
(declare-fun P_27 () Int)
(declare-fun P_28 () Int)
(declare-fun P_29 () Int)
(declare-fun P_30 () Int)
(declare-fun P_31 () Bool)
(declare-fun P_32 () Bool)
(declare-fun P_33 () Bool)
(declare-fun P_34 () Bool)
(declare-fun P_35 () Bool)
(declare-fun P_36 () Bool)
(declare-fun P_37 () Bool)
(declare-fun P_38 () Bool)
(declare-fun P_39 () Bool)
(declare-fun P_40 () Bool)
(declare-fun P_41 () Bool)
(declare-fun P_42 () Bool)
(declare-fun P_43 () Bool)
(declare-fun P_44 () Bool)
(declare-fun P_45 () Bool)
(declare-fun P_46 () Bool)
(declare-fun P_47 () Int)
(declare-fun P_48 () Int)
(assert (<= (* 2 (- 1)) P_2))
(assert (<= P_2 1))
(assert (<= 0 P_3))
(assert (<= P_3 7))
(assert (<= 0 P_26))
(assert (<= P_26 7))
(assert (<= 0 P_27))
(assert (<= P_27 511))
(assert (<= 0 P_28))
(assert (<= P_28 511))
(assert (<= 0 P_29))
(assert (<= P_29 1023))
(assert (<= 0 P_30))
(assert (<= P_30 3))
(assert (<= 0 P_47))
(assert (<= P_47 127))
(assert (<= 0 P_48))
(assert (<= P_48 127))
(declare-fun dz () Int)
(declare-fun rz () Int)
(assert (let ((?v_0 (+ (ite P_22 2 0) (ite P_23 1 0))) (?v_1 (not P_21))) (let ((?v_6 (not (or (or (or (or (< P_2 0) (< (ite (< P_3 4) P_3 (- P_3 8)) 0)) (and (and (and (and P_4 P_5) (and P_6 P_7)) (and (and P_8 P_9) (and P_10 P_11))) (and (and (and P_12 P_13) (and P_14 P_15)) (and (and P_16 P_17) (and P_18 P_19))))) (not P_20)) (not (ite ?v_1 (ite (= ?v_0 0) false (ite (= ?v_0 1) P_24 (ite (= ?v_0 2) P_25 false))) false))))) (?v_2 (ite (= P_26 0) 1 (ite (= P_26 1) 2 (ite (ite (= P_26 2) false (ite (= P_26 3) false (ite (= P_26 4) false (ite (= P_26 5) false (ite (= P_26 6) false false))))) 1 0))))) (let ((?v_4 (not (< (ite (< ?v_2 2) ?v_2 (- ?v_2 4)) 0)))) (let ((?v_3 (ite ?v_4 P_27 P_28))) (let ((?v_7 (ite (< ?v_3 256) ?v_3 (- ?v_3 512))) (?v_8 (* P_30 256))) (let ((?v_5 (ite ?v_4 P_29 (+ ?v_8 P_48))) (?v_9 (ite ?v_4 P_29 (+ ?v_8 (ite (not (not (and (not P_31) (and (not P_32) (and (not P_33) (and (not P_34) (and (not P_35) (and (not P_36) (and (not P_37) (and (not P_38) (and (not P_39) (and (not P_40) (and (not P_41) (and (not P_42) (and (not P_43) (and (not P_44) (and (not P_45) (not P_46)))))))))))))))))) P_47 P_48))))) (= (+ (* 524288 dz) rz) (- (ite (not ?v_6) 0 (ite ?v_1 (* ?v_7 (ite (< ?v_5 512) ?v_5 (- ?v_5 1024))) 0)) (ite ?v_6 (* ?v_7 (ite (< ?v_9 512) ?v_9 (- ?v_9 1024))) 0))))))))))
(assert (> rz 0))
(assert (< rz 524288))
(check-sat)
(exit)