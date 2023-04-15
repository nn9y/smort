(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T2_9072 () (_ BitVec 16))
(declare-fun T1_9163 () (_ BitVec 8))
(declare-fun T1_9141 () (_ BitVec 8))
(declare-fun T1_9114 () (_ BitVec 8))
(declare-fun T1_9091 () (_ BitVec 8))
(declare-fun T1_9074 () (_ BitVec 8))
(declare-fun T1_9072 () (_ BitVec 8))
(declare-fun T1_9073 () (_ BitVec 8))
(assert (let ((?v_0 ((_ zero_extend 16) T2_9072))) (and true (= T2_9072 (bvor (bvshl ((_ zero_extend 8) T1_9073) (_ bv8 16)) ((_ zero_extend 8) T1_9072))) (not (= (bvadd (bvadd (bvadd (bvadd (bvadd ?v_0 (bvsub (_ bv4294967295 32) ((_ zero_extend 24) T1_9074))) (bvsub (_ bv4294967295 32) ((_ zero_extend 24) T1_9091))) (bvsub (_ bv4294967295 32) ((_ zero_extend 24) T1_9114))) (bvsub (_ bv4294967295 32) ((_ zero_extend 24) T1_9141))) (bvsub (_ bv4294967295 32) ((_ zero_extend 24) T1_9163))) (_ bv0 32))) (not (= ?v_0 (_ bv0 32))))))
(check-sat)
(exit)