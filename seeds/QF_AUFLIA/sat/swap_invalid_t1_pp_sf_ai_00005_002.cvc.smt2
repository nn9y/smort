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
(set-info :status sat)
(declare-fun a_481 () (Array Int Int))
(declare-fun a_483 () (Array Int Int))
(declare-fun a_485 () (Array Int Int))
(declare-fun a_487 () (Array Int Int))
(declare-fun a_489 () (Array Int Int))
(declare-fun a_491 () (Array Int Int))
(declare-fun a_493 () (Array Int Int))
(declare-fun a_495 () (Array Int Int))
(declare-fun a_497 () (Array Int Int))
(declare-fun a_499 () (Array Int Int))
(declare-fun a_500 () (Array Int Int))
(declare-fun a_501 () (Array Int Int))
(declare-fun a_503 () (Array Int Int))
(declare-fun a_505 () (Array Int Int))
(declare-fun a_507 () (Array Int Int))
(declare-fun a_509 () (Array Int Int))
(declare-fun a_511 () (Array Int Int))
(declare-fun a_513 () (Array Int Int))
(declare-fun a_515 () (Array Int Int))
(declare-fun a_517 () (Array Int Int))
(declare-fun e_480 () Int)
(declare-fun e_482 () Int)
(declare-fun e_484 () Int)
(declare-fun e_486 () Int)
(declare-fun e_488 () Int)
(declare-fun e_490 () Int)
(declare-fun e_492 () Int)
(declare-fun e_494 () Int)
(declare-fun e_496 () Int)
(declare-fun e_498 () Int)
(declare-fun e_502 () Int)
(declare-fun e_504 () Int)
(declare-fun e_506 () Int)
(declare-fun e_508 () Int)
(declare-fun e_510 () Int)
(declare-fun e_512 () Int)
(declare-fun e_514 () Int)
(declare-fun e_516 () Int)
(declare-fun e_519 () Int)
(declare-fun e_520 () Int)
(declare-fun i_518 () Int)
(declare-fun a1 () (Array Int Int))
(declare-fun i0 () Int)
(declare-fun i1 () Int)
(declare-fun i2 () Int)
(declare-fun i3 () Int)
(declare-fun i4 () Int)
(declare-fun sk ((Array Int Int) (Array Int Int)) Int)
(assert (= a_481 (store a1 i2 e_480)))
(assert (= a_483 (store a_481 i0 e_482)))
(assert (= a_485 (store a_483 i1 e_484)))
(assert (= a_487 (store a_485 i2 e_486)))
(assert (= a_489 (store a_487 i4 e_488)))
(assert (= a_491 (store a_489 i2 e_490)))
(assert (= a_493 (store a_491 i4 e_492)))
(assert (= a_495 (store a_493 i1 e_494)))
(assert (= a_497 (store a_495 i0 e_496)))
(assert (= a_499 (store a_497 i2 e_498)))
(assert (= a_500 (store a1 i0 e_482)))
(assert (= a_501 (store a_500 i2 e_480)))
(assert (= a_503 (store a_501 i2 e_502)))
(assert (= a_505 (store a_503 i1 e_504)))
(assert (= a_507 (store a_505 i2 e_506)))
(assert (= a_509 (store a_507 i4 e_508)))
(assert (= a_511 (store a_509 i1 e_510)))
(assert (= a_513 (store a_511 i4 e_512)))
(assert (= a_515 (store a_513 i0 e_514)))
(assert (= a_517 (store a_515 i3 e_516)))
(assert (= e_480 (select a1 i0)))
(assert (= e_482 (select a1 i2)))
(assert (= e_484 (select a_483 i2)))
(assert (= e_486 (select a_483 i1)))
(assert (= e_488 (select a_487 i2)))
(assert (= e_490 (select a_487 i4)))
(assert (= e_492 (select a_491 i1)))
(assert (= e_494 (select a_491 i4)))
(assert (= e_496 (select a_495 i2)))
(assert (= e_498 (select a_495 i0)))
(assert (= e_502 (select a_501 i1)))
(assert (= e_504 (select a_501 i2)))
(assert (= e_506 (select a_505 i4)))
(assert (= e_508 (select a_505 i2)))
(assert (= e_510 (select a_509 i4)))
(assert (= e_512 (select a_509 i1)))
(assert (= e_514 (select a_513 i3)))
(assert (= e_516 (select a_513 i0)))
(assert (= e_519 (select a_499 i_518)))
(assert (= e_520 (select a_517 i_518)))
(assert (= i_518 (sk a_499 a_517)))
(assert (not (= e_519 e_520)))
(check-sat)
(exit)