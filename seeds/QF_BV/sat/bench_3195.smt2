(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T2_10471 () (_ BitVec 16))
(declare-fun T1_10471 () (_ BitVec 8))
(declare-fun T1_10472 () (_ BitVec 8))
(assert (let ((?v_0 ((_ zero_extend 16) T2_10471)) (?v_4 ((_ zero_extend 24) (_ bv1 8)))) (let ((?v_5 (bvadd ?v_0 ?v_4)) (?v_3 (bvadd ?v_0 (_ bv1 32))) (?v_1 (bvadd ?v_0 (_ bv2 32)))) (let ((?v_2 (bvadd ?v_1 ?v_1))) (and true (= T2_10471 (bvor (bvshl ((_ zero_extend 8) T1_10472) (_ bv8 16)) ((_ zero_extend 8) T1_10471))) (bvslt (_ bv4294967295 32) (bvadd (bvshl (bvsub ?v_0 (_ bv5 32)) ?v_4) (_ bv120117434 32))) (bvslt ?v_2 (_ bv1024 32)) (bvsle ?v_2 (_ bv32768 32)) (bvslt (_ bv0 32) ?v_2) (not (= ?v_2 (_ bv0 32))) (bvule ?v_2 (_ bv2147483647 32)) (not (= (bvsub ?v_0 (_ bv4 32)) (_ bv0 32))) (not (= ?v_3 (_ bv0 32))) (bvsle (_ bv0 32) ?v_3) (bvslt ?v_5 (_ bv1024 32)) (bvsle ?v_5 (_ bv32768 32)) (bvslt (_ bv0 32) ?v_5) (bvsle (_ bv0 32) ?v_5) (not (= ?v_5 (_ bv0 32))) (bvule ?v_5 (_ bv2147483647 32)) (not (= ?v_0 (_ bv0 32))) (bvule ?v_0 (_ bv11 32)) (bvult (_ bv10 32) ?v_0) (bvule ?v_0 (_ bv2147483645 32)) (= (_ bv11 32) ?v_0) (bvult (_ bv0 32) ?v_0) (bvult (_ bv0 16) T2_10471))))))
(check-sat)
(exit)
