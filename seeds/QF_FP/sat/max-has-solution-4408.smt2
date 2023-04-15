(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.1765268709531808699608745882869698107242584228515625p-527 {+ 795006350245625 -527 (2.6779e-159)}
; Y = 1.9894829513578391466666062115109525620937347412109375p212 {+ 4456235051024623 212 (1.30948e+064)}
; 1.1765268709531808699608745882869698107242584228515625p-527 M 1.9894829513578391466666062115109525620937347412109375p212 == 1.9894829513578391466666062115109525620937347412109375p212
; [HW: 1.9894829513578391466666062115109525620937347412109375p212] 

; mpf : + 4456235051024623 212
; mpfd: + 4456235051024623 212 (1.30948e+064) class: Pos. norm. non-zero
; hwf : + 4456235051024623 212 (1.30948e+064) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00111110000 #b0010110100110000110111010111000110011011111011111001)))
(assert (= y (fp #b0 #b10011010011 #b1111110101001110110000010011010000001000000011101111)))
(assert (= r (fp #b0 #b10011010011 #b1111110101001110110000010011010000001000000011101111)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)