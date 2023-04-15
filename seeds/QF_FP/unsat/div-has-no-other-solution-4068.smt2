(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.16981708601973632966064542415551841259002685546875p-193 {+ 764788165319628 -193 (9.31813e-059)}
; Y = 1.246565873260583767745401928550563752651214599609375p-690 {+ 1110433974938646 -690 (2.42671e-208)}
; 1.16981708601973632966064542415551841259002685546875p-193 / 1.246565873260583767745401928550563752651214599609375p-690 == 1.8768636477427393938199884360074065625667572021484375p496
; [HW: 1.8768636477427393938199884360074065625667572021484375p496] 

; mpf : + 3949042797228935 496
; mpfd: + 3949042797228935 496 (3.83982e+149) class: Pos. norm. non-zero
; hwf : + 3949042797228935 496 (3.83982e+149) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01100111110 #b0010101101111001001000011110111011000001101111001100)))
(assert (= y (fp #b0 #b00101001101 #b0011111100011110111100001110100111110110110000010110)))
(assert (= r (fp #b0 #b10111101111 #b1110000001111010001000101101001000011011001110000111)))
(assert  (not (= (fp.div roundTowardNegative x y) r)))
(check-sat)
(exit)