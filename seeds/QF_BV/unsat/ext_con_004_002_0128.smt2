(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source | Generated by Roberto Bruttomesso |)
(set-info :category "crafted")
(set-info :status unsat)
(declare-fun a () (_ BitVec 128))
(declare-fun dummy1 () (_ BitVec 16))
(declare-fun dummy2 () (_ BitVec 16))
(declare-fun v1 () (_ BitVec 128))
(declare-fun v2 () (_ BitVec 128))
(declare-fun v3 () (_ BitVec 128))
(declare-fun v4 () (_ BitVec 128))
(assert (let ((?v_0 ((_ extract 63 16) a)) (?v_1 ((_ extract 47 0) a)) (?v_2 ((_ extract 127 80) a)) (?v_3 ((_ extract 111 64) a))) (and (or (not (= ((_ extract 47 32) v1) ((_ extract 31 16) v1))) (not (= ((_ extract 111 96) v1) ((_ extract 95 80) v1)))) (or (not (= ((_ extract 47 32) v2) ((_ extract 31 16) v2))) (not (= ((_ extract 111 96) v2) ((_ extract 95 80) v2)))) (or (not (= ((_ extract 47 32) v3) ((_ extract 31 16) v3))) (not (= ((_ extract 111 96) v3) ((_ extract 95 80) v3)))) (or (not (= ((_ extract 47 32) v4) ((_ extract 31 16) v4))) (not (= ((_ extract 111 96) v4) ((_ extract 95 80) v4)))) (or (and (and (= ?v_0 (concat ((_ extract 63 32) v1) dummy1)) (= ?v_1 (concat dummy1 ((_ extract 31 0) v1)))) (and (= ?v_2 (concat ((_ extract 127 96) v1) dummy2)) (= ?v_3 (concat dummy2 ((_ extract 95 64) v1))))) (and (and (= ?v_0 (concat ((_ extract 63 32) v2) dummy1)) (= ?v_1 (concat dummy1 ((_ extract 31 0) v2)))) (and (= ?v_2 (concat ((_ extract 127 96) v2) dummy2)) (= ?v_3 (concat dummy2 ((_ extract 95 64) v2))))) (and (and (= ?v_0 (concat ((_ extract 63 32) v3) dummy1)) (= ?v_1 (concat dummy1 ((_ extract 31 0) v3)))) (and (= ?v_2 (concat ((_ extract 127 96) v3) dummy2)) (= ?v_3 (concat dummy2 ((_ extract 95 64) v3))))) (and (and (= ?v_0 (concat ((_ extract 63 32) v4) dummy1)) (= ?v_1 (concat dummy1 ((_ extract 31 0) v4)))) (and (= ?v_2 (concat ((_ extract 127 96) v4) dummy2)) (= ?v_3 (concat dummy2 ((_ extract 95 64) v4)))))))))
(check-sat)
(exit)