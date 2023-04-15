(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.2263079425536360655968337596277706325054168701171875p-893 {- 1019200365755539 -893 (-1.85701e-269)}
; Y = 1.8587050170598231613183770605246536433696746826171875p-444 {+ 3867263594851795 -444 (4.09159e-134)}
; -1.2263079425536360655968337596277706325054168701171875p-893 / 1.8587050170598231613183770605246536433696746826171875p-444 == -1.3195293834128245524794920129352249205112457275390625p-450
; [HW: -1.3195293834128245524794920129352249205112457275390625p-450] 

; mpf : - 1439032412071921 -450
; mpfd: - 1439032412071921 -450 (-4.53859e-136) class: Neg. norm. non-zero
; hwf : - 1439032412071921 -450 (-4.53859e-136) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00010000010 #b0011100111101111010100010011110000010111110010010011)))
(assert (= y (fp #b0 #b01001000011 #b1101101111010100000101111000110100101110110111010011)))
(assert (= r (fp #b1 #b01000111101 #b0101000111001100101011010111101111011110011111110001)))
(assert (= (fp.div roundTowardZero x y) r))
(check-sat)
(exit)