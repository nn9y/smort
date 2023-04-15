(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.43171363105569948714901329367421567440032958984375p-478 {- 1944265347953212 -478 (-1.8345e-144)}
; Y = -1.4217828512215129332929564043297432363033294677734375p132 {- 1899541091592471 132 (-7.74092e+039)}
; -1.43171363105569948714901329367421567440032958984375p-478 m -1.4217828512215129332929564043297432363033294677734375p132 == -1.4217828512215129332929564043297432363033294677734375p132
; [HW: -1.4217828512215129332929564043297432363033294677734375p132] 

; mpf : - 1899541091592471 132
; mpfd: - 1899541091592471 132 (-7.74092e+039) class: Neg. norm. non-zero
; hwf : - 1899541091592471 132 (-7.74092e+039) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01000100001 #b0110111010000100110010001101011010011111001000111100)))
(assert (= y (fp #b1 #b10010000011 #b0110101111111001111101100000000000000010100100010111)))
(assert (= r (fp #b1 #b10010000011 #b0110101111111001111101100000000000000010100100010111)))
(assert  (not (= (fp.min x y) r)))
(check-sat)
(exit)