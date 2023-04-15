(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.9767507122289933452208288144902326166629791259765625p-980 {- 4398894143628361 -980 (-1.93444e-295)}
; Y = -1.8772460794410559259404180920682847499847412109375p704 {- 3950765116482968 704 (-1.57993e+212)}
; -1.9767507122289933452208288144902326166629791259765625p-980 * -1.8772460794410559259404180920682847499847412109375p704 == 1.85542376228209615618425232241861522197723388671875p-275
; [HW: 1.85542376228209615618425232241861522197723388671875p-275] 

; mpf : + 3852486137057516 -275
; mpfd: + 3852486137057516 -275 (3.05629e-083) class: Pos. norm. non-zero
; hwf : + 3852486137057516 -275 (3.05629e-083) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00000101011 #b1111101000001100010101011010110101011110010001001001)))
(assert (= y (fp #b1 #b11010111111 #b1110000010010011001100101111010110111110010110011000)))
(assert (= r (fp #b0 #b01011101100 #b1101101011111101000011010011101100111001000011101100)))
(assert (= (fp.mul roundTowardNegative x y) r))
(check-sat)
(exit)