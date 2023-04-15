(set-info :smt-lib-version 2.6)
(set-logic AUFNIRA)
(set-info :source |Benchmarks from the paper: "Extending Sledgehammer with SMT Solvers" by Jasmin Blanchette, Sascha Bohme, and Lawrence C. Paulson, CADE 2011.  Translated to SMT2 by Andrew Reynolds and Morgan Deters.|)
(set-info :category "industrial")
(set-info :status sat)
(declare-sort S1 0)
(declare-sort S2 0)
(declare-sort S3 0)
(declare-sort S4 0)
(declare-sort S5 0)
(declare-sort S6 0)
(declare-fun f1 () S1)
(declare-fun f2 () S1)
(declare-fun f3 (Real Real) S2)
(declare-fun f4 (S3 Real) Real)
(declare-fun f5 () S3)
(declare-fun f6 (S4 Real) S3)
(declare-fun f7 () S4)
(declare-fun f8 () Real)
(declare-fun f9 (S5 S6) Real)
(declare-fun f10 () S5)
(declare-fun f11 () S6)
(declare-fun f12 () S3)
(declare-fun f13 () S2)
(assert (not (= f1 f2)))
(assert (let ((?v_0 (f4 (f6 f7 (* 2.0 f8)) (f9 f10 f11)))) (not (not (= (f3 (f4 f5 ?v_0) (f4 f12 ?v_0)) f13)))))
(assert (forall ((?v0 Real) (?v1 Real)) (let ((?v_0 0.0)) (= (= (f3 ?v0 ?v1) f13) (and (= ?v0 ?v_0) (= ?v1 ?v_0))))))
(check-sat)
(exit)