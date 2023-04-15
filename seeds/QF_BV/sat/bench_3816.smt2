(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T2_11040 () (_ BitVec 16))
(declare-fun T1_11040 () (_ BitVec 8))
(declare-fun T1_11041 () (_ BitVec 8))
(assert (let ((?v_1 ((_ sign_extend 16) (bvashr T2_11040 ((_ zero_extend 8) (_ bv11 8))))) (?v_0 ((_ zero_extend 24) (_ bv60 8)))) (and true (= T2_11040 (bvor (bvshl ((_ zero_extend 8) T1_11041) (_ bv8 16)) ((_ zero_extend 8) T1_11040))) (bvslt (_ bv4294967295 32) (bvmul (bvmul ?v_1 ?v_0) ?v_0)) (bvule ?v_1 (_ bv23 32)))))
(check-sat)
(exit)
