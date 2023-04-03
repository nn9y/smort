(set-info :smt-lib-version 2.6)
(set-logic NIA)
(set-info :status sat)
(declare-fun a () Int)
(declare-fun b () Int)
(declare-fun c () Int)
(assert (and (= 2 (mod c 256)) (= a b)))
(assert (< (mod c 256) 4))
(assert (not (exists ((d Int)) (let ((.cse0 (mod d 256))) (and (= .cse0 1) (= c (+ .cse0 1)))))))
(check-sat)
(exit)