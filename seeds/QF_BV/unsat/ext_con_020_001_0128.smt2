(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source | Generated by Roberto Bruttomesso |)
(set-info :category "crafted")
(set-info :status unsat)
(declare-fun a () (_ BitVec 128))
(declare-fun dummy () (_ BitVec 32))
(declare-fun v1 () (_ BitVec 128))
(declare-fun v2 () (_ BitVec 128))
(declare-fun v3 () (_ BitVec 128))
(declare-fun v4 () (_ BitVec 128))
(declare-fun v5 () (_ BitVec 128))
(declare-fun v6 () (_ BitVec 128))
(declare-fun v7 () (_ BitVec 128))
(declare-fun v8 () (_ BitVec 128))
(declare-fun v9 () (_ BitVec 128))
(declare-fun v10 () (_ BitVec 128))
(declare-fun v11 () (_ BitVec 128))
(declare-fun v12 () (_ BitVec 128))
(declare-fun v13 () (_ BitVec 128))
(declare-fun v14 () (_ BitVec 128))
(declare-fun v15 () (_ BitVec 128))
(declare-fun v16 () (_ BitVec 128))
(declare-fun v17 () (_ BitVec 128))
(declare-fun v18 () (_ BitVec 128))
(declare-fun v19 () (_ BitVec 128))
(declare-fun v20 () (_ BitVec 128))
(assert (let ((?v_0 ((_ extract 127 32) a)) (?v_1 ((_ extract 95 0) a))) (and (not (= ((_ extract 95 64) v1) ((_ extract 63 32) v1))) (not (= ((_ extract 95 64) v2) ((_ extract 63 32) v2))) (not (= ((_ extract 95 64) v3) ((_ extract 63 32) v3))) (not (= ((_ extract 95 64) v4) ((_ extract 63 32) v4))) (not (= ((_ extract 95 64) v5) ((_ extract 63 32) v5))) (not (= ((_ extract 95 64) v6) ((_ extract 63 32) v6))) (not (= ((_ extract 95 64) v7) ((_ extract 63 32) v7))) (not (= ((_ extract 95 64) v8) ((_ extract 63 32) v8))) (not (= ((_ extract 95 64) v9) ((_ extract 63 32) v9))) (not (= ((_ extract 95 64) v10) ((_ extract 63 32) v10))) (not (= ((_ extract 95 64) v11) ((_ extract 63 32) v11))) (not (= ((_ extract 95 64) v12) ((_ extract 63 32) v12))) (not (= ((_ extract 95 64) v13) ((_ extract 63 32) v13))) (not (= ((_ extract 95 64) v14) ((_ extract 63 32) v14))) (not (= ((_ extract 95 64) v15) ((_ extract 63 32) v15))) (not (= ((_ extract 95 64) v16) ((_ extract 63 32) v16))) (not (= ((_ extract 95 64) v17) ((_ extract 63 32) v17))) (not (= ((_ extract 95 64) v18) ((_ extract 63 32) v18))) (not (= ((_ extract 95 64) v19) ((_ extract 63 32) v19))) (not (= ((_ extract 95 64) v20) ((_ extract 63 32) v20))) (or (and (= ?v_0 (concat ((_ extract 127 64) v1) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v1)))) (and (= ?v_0 (concat ((_ extract 127 64) v2) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v2)))) (and (= ?v_0 (concat ((_ extract 127 64) v3) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v3)))) (and (= ?v_0 (concat ((_ extract 127 64) v4) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v4)))) (and (= ?v_0 (concat ((_ extract 127 64) v5) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v5)))) (and (= ?v_0 (concat ((_ extract 127 64) v6) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v6)))) (and (= ?v_0 (concat ((_ extract 127 64) v7) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v7)))) (and (= ?v_0 (concat ((_ extract 127 64) v8) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v8)))) (and (= ?v_0 (concat ((_ extract 127 64) v9) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v9)))) (and (= ?v_0 (concat ((_ extract 127 64) v10) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v10)))) (and (= ?v_0 (concat ((_ extract 127 64) v11) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v11)))) (and (= ?v_0 (concat ((_ extract 127 64) v12) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v12)))) (and (= ?v_0 (concat ((_ extract 127 64) v13) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v13)))) (and (= ?v_0 (concat ((_ extract 127 64) v14) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v14)))) (and (= ?v_0 (concat ((_ extract 127 64) v15) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v15)))) (and (= ?v_0 (concat ((_ extract 127 64) v16) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v16)))) (and (= ?v_0 (concat ((_ extract 127 64) v17) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v17)))) (and (= ?v_0 (concat ((_ extract 127 64) v18) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v18)))) (and (= ?v_0 (concat ((_ extract 127 64) v19) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v19)))) (and (= ?v_0 (concat ((_ extract 127 64) v20) dummy)) (= ?v_1 (concat dummy ((_ extract 63 0) v20))))))))
(check-sat)
(exit)