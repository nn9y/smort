(set-info :smt-lib-version 2.6)
(set-logic QF_LIA)
(set-info :source |
Generated by: Martin Bromberger
Generated on: 2018-01-06
Generator: https://www.mpi-inf.mpg.de/fileadmin/inf/rg1/Documents/RandomUnboundedSageScript.tar.gz
Application: This is a satisfiable problem with bounded and unbounded directions and, therefore, a good test for the termination/completeness of branch-and-bound solvers.
Publications: M. Bromberger. A Reduction from Unbounded Linear Mixed Arithmetic Problems into Bounded Problems. (Work in progress.)

The benchmarks in this class were randomly generated by a sagemath script and by way of construction they are all satisfiable.
Target solver: CVC4 Mathsat SPASS-IQ YICES Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "random")
(set-info :status sat)
(declare-fun x0 () Int)
(declare-fun x1 () Int)
(declare-fun x2 () Int)
(declare-fun x3 () Int)
(declare-fun x4 () Int)
(declare-fun x5 () Int)
(declare-fun x6 () Int)
(declare-fun x7 () Int)
(declare-fun x8 () Int)
(declare-fun x9 () Int)

(assert (and 
(<= 9 (+ (* (- 2) x0) (+ (* 2 x4) (+ (* (- 2) x5) (+ (* (- 1) x6) (* 2 x7) ))))) 
(<= 9 (+ (* (- 1) x1) (+ (* 2 x2) (+ (* (- 2) x3) (+ (* 1 x4) (* (- 1) x8) ))))) 
(<= 2 (+ (* 1 x0) (+ (* (- 2) x1) (+ (* (- 2) x2) (+ (* (- 2) x3) (+ (* 2 x4) (+ (* 2 x8) (* (- 2) x9) ))))))) 
(<= 0 (+ (* (- 1) x0) (+ (* (- 2) x1) (+ (* (- 2) x2) (+ (* (- 2) x5) (+ (* (- 2) x6) (+ (* (- 2) x7) (+ (* 1 x8) (* (- 2) x9) )))))))) 
(<= 16 (+ (* 1 x0) (+ (* (- 2) x1) (+ (* (- 1) x2) (+ (* (- 1) x3) (+ (* (- 1) x5) (+ (* (- 1) x6) (+ (* 2 x7) (* 1 x9) )))))))) 
(<= (- 4) (+ (* 2 x2) (+ (* (- 2) x3) (+ (* 1 x4) (+ (* (- 1) x5) (+ (* 1 x7) (+ (* 2 x8) (* (- 2) x9) ))))))) 
(<= 15 (+ (* (- 2) x1) (+ (* 1 x4) (+ (* 2 x6) (+ (* 1 x7) (* (- 2) x8) ))))) 
(<= (- 9) (+ (* (- 2) x0) (+ (* 2 x1) (+ (* 1 x6) (+ (* 1 x7) (* (- 1) x9) ))))) 
(<= 2 (+ (* (- 1) x0) (+ (* 1 x1) (+ (* (- 1) x3) (+ (* (- 2) x4) (+ (* 1 x5) (+ (* 2 x7) (+ (* (- 2) x8) (* (- 1) x9) )))))))) 
(<= (- 74) (+ (* 5 x0) (+ (* 8 x1) (+ (* 3 x2) (+ (* 19 x3) (+ (* (- 8) x4) (+ (* 2 x5) (+ (* (- 17) x7) (+ (* 2 x8) (* 14 x9) ))))))))) 
(<= 77 (+ (* 9 x0) (+ (* (- 10) x1) (+ (* (- 8) x2) (+ (* (- 2) x3) (+ (* 10 x4) (+ (* 5 x5) (+ (* 3 x6) (+ (* 5 x7) (+ (* (- 3) x8) (* 7 x9) )))))))))) 
(<= (- 130) (+ (* (- 8) x0) (+ (* 25 x1) (+ (* 16 x2) (+ (* 12 x3) (+ (* (- 17) x4) (+ (* 4 x5) (+ (* 2 x6) (+ (* (- 6) x7) (+ (* (- 3) x8) (* 4 x9) )))))))))) 
(<= (- 73) (+ (* (- 27) x0) (+ (* 9 x1) (+ (* 17 x2) (+ (* (- 24) x3) (+ (* (- 13) x4) (+ (* (- 19) x5) (+ (* (- 7) x6) (+ (* 14 x7) (+ (* 8 x8) (* (- 39) x9) )))))))))) 
(<= 241 (+ (* 22 x0) (+ (* (- 29) x1) (+ (* (- 34) x2) (+ (* (- 15) x3) (+ (* 32 x4) (+ (* 17 x5) (+ (* 2 x6) (+ (* 20 x7) (+ (* (- 9) x8) (* 15 x9) )))))))))) 
(<= 85 (+ (* (- 3) x0) (+ (* (- 25) x1) (+ (* (- 16) x2) (+ (* (- 23) x3) (+ (* 4 x4) (+ (* (- 11) x5) (+ (* (- 7) x6) (+ (* 5 x7) (+ (* 6 x8) (* (- 26) x9) ))))))))))))
(check-sat)
(exit)