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


(declare-datatypes ((List!955 0)) (((Cons!956 (head!957 (_ BitVec 32)) (tail!958 List!955)) (Nil!959))
))
(declare-fun error_value!960 () (_ BitVec 32))
(declare-fun size!206 (List!955) (_ BitVec 32))
(declare-fun error_value!961 () (_ BitVec 32))
(declare-sort I_size!206 0)
(declare-fun size!206_arg_0_1 (I_size!206) List!955)
(assert (forall ((?i I_size!206)) (and (= (ite ((_ is Nil!959) (size!206_arg_0_1 ?i)) (_ bv0 32) (ite ((_ is Cons!956) (size!206_arg_0_1 ?i)) (bvadd (size!206 (tail!958 (size!206_arg_0_1 ?i))) (_ bv1 32)) error_value!960)) (size!206 (size!206_arg_0_1 ?i))) (ite ((_ is Nil!959) (size!206_arg_0_1 ?i)) true (ite ((_ is Cons!956) (size!206_arg_0_1 ?i)) (not (forall ((?z I_size!206)) (not (= (size!206_arg_0_1 ?z) (tail!958 (size!206_arg_0_1 ?i)))) )) true))) ))
(assert (not (forall ((l!205 List!955)) (not (and (bvslt (ite ((_ is Nil!959) (tail!958 l!205)) (_ bv0 32) (ite ((_ is Cons!956) l!205) (bvadd (size!206 l!205) (_ bv1 32)) error_value!961)) (_ bv0 32)) (ite ((_ is Nil!959) (tail!958 l!205)) true (ite ((_ is Cons!956) l!205) (not (forall ((?z I_size!206)) (not (= (size!206_arg_0_1 ?z) l!205)) )) true)))) )))
(check-sat)
(exit)
