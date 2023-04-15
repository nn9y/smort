(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.914514925733942884988891819375567138195037841796875p-266 {+ 4118609078760142 -266 (1.61466e-080)}
; Y = -1.2853564983570375801491536549292504787445068359375p271 {- 1285131419668504 271 (-4.877e+081)}
; 1.914514925733942884988891819375567138195037841796875p-266 % -1.2853564983570375801491536549292504787445068359375p271 == 1.914514925733942884988891819375567138195037841796875p-266
; [HW: 1.914514925733942884988891819375567138195037841796875p-266] 

; mpf : + 4118609078760142 -266
; mpfd: + 4118609078760142 -266 (1.61466e-080) class: Pos. norm. non-zero
; hwf : + 4118609078760142 -266 (1.61466e-080) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01011110101 #b1110101000011101101001100111000110111011001011001110)))
(assert (= y (fp #b1 #b10100001110 #b0100100100001101000111111001110000100101000000011000)))
(assert (= r (fp #b0 #b01011110101 #xea1da671bb2ce)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)