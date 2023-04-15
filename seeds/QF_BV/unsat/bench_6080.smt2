(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_10686 () (_ BitVec 8))
(declare-fun T1_10693 () (_ BitVec 8))
(declare-fun T1_10696 () (_ BitVec 8))
(declare-fun T1_10707 () (_ BitVec 8))
(declare-fun T1_10710 () (_ BitVec 8))
(declare-fun T1_10720 () (_ BitVec 8))
(assert (let ((?v_1 ((_ zero_extend 24) (_ bv1 8))) (?v_20 (bvand (bvand ((_ zero_extend 24) T1_10686) (_ bv255 32)) (_ bv31 32)))) (let ((?v_7 (bvadd ?v_20 ?v_1))) (let ((?v_13 (bvadd ?v_7 (_ bv267 32))) (?v_0 ((_ zero_extend 24) (_ bv2 8)))) (let ((?v_6 (bvand (bvor (bvshl (bvand ((_ zero_extend 24) T1_10693) (_ bv255 32)) ?v_0) (_ bv3 32)) (_ bv7 32)))) (let ((?v_19 (bvadd ?v_6 (_ bv26 32))) (?v_5 (bvand (bvshl (bvand ((_ zero_extend 24) T1_10696) (_ bv255 32)) ?v_0) (_ bv7 32)))) (let ((?v_11 (bvadd ?v_5 (_ bv3 32)))) (let ((?v_18 (bvadd ?v_11 ?v_19))) (let ((?v_17 (bvadd ?v_18 (_ bv38 32))) (?v_4 (bvand (bvshl (bvand ((_ zero_extend 24) T1_10707) (_ bv255 32)) ?v_1) (_ bv3 32)))) (let ((?v_10 (bvadd ?v_4 (_ bv3 32)))) (let ((?v_16 (bvadd ?v_10 ?v_17))) (let ((?v_15 (bvadd ?v_16 (_ bv6 32))) (?v_3 (bvand (bvor (bvshl (bvand ((_ zero_extend 24) T1_10710) (_ bv255 32)) ?v_0) (_ bv3 32)) (_ bv7 32)))) (let ((?v_9 (bvadd ?v_3 (_ bv3 32)))) (let ((?v_14 (bvadd ?v_9 ?v_15)) (?v_2 (bvand (bvor (bvshl (bvand ((_ zero_extend 24) T1_10720) (_ bv255 32)) ?v_0) (_ bv3 32)) (_ bv127 32)))) (let ((?v_8 (bvadd ?v_2 (_ bv11 32)))) (let ((?v_12 (bvadd ?v_8 (bvadd ?v_14 (_ bv25 32))))) (and true (bvsle ?v_7 (_ bv14 32)) (not (= ?v_2 (_ bv4294967295 32))) (not (= ?v_3 (_ bv4294967295 32))) (not (= ?v_4 (_ bv4294967295 32))) (not (= ?v_5 (_ bv4294967295 32))) (bvslt (_ bv0 32) (bvadd ?v_6 (_ bv3 32))) (bvslt (_ bv0 32) ?v_8) (bvslt (_ bv0 32) ?v_9) (bvslt (_ bv0 32) ?v_10) (bvslt (_ bv0 32) ?v_11) (not (= ?v_6 (_ bv4294967295 32))) (bvsle ?v_13 (bvadd ?v_12 (_ bv28 32))) (bvsle (bvadd ?v_12 (_ bv14 32)) ?v_13) (bvsle ?v_12 ?v_13) (bvsle (bvadd ?v_14 (_ bv24 32)) ?v_13) (bvslt (bvadd ?v_14 ?v_1) ?v_13) (bvslt ?v_14 ?v_13) (bvsle ?v_14 ?v_13) (bvslt ?v_15 ?v_13) (bvslt ?v_16 ?v_13) (bvsle ?v_16 ?v_13) (bvslt ?v_17 ?v_13) (bvsle (bvadd ?v_18 (_ bv37 32)) ?v_13) (bvslt ?v_18 ?v_13) (bvsle ?v_18 ?v_13) (bvslt ?v_19 ?v_13) (bvsle (bvadd ?v_6 (_ bv25 32)) ?v_13) (bvslt (_ bv0 32) ?v_13) (not (= ?v_20 (_ bv4294967295 32))) (bvslt (_ bv15 32) ?v_7) (bvsle ?v_7 (_ bv17 32)) (bvslt (_ bv16 32) ?v_7) (bvslt (_ bv0 32) ?v_7) (bvsle ?v_7 (_ bv30 32)))))))))))))))))))
(check-sat)
(exit)