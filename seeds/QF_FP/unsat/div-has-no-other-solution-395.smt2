(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.561080988709385497514858798240311443805694580078125p-833 {+ 2526884131676258 -833 (2.72546e-251)}
; Y = -1.2494409891536666368239139046636410057544708251953125p-41 {- 1123382345803381 -41 (-5.6818e-013)}
; 1.561080988709385497514858798240311443805694580078125p-833 / -1.2494409891536666368239139046636410057544708251953125p-41 == -1.24942354401772437455520048388279974460601806640625p-792
; [HW: -1.24942354401772437455520048388279974460601806640625p-792] 

; mpf : - 1123303779895652 -792
; mpfd: - 1123303779895652 -792 (-4.79682e-239) class: Neg. norm. non-zero
; hwf : - 1123303779895652 -792 (-4.79682e-239) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00010111110 #b1000111110100011000000001111000011101010000001100010)))
(assert (= y (fp #b1 #b01111010110 #b0011111111011011010111010101101010110010011001110101)))
(assert (= r (fp #b1 #b00011100111 #b0011111111011010001110001010110001101000100101100100)))
(assert  (not (= (fp.div roundTowardZero x y) r)))
(check-sat)
(exit)