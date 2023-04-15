(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.3973432545740755994501114400918595492839813232421875p812 {+ 1789474933237987 812 (3.81645e+244)}
; Y = -1.11426252632829037025885554612614214420318603515625p-537 {- 514592670994500 -537 (-2.47674e-162)}
; 1.3973432545740755994501114400918595492839813232421875p812 / -1.11426252632829037025885554612614214420318603515625p-537 == -1.9999999999999997779553950749686919152736663818359375p1023
; [HW: -1.9999999999999997779553950749686919152736663818359375p1023] 

; mpf : - 4503599627370495 1023
; mpfd: - 4503599627370495 1023 (-1.79769e+308) class: Neg. norm. non-zero
; hwf : - 4503599627370495 1023 (-1.79769e+308) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11100101011 #b0110010110111000010010011001101110101110100011100011)))
(assert (= y (fp #b1 #b00111100110 #b0001110101000000010011110001010110111101000001000100)))
(assert (= r (fp #b1 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
(assert  (not (= (fp.div roundTowardPositive x y) r)))
(check-sat)
(exit)