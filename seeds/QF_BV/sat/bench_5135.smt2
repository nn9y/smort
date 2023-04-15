(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun T2_0 () (_ BitVec 16))
(declare-fun T1_0 () (_ BitVec 8))
(declare-fun T1_1 () (_ BitVec 8))
(declare-fun T1_2 () (_ BitVec 8))
(declare-fun T1_3 () (_ BitVec 8))
(declare-fun T4_0 () (_ BitVec 32))
(assert (let ((?v_20 ((_ zero_extend 16) T2_0)) (?v_19 ((_ zero_extend 24) T1_0)) (?v_18 ((_ zero_extend 24) T1_1)) (?v_0 ((_ zero_extend 24) T1_2)) (?v_17 ((_ zero_extend 8) T1_2)) (?v_16 ((_ zero_extend 24) T1_3)) (?v_14 ((_ zero_extend 16) (_ bv25 16)))) (let ((?v_15 (bvsub ?v_0 (_ bv65 32))) (?v_13 (bvadd ?v_0 (_ bv4294962944 32))) (?v_12 (bvadd ?v_0 (_ bv21504 32))) (?v_11 (bvsub ?v_0 (_ bv9312 32))) (?v_9 ((_ zero_extend 16) (_ bv1023 16))) (?v_10 (bvadd ?v_0 (_ bv9216 32))) (?v_8 (bvadd ?v_0 (_ bv10240 32))) (?v_6 ((_ zero_extend 16) (_ bv9 16))) (?v_7 (bvsub ?v_0 (_ bv2406 32))) (?v_5 (bvsub ?v_0 (_ bv3902 32))) (?v_4 (bvsub ?v_0 (_ bv3792 32))) (?v_3 ((_ zero_extend 24) (_ bv1 8))) (?v_2 (bvadd ?v_0 (_ bv24576 32))) (?v_1 (bvadd ?v_0 (_ bv4294961184 32)))) (and true (= T2_0 (bvor (bvshl ((_ zero_extend 8) T1_1) (_ bv8 16)) ((_ zero_extend 8) T1_0))) (= T4_0 (bvor (bvshl (bvor (bvshl (bvor (bvshl ?v_16 (_ bv8 32)) ?v_0) (_ bv8 32)) ?v_18) (_ bv8 32)) ?v_19)) (not (= T4_0 (_ bv67324752 32))) (= (bvadd (bvsub (_ bv0 32) ((_ zero_extend 24) (ite (bvult ?v_14 (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_1)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_1)) (_ bv8 32)))) (_ bv1 8) (_ bv0 8)))) ?v_3) (_ bv0 32)) (= (bvadd (bvsub (_ bv0 32) ((_ zero_extend 24) (ite (bvult ((_ zero_extend 16) (_ bv1222 16)) (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_2)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_2)) (_ bv8 32)))) (_ bv1 8) (_ bv0 8)))) ?v_3) (_ bv0 32)) (bvult ?v_6 (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_4)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_4)) (_ bv8 32)))) (bvult ((_ zero_extend 16) (_ bv1 16)) (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_5)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_5)) (_ bv8 32)))) (bvult ?v_6 (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_7)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_7)) (_ bv8 32)))) (bvult ?v_9 (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_8)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_8)) (_ bv8 32)))) (bvult ?v_9 (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_10)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_10)) (_ bv8 32)))) (bvult ((_ zero_extend 16) (_ bv159 16)) (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_11)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_11)) (_ bv8 32)))) (bvult ((_ zero_extend 16) (_ bv11171 16)) (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_12)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_12)) (_ bv8 32)))) (bvult ((_ zero_extend 16) (_ bv249 16)) (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_13)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_13)) (_ bv8 32)))) (bvult ?v_14 (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_15)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_15)) (_ bv8 32)))) (not (= (bvand (bvsub ?v_0 (_ bv33 32)) (_ bv4294967264 32)) (_ bv0 32))) (= (bvand T1_2 (_ bv128 8)) (_ bv0 8)) (not (= ?v_16 (_ bv10 32))) (not (= ?v_16 (_ bv13 32))) (bvult ?v_17 (_ bv3872 16)) (bvult ?v_17 (_ bv3864 16)) (bvult ?v_17 (_ bv3664 16)) (bvult ?v_17 (_ bv65296 16)) (bvult ?v_17 (_ bv48 16)) (not (= ?v_17 (_ bv65535 16))) (bvslt ?v_0 (_ bv768 32)) (bvult ?v_17 (_ bv2304 16)) (bvult ?v_17 (_ bv128 16)) (bvult ?v_17 (_ bv13312 16)) (bvult ?v_17 (_ bv57344 16)) (bvult ?v_17 (_ bv65280 16)) (bvult ?v_17 (_ bv65072 16)) (bvult ?v_17 (_ bv63744 16)) (bvult ?v_17 (_ bv59413 16)) (bvult ?v_17 (_ bv19968 16)) (bvult ?v_17 (_ bv44032 16)) (bvult ?v_17 (_ bv4352 16)) (bvult ?v_17 (_ bv12288 16)) (bvult ?v_17 (_ bv12593 16)) (bvsle ?v_0 (_ bv8 32)) (not (= ?v_0 (_ bv7 32))) (not (= ?v_0 (_ bv32 32))) (bvsle ?v_0 (_ bv32 32)) (bvult ?v_17 (_ bv97 16)) (bvslt ?v_0 (_ bv9 32)) (bvsle ?v_0 (_ bv126 32)) (not (= ?v_0 (_ bv10 32))) (not (= ?v_0 (_ bv13 32))) (bvsle (_ bv9 32) ?v_18) (bvsle ?v_18 (_ bv126 32)) (not (= ?v_18 (_ bv10 32))) (not (= ?v_18 (_ bv13 32))) (bvsle (_ bv9 32) ?v_19) (bvsle ?v_19 (_ bv126 32)) (not (= ?v_19 (_ bv10 32))) (not (= ?v_19 (_ bv13 32))) (not (= T1_0 (_ bv254 8))) (not (= T1_0 (_ bv255 8))) (not (= T1_0 (_ bv0 8))) (bvsle ?v_20 (_ bv32919 32)) (not (= ?v_20 (_ bv14334 32))) (bvslt ?v_20 (_ bv42459 32)) (bvsle ?v_20 (_ bv42460 32))))))
(check-sat)
(exit)