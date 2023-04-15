(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T2_13754 () (_ BitVec 16))
(declare-fun T1_13745 () (_ BitVec 8))
(declare-fun T4_13746 () (_ BitVec 32))
(declare-fun T1_13754 () (_ BitVec 8))
(declare-fun T1_13755 () (_ BitVec 8))
(declare-fun T1_13746 () (_ BitVec 8))
(declare-fun T1_13747 () (_ BitVec 8))
(declare-fun T1_13748 () (_ BitVec 8))
(declare-fun T1_13749 () (_ BitVec 8))
(assert (let ((?v_1 ((_ zero_extend 16) T2_13754)) (?v_0 ((_ zero_extend 24) T1_13745))) (and true (= T4_13746 (bvor (bvshl (bvor (bvshl (bvor (bvshl ((_ zero_extend 24) T1_13749) (_ bv8 32)) ((_ zero_extend 24) T1_13748)) (_ bv8 32)) ((_ zero_extend 24) T1_13747)) (_ bv8 32)) ((_ zero_extend 24) T1_13746))) (= T2_13754 (bvor (bvshl ((_ zero_extend 8) T1_13755) (_ bv8 16)) ((_ zero_extend 8) T1_13754))) (not (= T4_13746 ?v_1)) (bvule (_ bv8 32) ?v_0) (not (= ?v_0 (_ bv1 32))) (bvule (bvadd (bvadd (bvadd (bvadd (bvadd ?v_0 (_ bv1 32)) (_ bv4279998 32)) ?v_1) (_ bv6 32)) (_ bv1 32)) (_ bv4280822 32)))))
(check-sat)
(exit)