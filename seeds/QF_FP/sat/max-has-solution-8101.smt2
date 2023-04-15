(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.8728535103225365521240064481389708817005157470703125p656 {- 3930982743837605 656 (-5.59991e+197)}
; Y = -1.726414087943721309414968345663510262966156005859375p-200 {- 3271478215780022 -200 (-1.07435e-060)}
; -1.8728535103225365521240064481389708817005157470703125p656 M -1.726414087943721309414968345663510262966156005859375p-200 == -1.726414087943721309414968345663510262966156005859375p-200
; [HW: -1.726414087943721309414968345663510262966156005859375p-200] 

; mpf : - 3271478215780022 -200
; mpfd: - 3271478215780022 -200 (-1.07435e-060) class: Neg. norm. non-zero
; hwf : - 3271478215780022 -200 (-1.07435e-060) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b11010001111 #b1101111101110011010100111110000100001000101110100101)))
(assert (= y (fp #b1 #b01100110111 #b1011100111110110010001100000111100010010011010110110)))
(assert (= r (fp #b1 #b01100110111 #b1011100111110110010001100000111100010010011010110110)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)