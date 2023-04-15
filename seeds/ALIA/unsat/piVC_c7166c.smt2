(set-info :smt-lib-version 2.6)
(set-logic ALIA)
(set-info :source |piVC|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun V_7 () Int)
(declare-fun u () Int)
(declare-fun l () Int)
(declare-fun e () Int)
(declare-fun a () (Array Int Int))
(declare-fun ix () Int)
(declare-fun t_2 () Bool)
(declare-fun t_1 () Int)
(assert (let ((?v_1 (<= 0 l)) (?v_2 (< u V_7)) (?v_3 (>= V_7 0)) (?v_4 (not t_2)) (?v_0 (select a t_1))) (and (and (and (and ?v_1 (and ?v_2 (forall ((?V_12 Int)) (=> (and (<= 0 ?V_12) (<= ?V_12 (- V_7 1))) (forall ((?V_13 Int)) (=> (and (<= 0 ?V_13) (<= ?V_13 ?V_12)) (<= (select a ?V_13) (select a ?V_12)))))))) ?v_3) (and (and (or t_2 (forall ((?V_11 Int)) (=> (and (<= l ?V_11) (<= ?V_11 (- t_1 1))) (not (= (select a ?V_11) e))))) (or ?v_4 (exists ((?V_10 Int)) (and (and (<= l ?V_10) (<= ?V_10 (- t_1 1))) (= (select a ?V_10) e))))) (and (>= ?v_0 e) (and (not (= ?v_0 e)) (and (and (<= l t_1) (<= t_1 u)) (and (<= l u) (and (and ?v_1 (and ?v_2 (forall ((?V_8 Int)) (=> (and (<= 0 ?V_8) (<= ?V_8 (- V_7 1))) (forall ((?V_9 Int)) (=> (and (<= 0 ?V_9) (<= ?V_9 ?V_8)) (<= (select a ?V_9) (select a ?V_8)))))))) ?v_3))))))) (or (and ?v_4 (exists ((?V_6 Int)) (and (and (<= l ?V_6) (<= ?V_6 u)) (= (select a ?V_6) e)))) (and t_2 (forall ((?V_5 Int)) (=> (and (<= l ?V_5) (<= ?V_5 u)) (not (= (select a ?V_5) e)))))))))
(check-sat)
(exit)