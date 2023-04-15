(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.9121814191827091189423981631989590823650360107421875p-690 {- 4108099899525539 -690 (-3.72248e-208)}
; Y = 1.156876557244022496462321214494295418262481689453125p321 {+ 706509204747346 321 (4.94215e+096)}
; -1.9121814191827091189423981631989590823650360107421875p-690 - 1.156876557244022496462321214494295418262481689453125p321 == -1.1568765572440227185069261395256035029888153076171875p321
; [HW: -1.1568765572440227185069261395256035029888153076171875p321] 

; mpf : - 706509204747347 321
; mpfd: - 706509204747347 321 (-4.94215e+096) class: Neg. norm. non-zero
; hwf : - 706509204747347 321 (-4.94215e+096) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00101001101 #b1110100110000100101110001011001101101000100110100011)))
(assert (= y (fp #b0 #b10101000000 #b0010100000101001000011111110001011011111010001010010)))
(assert (= r (fp #b1 #b10101000000 #b0010100000101001000011111110001011011111010001010011)))
(assert  (not (= (fp.sub roundTowardNegative x y) r)))
(check-sat)
(exit)