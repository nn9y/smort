(set-logic ALL)
(declare-fun a () Int)
(declare-fun b () Int)
(declare-fun c () Int)
(assert (and (= 2 (mod c 256)) (= a b)))
(assert (< (mod c 256) 4))
(assert (not (exists ((v Int)) (let ((e (mod v 256))) (and (= e 1) (= c (+ e 1)))))))
(check-sat)
(exit)