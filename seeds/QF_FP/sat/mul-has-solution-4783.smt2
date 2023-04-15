(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.3528617152720532335052894268301315605640411376953125p-826 {- 1589147889412533 -826 (-3.02327e-249)}
; Y = -1.8608218366033744128884563906467519700527191162109375p-54 {- 3876796902559343 -54 (-1.03296e-016)}
; -1.3528617152720532335052894268301315605640411376953125p-826 * -1.8608218366033744128884563906467519700527191162109375p-54 == 1.258717310841466652249209801084361970424652099609375p-879
; [HW: 1.258717310841466652249209801084361970424652099609375p-879] 

; mpf : + 1165159184699926 -879
; mpfd: + 1165159184699926 -879 (3.12293e-265) class: Pos. norm. non-zero
; hwf : + 1165159184699926 -879 (3.12293e-265) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00011000101 #b0101101001010101001001010011011100011010100110110101)))
(assert (= y (fp #b1 #b01111001001 #b1101110001011110110100011110001111100100111001101111)))
(assert (= r (fp #b0 #b00010010000 #b0100001000111011010011000011010011111001001000010110)))
(assert (= (fp.mul roundTowardNegative x y) r))
(check-sat)
(exit)