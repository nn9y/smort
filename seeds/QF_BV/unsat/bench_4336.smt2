(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_111980 () (_ BitVec 8))
(assert (let ((?v_0 (bvand (bvor (bvshl (bvand ((_ zero_extend 24) T1_111980) (_ bv255 32)) ((_ zero_extend 24) (_ bv3 8))) (_ bv2 32)) (_ bv15 32)))) (and true (bvslt (_ bv19 32) (bvadd ?v_0 (_ bv4 32))) (not (= ?v_0 (_ bv4294967295 32))))))
(check-sat)
(exit)
