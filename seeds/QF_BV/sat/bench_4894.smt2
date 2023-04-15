(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T2_10457 () (_ BitVec 16))
(declare-fun T1_10457 () (_ BitVec 8))
(declare-fun T1_10458 () (_ BitVec 8))
(assert (let ((?v_0 ((_ sign_extend 16) (bvadd (bvashr T2_10457 ((_ zero_extend 8) (_ bv9 8))) (_ bv1980 16))))) (and true (= T2_10457 (bvor (bvshl ((_ zero_extend 8) T1_10458) (_ bv8 16)) ((_ zero_extend 8) T1_10457))) (bvslt (_ bv4294967295 32) (bvadd ?v_0 (_ bv4294965695 32))) (= (bvand ((_ extract 7 0) ?v_0) (_ bv3 8)) (_ bv0 8)) (bvule (bvsub ?v_0 (_ bv1601 32)) (_ bv29226 32)))))
(check-sat)
(exit)
