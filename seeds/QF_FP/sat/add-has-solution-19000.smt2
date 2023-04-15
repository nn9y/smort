(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 0.79103487276524742100036746705882251262664794921875p-1022 {+ 3562504358222636 -1023 (1.76011e-308)}
; Y = -1.573080084415149126897404130431823432445526123046875p33 {- 2580923254625518 33 (-1.35127e+010)}
; 0.79103487276524742100036746705882251262664794921875p-1022 + -1.573080084415149126897404130431823432445526123046875p33 == -1.5730800844151489048527992054005153477191925048828125p33
; [HW: -1.5730800844151489048527992054005153477191925048828125p33] 

; mpf : - 2580923254625517 33
; mpfd: - 2580923254625517 33 (-1.35127e+010) class: Neg. norm. non-zero
; hwf : - 2580923254625517 33 (-1.35127e+010) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00000000000 #b1100101010000001010000101110110010000101101100101100)))
(assert (= y (fp #b1 #b10000100000 #b1001001010110101011000000101110010001101010011101110)))
(assert (= r (fp #b1 #b10000100000 #b1001001010110101011000000101110010001101010011101101)))
(assert (= (fp.add roundTowardPositive x y) r))
(check-sat)
(exit)