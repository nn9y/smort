(set-info :smt-lib-version 2.6)
(set-logic AUFBVDTLIA)
(set-info :source |
Generated by: Andrew Reynolds
Generated on: 2017-04-28
Generator: Nunchaku, Leon, CVC4, converted to v2.6 by CVC4
Application: Counterexample generation for higher-order theorem provers
Target solver: CVC4, Z3
Publications: "Model Finding for Recursive Functions in SMT" by Andrew Reynolds, Jasmin Christian Blanchette, Simon Cruanes, and Cesare Tinelli, IJCAR 2016.
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)


(declare-datatypes ((Heap!907 0)) (((Leaf!908) (Node!909 (rk!910 (_ BitVec 32)) (value!911 (_ BitVec 32)) (left!912 Heap!907) (right!913 Heap!907)))
))
(declare-fun error_value!914 () (_ BitVec 32))
(declare-fun rightHeight!206 (Heap!907) (_ BitVec 32))
(declare-fun error_value!915 () (_ BitVec 32))
(declare-sort I_rightHeight!206 0)
(declare-fun rightHeight!206_arg_0_1 (I_rightHeight!206) Heap!907)
(assert (forall ((?i I_rightHeight!206)) (and (= (ite ((_ is Leaf!908) (rightHeight!206_arg_0_1 ?i)) (_ bv0 32) (ite ((_ is Node!909) (rightHeight!206_arg_0_1 ?i)) (bvadd (rightHeight!206 (right!913 (rightHeight!206_arg_0_1 ?i))) (_ bv1 32)) error_value!914)) (rightHeight!206 (rightHeight!206_arg_0_1 ?i))) (ite ((_ is Leaf!908) (rightHeight!206_arg_0_1 ?i)) true (ite ((_ is Node!909) (rightHeight!206_arg_0_1 ?i)) (not (forall ((?z I_rightHeight!206)) (not (= (rightHeight!206_arg_0_1 ?z) (right!913 (rightHeight!206_arg_0_1 ?i)))) )) true))) ))
(assert (not (forall ((h!205 Heap!907)) (or (bvslt (ite ((_ is Leaf!908) h!205) (_ bv0 32) (ite ((_ is Node!909) h!205) (bvadd (rightHeight!206 (right!913 h!205)) (_ bv1 32)) error_value!915)) (_ bv0 32)) (not (ite ((_ is Leaf!908) h!205) true (ite ((_ is Node!909) h!205) (not (forall ((?z I_rightHeight!206)) (not (= (rightHeight!206_arg_0_1 ?z) (right!913 h!205))) )) true)))) )))
(check-sat)
(exit)
