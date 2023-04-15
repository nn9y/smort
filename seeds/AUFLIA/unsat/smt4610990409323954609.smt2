(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort Color 0)
(declare-fun a () Int)
(declare-fun b () Int)
(declare-fun c () Int)
(declare-fun d () Int)
(declare-fun green () Color)
(declare-fun il_pass () Int)
(declare-fun il_tl () Color)
(declare-fun ml_pass () Int)
(declare-fun ml_tl () Color)
(declare-fun n () Int)
(declare-fun red () Color)

(assert (! (= ml_tl green)
         :named hyp1))
(assert (! (= c 0)
         :named hyp2))
(assert (! (= il_tl green)
         :named hyp3))
(assert (! (= a 0)
         :named hyp4))
(assert (! (< 0 b)
         :named hyp5))
(assert (! (or 
               (< 1 b) 
               (= b 1))
         :named hyp6))
(assert (! (< (+ b 1) d)
         :named hyp7))
(assert (! (< b d)
         :named hyp8))
(assert (! (<= 0 d)
         :named hyp9))
(assert (! (< 0 d)
         :named hyp10))
(assert (! (forall ((x Color)) 
               (or 
                   (= x green) 
                   (= x red)))
         :named hyp11))
(assert (! (<= n d)
         :named hyp12))
(assert (! (or 
               (< 0 n) 
               (< n d))
         :named hyp13))
(assert (! (<= 0 a)
         :named hyp14))
(assert (! (<= 0 b)
         :named hyp15))
(assert (! (<= 0 c)
         :named hyp16))
(assert (! (= n (+ a b c))
         :named hyp17))
(assert (! (<= 0 (+ a b c))
         :named hyp18))
(assert (! (or 
               (= ml_tl red) 
               (= ml_tl green))
         :named hyp19))
(assert (! (or 
               (= il_tl red) 
               (= il_tl green))
         :named hyp20))
(assert (! (=> 
               (= ml_tl red) 
               (= ml_pass 1))
         :named hyp21))
(assert (! (=> 
               (= il_tl red) 
               (= il_pass 1))
         :named hyp22))
(assert (! (or 
               (= il_tl red) 
               (= ml_tl red))
         :named hyp23))
(assert (! (< (+ a b 1) d)
         :named hyp24))
(assert (! (not 
               (= green red))
         :named hyp25))
(assert (! (< (+ a b c) d)
         :named hyp26))
(assert (! (< (+ a b) d)
         :named hyp27))
(assert (not 
            false))
(check-sat)
(exit)
