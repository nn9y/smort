(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.004715960375681671479242140776477754116058349609375p-836 {- 21238797390614 -836 (-2.19264e-252)}
; Y = 1.909200068835914532172637336771003901958465576171875p-360 {+ 4094673091214654 -360 (8.1293e-109)}
; -1.004715960375681671479242140776477754116058349609375p-836 * 1.909200068835914532172637336771003901958465576171875p-360 == -0.0000000000000002220446049250313080847263336181640625p-1022
; [HW: -0.0000000000000002220446049250313080847263336181640625p-1022] 

; mpf : - 1 -1023
; mpfd: - 1 -1023 (-4.94066e-324) class: Neg. denorm.
; hwf : - 1 -1023 (-4.94066e-324) class: Neg. denorm.

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00010111011 #b0000000100110101000100001010111110010101001100010110)))
(assert (= y (fp #b0 #b01010010111 #b1110100011000001010101011111000100101011110100111110)))
(assert (= r (fp #b1 #b00000000000 #b0000000000000000000000000000000000000000000000000001)))
(assert (= (fp.mul roundTowardNegative x y) r))
(check-sat)
(exit)