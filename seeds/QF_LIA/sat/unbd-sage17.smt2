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
(<= 7 (+ (* (- 1) x0) (+ (* 2 x1) (+ (* 2 x2) (+ (* (- 2) x3) (+ (* (- 2) x4) (+ (* (- 2) x5) (+ (* (- 1) x6) (+ (* (- 1) x7) (* (- 1) x9) ))))))))) 
(<= 12 (+ (* 1 x0) (+ (* 1 x1) (+ (* 1 x2) (+ (* (- 1) x3) (+ (* 1 x4) (+ (* 2 x5) (+ (* 1 x7) (+ (* (- 2) x8) (* 1 x9) ))))))))) 
(<= 1 (+ (* (- 1) x3) (* (- 2) x9) )) 
(<= 1 (+ (* (- 2) x4) (+ (* 2 x5) (+ (* 2 x7) (* 2 x8) )))) 
(<= 4 (+ (* 2 x0) (+ (* 1 x1) (+ (* (- 1) x2) (+ (* 2 x3) (+ (* 1 x4) (+ (* 1 x5) (* (- 1) x8) ))))))) 
(<= 9 (+ (* 1 x2) (+ (* (- 1) x3) (+ (* 1 x4) (+ (* (- 2) x6) (+ (* (- 1) x7) (+ (* (- 2) x8) (* 1 x9) ))))))) 
(<= (- 7) (+ (* (- 2) x0) (+ (* (- 1) x1) (+ (* (- 1) x2) (+ (* 2 x4) (+ (* 2 x6) (+ (* 2 x7) (* (- 2) x9) ))))))) 
(<= (- 3) (+ (* (- 1) x0) (+ (* 1 x2) (+ (* 2 x3) (+ (* 1 x4) (+ (* (- 1) x5) (+ (* (- 1) x6) (+ (* (- 2) x7) (* 2 x8) )))))))) 
(<= (- 7) (+ (* 2 x0) (+ (* (- 1) x2) (+ (* 1 x3) (+ (* 2 x6) (+ (* 2 x8) (* (- 2) x9) )))))) 
(<= (- 38) (+ (* 3 x0) (+ (* (- 7) x1) (+ (* (- 7) x2) (+ (* (- 3) x4) (+ (* (- 1) x7) (+ (* (- 12) x8) (* 21 x9) ))))))) 
(<= (- 66) (+ (* (- 8) x0) (+ (* (- 6) x1) (+ (* (- 4) x2) (+ (* (- 7) x3) (+ (* (- 7) x4) (+ (* (- 10) x5) (+ (* 5 x6) (+ (* 1 x7) (+ (* 1 x8) (* (- 1) x9) )))))))))) 
(<= 266 (+ (* 35 x0) (+ (* 24 x1) (+ (* 13 x2) (+ (* 23 x3) (+ (* 25 x4) (+ (* 38 x5) (+ (* (- 20) x6) (+ (* (- 3) x7) (+ (* (- 16) x8) (* 13 x9) )))))))))) 
(<= 47 (+ (* 8 x0) (+ (* 4 x1) (+ (* 4 x2) (+ (* 16 x3) (+ (* 9 x4) (+ (* 9 x5) (+ (* (- 7) x6) (+ (* (- 6) x7) (+ (* 16 x8) (* (- 12) x9) )))))))))) 
(<= 232 (+ (* 6 x0) (+ (* 24 x1) (+ (* 27 x2) (+ (* 6 x3) (+ (* 17 x4) (+ (* 22 x5) (+ (* (- 16) x6) (+ (* 1 x7) (+ (* 22 x8) (* (- 39) x9) )))))))))) 
(<= (- 222) (+ (* (- 28) x0) (+ (* (- 24) x1) (+ (* (- 16) x2) (+ (* (- 27) x3) (+ (* (- 22) x4) (+ (* (- 34) x5) (+ (* 12 x6) (+ (* 1 x7) (+ (* (- 15) x8) (* 15 x9) ))))))))))))
(check-sat)
(exit)