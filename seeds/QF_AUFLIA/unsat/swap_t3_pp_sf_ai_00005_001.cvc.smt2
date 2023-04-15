(set-info :smt-lib-version 2.6)
(set-logic QF_AUFLIA)
(set-info :source |
Benchmarks used in the followin paper:
Big proof engines as little proof engines: new results on rewrite-based satisfiability procedure
Alessandro Armando, Maria Paola Bonacina, Silvio Ranise, Stephan Schulz. 
PDPAR'05
http://www.ai.dist.unige.it/pdpar05/


|)
(set-info :category "crafted")
(set-info :status unsat)
(declare-fun a_558 () (Array Int Int))
(declare-fun a_559 () (Array Int Int))
(declare-fun a_561 () (Array Int Int))
(declare-fun a_562 () (Array Int Int))
(declare-fun a_564 () (Array Int Int))
(declare-fun a_566 () (Array Int Int))
(declare-fun a_568 () (Array Int Int))
(declare-fun a_570 () (Array Int Int))
(declare-fun a_572 () (Array Int Int))
(declare-fun a_574 () (Array Int Int))
(declare-fun e_557 () Int)
(declare-fun e_560 () Int)
(declare-fun e_563 () Int)
(declare-fun e_565 () Int)
(declare-fun e_567 () Int)
(declare-fun e_569 () Int)
(declare-fun e_571 () Int)
(declare-fun e_573 () Int)
(declare-fun e_576 () Int)
(declare-fun i_575 () Int)
(declare-fun a1 () (Array Int Int))
(declare-fun i0 () Int)
(declare-fun i1 () Int)
(declare-fun i2 () Int)
(declare-fun i3 () Int)
(declare-fun i4 () Int)
(declare-fun sk ((Array Int Int) (Array Int Int)) Int)
(assert (= a_558 (store a1 i1 e_557)))
(assert (= a_559 (store a_558 i1 e_557)))
(assert (= a_561 (store a_559 i3 e_560)))
(assert (= a_562 (store a_561 i3 e_560)))
(assert (= a_564 (store a_562 i2 e_563)))
(assert (= a_566 (store a_564 i3 e_565)))
(assert (= a_568 (store a_566 i3 e_567)))
(assert (= a_570 (store a_568 i4 e_569)))
(assert (= a_572 (store a_570 i3 e_571)))
(assert (= a_574 (store a_572 i0 e_573)))
(assert (= e_557 (select a1 i1)))
(assert (= e_560 (select a_559 i3)))
(assert (= e_563 (select a_562 i3)))
(assert (= e_565 (select a_562 i2)))
(assert (= e_567 (select a_566 i4)))
(assert (= e_569 (select a_566 i3)))
(assert (= e_571 (select a_570 i0)))
(assert (= e_573 (select a_570 i3)))
(assert (= e_576 (select a_574 i_575)))
(assert (= i_575 (sk a_574 a_574)))
(assert (not (= e_576 e_576)))
(check-sat)
(exit)