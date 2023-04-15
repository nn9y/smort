(set-info :smt-lib-version 2.6)
(set-logic QF_AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-fun a () Int)
(declare-fun b () Int)
(declare-fun c () Int)
(declare-fun d () Int)
(declare-fun n () Int)

(assert (! (<= 0 a)
         :named hyp1))
(assert (! (< (+ a b) d)
         :named hyp2))
(assert (! (= c 0)
         :named hyp3))
(assert (! (<= 0 d)
         :named hyp4))
(assert (! (< 0 d)
         :named hyp5))
(assert (! (<= n d)
         :named hyp6))
(assert (! (or 
               (< 0 n) 
               (< n d))
         :named hyp7))
(assert (! (<= 0 b)
         :named hyp8))
(assert (! (<= 0 c)
         :named hyp9))
(assert (! (= n (+ a b c))
         :named hyp10))
(assert (! (<= 0 (+ a b c))
         :named hyp11))
(assert (! (not 
               (<= 0 (+ a 1)))
         :named goal))
(check-sat)
(exit)
