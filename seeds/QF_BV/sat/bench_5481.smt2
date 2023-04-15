(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T1_4515 () (_ BitVec 8))
(declare-fun T1_4514 () (_ BitVec 8))
(declare-fun T1_4513 () (_ BitVec 8))
(declare-fun T1_4512 () (_ BitVec 8))
(declare-fun T1_4511 () (_ BitVec 8))
(declare-fun T1_4510 () (_ BitVec 8))
(assert (let ((?v_1 ((_ zero_extend 24) (_ bv1 8))) (?v_3 ((_ zero_extend 24) (_ bv8 8))) (?v_2 ((_ zero_extend 24) (_ bv4 8))) (?v_0 ((_ zero_extend 24) (_ bv5 8)))) (and true (bvslt (_ bv4294967295 32) (bvadd (bvashr (bvadd (bvashr (bvadd (bvashr (bvashr (bvashr (bvadd (bvashr (bvadd (bvashr (bvashr (bvashr (bvadd (bvshl ((_ zero_extend 24) T1_4510) ((_ zero_extend 24) (_ bv2 8))) (_ bv2 32)) ?v_0) ?v_1) ?v_2) ((_ zero_extend 24) T1_4511)) ?v_0) (bvshl ((_ zero_extend 24) T1_4512) ((_ zero_extend 24) (_ bv3 8)))) ?v_0) ?v_1) ?v_2) (bvshl ((_ zero_extend 24) T1_4513) ?v_1)) ?v_3) (bvshl ((_ zero_extend 24) T1_4514) ?v_1)) ?v_3) (bvshl ((_ zero_extend 24) T1_4515) ?v_1))))))
(check-sat)
(exit)