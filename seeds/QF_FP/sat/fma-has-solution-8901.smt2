(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.9203874873266741918342859207768924534320831298828125p-47 {- 4145056744960877 -47 (-1.36452e-014)}
; Y = -1.167467134171441767165333658340387046337127685546875p-185 {- 754204923051310 -185 (-2.38065e-056)}
; Z = 1.49409335844044388608153894892893731594085693359375p917 {+ 2225198664958620 917 (1.65533e+276)}
; -1.9203874873266741918342859207768924534320831298828125p-47 x -1.167467134171441767165333658340387046337127685546875p-185 1.49409335844044388608153894892893731594085693359375p917 == 1.49409335844044388608153894892893731594085693359375p917
; [HW: 1.49409335844044388608153894892893731594085693359375p917] 

; mpf : + 2225198664958620 917
; mpfd: + 2225198664958620 917 (1.65533e+276) class: Pos. norm. non-zero
; hwf : + 2225198664958620 917 (1.65533e+276) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun z () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01111010000 #b1110101110011110100000111010110110110111001101101101)))
(assert (= y (fp #b1 #b01101000110 #b0010101011011111001000000100100001101011110100101110)))
(assert (= z (fp #b0 #b11110010100 #b0111111001111100111001101111111110101100001010011100)))
(assert (= r (fp #b0 #b11110010100 #b0111111001111100111001101111111110101100001010011100)))
(assert (= (fp.fma roundTowardZero x y z) r))
(check-sat)
(exit)