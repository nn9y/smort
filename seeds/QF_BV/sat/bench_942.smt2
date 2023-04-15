(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T4_10520 () (_ BitVec 32))
(declare-fun T4_1778 () (_ BitVec 32))
(declare-fun T2_10528 () (_ BitVec 16))
(declare-fun T2_1788 () (_ BitVec 16))
(declare-fun T2_1820 () (_ BitVec 16))
(declare-fun T2_1786 () (_ BitVec 16))
(declare-fun T1_10528 () (_ BitVec 8))
(declare-fun T1_10529 () (_ BitVec 8))
(declare-fun T1_10520 () (_ BitVec 8))
(declare-fun T1_10521 () (_ BitVec 8))
(declare-fun T1_10522 () (_ BitVec 8))
(declare-fun T1_10523 () (_ BitVec 8))
(declare-fun T1_1820 () (_ BitVec 8))
(declare-fun T1_1821 () (_ BitVec 8))
(declare-fun T1_1788 () (_ BitVec 8))
(declare-fun T1_1789 () (_ BitVec 8))
(declare-fun T1_1786 () (_ BitVec 8))
(declare-fun T1_1787 () (_ BitVec 8))
(declare-fun T1_1778 () (_ BitVec 8))
(declare-fun T1_1779 () (_ BitVec 8))
(declare-fun T1_1780 () (_ BitVec 8))
(declare-fun T1_1781 () (_ BitVec 8))
(assert (let ((?v_0 ((_ zero_extend 16) T2_10528))) (let ((?v_9 (bvadd ?v_0 (_ bv30 32))) (?v_6 ((_ zero_extend 16) T2_1788))) (let ((?v_8 (bvule (_ bv4 32) ?v_6)) (?v_7 (bvadd ((_ zero_extend 16) T2_1820) (_ bv4 32))) (?v_4 ((_ zero_extend 24) (_ bv1 8)))) (let ((?v_5 (bvadd ?v_0 ?v_4)) (?v_3 (bvadd ?v_0 (_ bv1 32))) (?v_1 (bvadd ?v_0 (_ bv2 32)))) (let ((?v_2 (bvadd ?v_1 ?v_1))) (and true (= T4_1778 (bvor (bvshl (bvor (bvshl (bvor (bvshl ((_ zero_extend 24) T1_1781) (_ bv8 32)) ((_ zero_extend 24) T1_1780)) (_ bv8 32)) ((_ zero_extend 24) T1_1779)) (_ bv8 32)) ((_ zero_extend 24) T1_1778))) (= T2_1786 (bvor (bvshl ((_ zero_extend 8) T1_1787) (_ bv8 16)) ((_ zero_extend 8) T1_1786))) (= T2_1788 (bvor (bvshl ((_ zero_extend 8) T1_1789) (_ bv8 16)) ((_ zero_extend 8) T1_1788))) (= T2_1820 (bvor (bvshl ((_ zero_extend 8) T1_1821) (_ bv8 16)) ((_ zero_extend 8) T1_1820))) (= T4_10520 (bvor (bvshl (bvor (bvshl (bvor (bvshl ((_ zero_extend 24) T1_10523) (_ bv8 32)) ((_ zero_extend 24) T1_10522)) (_ bv8 32)) ((_ zero_extend 24) T1_10521)) (_ bv8 32)) ((_ zero_extend 24) T1_10520))) (= T2_10528 (bvor (bvshl ((_ zero_extend 8) T1_10529) (_ bv8 16)) ((_ zero_extend 8) T1_10528))) (bvslt (bvadd (bvadd ?v_9 ?v_6) T4_10520) (_ bv0 32)) (not (= (bvadd (bvshl (bvsub ?v_0 (_ bv17 32)) ?v_4) (_ bv105310336 32)) (_ bv0 32))) (bvslt ?v_2 (_ bv1024 32)) (bvsle ?v_2 (_ bv32768 32)) (bvslt (_ bv0 32) ?v_2) (not (= ?v_2 (_ bv0 32))) (bvule ?v_2 (_ bv2147483647 32)) (bvule (_ bv4 16) T2_1820) (bvule (bvadd ?v_0 (_ bv31 32)) (_ bv2114 32)) (not (= (bvsub ?v_0 (_ bv16 32)) (_ bv0 32))) (not (= ?v_3 (_ bv0 32))) (bvsle (_ bv0 32) ?v_3) (bvslt ?v_5 (_ bv1024 32)) (bvsle ?v_5 (_ bv32768 32)) (bvslt (_ bv0 32) ?v_5) (bvsle (_ bv0 32) ?v_5) (not (= ?v_5 (_ bv0 32))) (bvule ?v_5 (_ bv2147483647 32)) (= ((_ zero_extend 16) T2_1786) ?v_0) (not (= ?v_0 (_ bv0 32))) (bvule ?v_0 (_ bv28 32)) (bvult (_ bv27 32) ?v_0) (bvule ?v_0 (_ bv2147483645 32)) (= (_ bv28 32) ?v_0) (bvult (_ bv0 32) ?v_0) (bvult (_ bv0 16) T2_10528) (not (= T4_1778 (_ bv4294967295 32))) (= ?v_7 ?v_6) (bvule ?v_6 ?v_7) (bvule ?v_7 ?v_6) ?v_8 (= ?v_6 (_ bv264 32)) (bvult (_ bv0 32) ?v_6) (bvule ?v_6 (_ bv512 32)) ?v_8 (not (= ?v_6 (_ bv0 32))) (= ?v_9 (_ bv58 32)) (bvult (_ bv0 32) ?v_9) (= T4_1778 T4_10520))))))))
(check-sat)
(exit)