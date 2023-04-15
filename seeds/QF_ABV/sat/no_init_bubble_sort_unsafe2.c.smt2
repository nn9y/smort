(set-info :smt-lib-version 2.6)
(set-logic QF_ABV)
(set-info :source |
The benchmarks come from Bounded Model Checking of software. Each of them is a
family of formulae obtained during the check of a program and is parametric in
the size of the arrays. They actually don't involve Uninterpreted Functions but
just Arrays and Bitvectors.

This family contains formulae modeling the Bubble Sort algorithm for sorting an
array of N (the increasing parameter) elements. Differently from the
bubble_sort benchmarks, here arrays are not instantiated, that results in
arrays with unconstrained elements.

Contributed by Lorenzo Platania (c1009@unige.it).  Translated from CVC format
by Clark Barrett.

|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun size_Q_0 () (_ BitVec 32))
(declare-fun size_Q_1 () (_ BitVec 32))
(assert (= size_Q_1 (_ bv2 32)))
(declare-fun BubbleSort_Q_0_Q_j_Q_0 () (_ BitVec 32))
(declare-fun BubbleSort_Q_0_Q_j_Q_1 () (_ BitVec 32))
(assert (= BubbleSort_Q_0_Q_j_Q_1 (_ bv0 32)))
(declare-fun BubbleSort_Q_0_Q_i_Q_0 () (_ BitVec 32))
(declare-fun BubbleSort_Q_0_Q_i_Q_1 () (_ BitVec 32))
(assert (= BubbleSort_Q_0_Q_i_Q_1 (ite (bvult BubbleSort_Q_0_Q_j_Q_1 (bvsub (_ bv2 32) (_ bv1 32))) (_ bv0 32) BubbleSort_Q_0_Q_i_Q_0)))
(declare-fun array_Q_0 () (Array (_ BitVec 32) (_ BitVec 32)))
(declare-fun BubbleSort_Q_0_Q_temp_Q_0 () (_ BitVec 32))
(declare-fun BubbleSort_Q_0_Q_temp_Q_1 () (_ BitVec 32))
(assert (let ((?v_0 (select array_Q_0 BubbleSort_Q_0_Q_i_Q_1))) (= BubbleSort_Q_0_Q_temp_Q_1 (ite (and (and (bvult BubbleSort_Q_0_Q_j_Q_1 (bvsub (_ bv2 32) (_ bv1 32))) (bvult BubbleSort_Q_0_Q_i_Q_1 (bvsub (bvsub (_ bv2 32) BubbleSort_Q_0_Q_j_Q_1) (_ bv1 32)))) (bvult ?v_0 (select array_Q_0 (bvadd BubbleSort_Q_0_Q_i_Q_1 (_ bv1 32))))) ?v_0 BubbleSort_Q_0_Q_temp_Q_0))))
(declare-fun array_Q_1 () (Array (_ BitVec 32) (_ BitVec 32)))
(assert (let ((?v_0 (select array_Q_0 (bvadd BubbleSort_Q_0_Q_i_Q_1 (_ bv1 32))))) (= array_Q_1 (ite (and (and (bvult BubbleSort_Q_0_Q_j_Q_1 (bvsub (_ bv2 32) (_ bv1 32))) (bvult BubbleSort_Q_0_Q_i_Q_1 (bvsub (bvsub (_ bv2 32) BubbleSort_Q_0_Q_j_Q_1) (_ bv1 32)))) (bvult (select array_Q_0 BubbleSort_Q_0_Q_i_Q_1) ?v_0)) (store array_Q_0 BubbleSort_Q_0_Q_i_Q_1 ?v_0) array_Q_0))))
(declare-fun array_Q_2 () (Array (_ BitVec 32) (_ BitVec 32)))
(assert (let ((?v_0 (bvadd BubbleSort_Q_0_Q_i_Q_1 (_ bv1 32)))) (= array_Q_2 (ite (and (and (bvult BubbleSort_Q_0_Q_j_Q_1 (bvsub (_ bv2 32) (_ bv1 32))) (bvult BubbleSort_Q_0_Q_i_Q_1 (bvsub (bvsub (_ bv2 32) BubbleSort_Q_0_Q_j_Q_1) (_ bv1 32)))) (bvult (select array_Q_0 BubbleSort_Q_0_Q_i_Q_1) (select array_Q_0 ?v_0))) (store array_Q_1 ?v_0 BubbleSort_Q_0_Q_temp_Q_1) array_Q_1))))
(declare-fun BubbleSort_Q_0_Q_temp_Q_i_Q_0 () (_ BitVec 32))
(declare-fun BubbleSort_Q_0_Q_temp_Q_i_Q_1 () (_ BitVec 32))
(assert (= BubbleSort_Q_0_Q_temp_Q_i_Q_1 (ite (and (bvult BubbleSort_Q_0_Q_j_Q_1 (bvsub (_ bv2 32) (_ bv1 32))) (bvult BubbleSort_Q_0_Q_i_Q_1 (bvsub (bvsub (_ bv2 32) BubbleSort_Q_0_Q_j_Q_1) (_ bv1 32)))) BubbleSort_Q_0_Q_i_Q_1 BubbleSort_Q_0_Q_temp_Q_i_Q_0)))
(declare-fun BubbleSort_Q_0_Q_i_Q_2 () (_ BitVec 32))
(assert (= BubbleSort_Q_0_Q_i_Q_2 (ite (and (bvult BubbleSort_Q_0_Q_j_Q_1 (bvsub (_ bv2 32) (_ bv1 32))) (bvult BubbleSort_Q_0_Q_i_Q_1 (bvsub (bvsub (_ bv2 32) BubbleSort_Q_0_Q_j_Q_1) (_ bv1 32)))) (bvadd BubbleSort_Q_0_Q_i_Q_1 (_ bv1 32)) BubbleSort_Q_0_Q_i_Q_1)))
(declare-fun BubbleSort_Q_0_Q_temp_Q_j_Q_0 () (_ BitVec 32))
(declare-fun BubbleSort_Q_0_Q_temp_Q_j_Q_1 () (_ BitVec 32))
(assert (= BubbleSort_Q_0_Q_temp_Q_j_Q_1 (ite (bvult BubbleSort_Q_0_Q_j_Q_1 (bvsub (_ bv2 32) (_ bv1 32))) BubbleSort_Q_0_Q_j_Q_1 BubbleSort_Q_0_Q_temp_Q_j_Q_0)))
(declare-fun BubbleSort_Q_0_Q_j_Q_2 () (_ BitVec 32))
(assert (= BubbleSort_Q_0_Q_j_Q_2 (ite (bvult BubbleSort_Q_0_Q_j_Q_1 (bvsub (_ bv2 32) (_ bv1 32))) (bvadd BubbleSort_Q_0_Q_j_Q_1 (_ bv1 32)) BubbleSort_Q_0_Q_j_Q_1)))
(assert (let ((?v_9 (bvsub (_ bv2 32) (_ bv1 32)))) (let ((?v_8 (bvult BubbleSort_Q_0_Q_j_Q_1 ?v_9)) (?v_7 (bvsub (bvsub (_ bv2 32) BubbleSort_Q_0_Q_j_Q_1) (_ bv1 32)))) (let ((?v_0 (and ?v_8 (bvult BubbleSort_Q_0_Q_i_Q_1 ?v_7))) (?v_1 (bvadd BubbleSort_Q_0_Q_i_Q_1 (_ bv1 32)))) (let ((?v_4 (and ?v_0 (bvult (select array_Q_0 BubbleSort_Q_0_Q_i_Q_1) (select array_Q_0 ?v_1)))) (?v_2 (and (bvule (_ bv0 32) BubbleSort_Q_0_Q_i_Q_1) (bvult BubbleSort_Q_0_Q_i_Q_1 (_ bv2 32)))) (?v_5 (and (bvule (_ bv0 32) ?v_1) (bvult ?v_1 (_ bv2 32))))) (let ((?v_3 (=> ?v_4 ?v_2)) (?v_6 (=> ?v_4 ?v_5))) (not (and (and (and (and (and (and (and (and (and (and (=> ?v_0 ?v_2) (=> ?v_0 ?v_5)) ?v_3) ?v_3) ?v_6) ?v_6) (=> ?v_0 (not (bvult BubbleSort_Q_0_Q_i_Q_2 ?v_7)))) (=> ?v_8 (not (bvult BubbleSort_Q_0_Q_j_Q_2 ?v_9)))) (and (bvule (_ bv0 32) (_ bv0 32)) (bvult (_ bv0 32) (_ bv2 32)))) (and (bvule (_ bv0 32) (_ bv1 32)) (bvult (_ bv1 32) (_ bv2 32)))) (bvule (select array_Q_2 (_ bv0 32)) (select array_Q_2 (_ bv1 32)))))))))))
(check-sat)
(exit)
