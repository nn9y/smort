(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.725917344190967650519041853840462863445281982421875p77 {+ 3269241080800222 77 (2.60813e+023)}
; Y = -1.3288306736611563696470739159849472343921661376953125p271 {- 1480921699368373 271 (-5.04195e+081)}
; Z = 1.90634678978134264326627089758403599262237548828125p-507 {+ 4081823064727700 -507 (4.54982e-153)}
; 1.725917344190967650519041853840462863445281982421875p77 x -1.3288306736611563696470739159849472343921661376953125p271 1.90634678978134264326627089758403599262237548828125p-507 == -1.1467259535823786098518439757754094898700714111328125p349
; [HW: -1.1467259535823786098518439757754094898700714111328125p349] 

; mpf : - 660794949879181 349
; mpfd: - 660794949879181 349 (-1.31501e+105) class: Neg. norm. non-zero
; hwf : - 660794949879181 349 (-1.31501e+105) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun z () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10001001100 #b1011100111010101101110000001010011100110001111011110)))
(assert (= y (fp #b1 #b10100001110 #b0101010000101110001111110011110101001011110110110101)))
(assert (= z (fp #b0 #b01000000100 #b1110100000000110010101111101110011110010000010010100)))
(assert (= r (fp #b1 #b10101011100 #b0010010110001111110101010000010000011100010110001101)))
(assert  (not (= (fp.fma roundTowardPositive x y z) r)))
(check-sat)
(exit)