(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.9338681360722318469669289697776548564434051513671875p357 {- 4205768189628083 357 (-5.67721e+107)}
; Y = -1.275744503049619726908758821082301437854766845703125p52 {- 1241842841183730 52 (-5.74544e+015)}
; -1.9338681360722318469669289697776548564434051513671875p357 / -1.275744503049619726908758821082301437854766845703125p52 == 1.515874167162305496958651929162442684173583984375p305
; [HW: 1.515874167162305496958651929162442684173583984375p305] 

; mpf : + 2323290707002224 305
; mpfd: + 2323290707002224 305 (9.88125e+091) class: Pos. norm. non-zero
; hwf : + 2323290707002224 305 (9.88125e+091) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10101100100 #b1110111100010001111110110110111100110100111010110011)))
(assert (= y (fp #b1 #b10000110011 #b0100011010010111001100010001011010100110010111110010)))
(assert (= r (fp #b0 #b10100110000 #b1000010000010000010101000101010011010000001101110000)))
(assert (= (fp.div roundTowardNegative x y) r))
(check-sat)
(exit)