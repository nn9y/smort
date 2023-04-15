(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_6468 () (_ BitVec 8))
(assert (let ((?v_0 (bvand (bvor (bvshl (bvand ((_ zero_extend 24) T1_6468) (_ bv255 32)) ((_ zero_extend 24) (_ bv3 8))) (_ bv2 32)) (_ bv15 32)))) (let ((?v_1 (bvadd ?v_0 (_ bv4 32)))) (and true (bvslt (_ bv14 32) ?v_1) (not (= ?v_0 (_ bv4294967295 32))) (bvslt (_ bv13 32) ?v_1) (bvslt (_ bv0 32) ?v_1) (bvsle ?v_1 (_ bv19 32))))))
(check-sat)
(exit)
