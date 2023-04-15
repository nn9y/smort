(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T4_27281 () (_ BitVec 32))
(declare-fun T1_27281 () (_ BitVec 8))
(declare-fun T1_27282 () (_ BitVec 8))
(declare-fun T1_27283 () (_ BitVec 8))
(declare-fun T1_27284 () (_ BitVec 8))
(assert (and true (= T4_27281 (bvor (bvshl (bvor (bvshl (bvor (bvshl ((_ zero_extend 24) T1_27284) (_ bv8 32)) ((_ zero_extend 24) T1_27283)) (_ bv8 32)) ((_ zero_extend 24) T1_27282)) (_ bv8 32)) ((_ zero_extend 24) T1_27281))) (bvult (_ bv0 32) T4_27281)))
(check-sat)
(exit)