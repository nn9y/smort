(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.3233149847277001498468962381593883037567138671875p534 {- 1456081244742968 534 (-7.44185e+160)}
; Y = -1.9844038503153169639148245551041327416896820068359375p-848 {- 4433360813462143 -848 (-1.05729e-255)}
; -1.3233149847277001498468962381593883037567138671875p534 M -1.9844038503153169639148245551041327416896820068359375p-848 == -1.9844038503153169639148245551041327416896820068359375p-848
; [HW: -1.9844038503153169639148245551041327416896820068359375p-848] 

; mpf : - 4433360813462143 -848
; mpfd: - 4433360813462143 -848 (-1.05729e-255) class: Neg. norm. non-zero
; hwf : - 4433360813462143 -848 (-1.05729e-255) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b11000010101 #b0101001011000100110001010101010110110110010100111000)))
(assert (= y (fp #b1 #b00010101111 #b1111110000000001111001000000011100101001001001111111)))
(assert (= r (fp #b1 #b00010101111 #b1111110000000001111001000000011100101001001001111111)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)