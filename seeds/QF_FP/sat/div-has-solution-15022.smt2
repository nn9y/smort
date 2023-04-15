(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.4603478241268224024906885460950434207916259765625p753 {+ 2073222289198376 753 (6.919e+226)}
; Y = 1.305000578552206746962838224135339260101318359375p140 {+ 1373600491915504 140 (1.81891e+042)}
; 1.4603478241268224024906885460950434207916259765625p753 / 1.305000578552206746962838224135339260101318359375p140 == 1.1190399821484835474194596827146597206592559814453125p613
; [HW: 1.1190399821484835474194596827146597206592559814453125p613] 

; mpf : + 536108419246101 613
; mpfd: + 536108419246101 613 (3.80393e+184) class: Pos. norm. non-zero
; hwf : + 536108419246101 613 (3.80393e+184) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11011110000 #b0111010111011001010110101110000101101000110100101000)))
(assert (= y (fp #b0 #b10010001011 #b0100111000010100100001001001011000100100100011110000)))
(assert (= r (fp #b0 #b11001100100 #b0001111001111001011001110111111000111110100000010101)))
(assert (= (fp.div roundTowardNegative x y) r))
(check-sat)
(exit)