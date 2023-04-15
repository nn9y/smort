(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.9105117978639885034652934336918406188488006591796875p-933 {+ 4100580593576699 -933 (2.63126e-281)}
; Y = 1.4005101617350106391057806831668131053447723388671875p-271 {+ 1803737415147891 -271 (3.69111e-082)}
; 1.9105117978639885034652934336918406188488006591796875p-933 m 1.4005101617350106391057806831668131053447723388671875p-271 == 1.9105117978639885034652934336918406188488006591796875p-933
; [HW: 1.9105117978639885034652934336918406188488006591796875p-933] 

; mpf : + 4100580593576699 -933
; mpfd: + 4100580593576699 -933 (2.63126e-281) class: Pos. norm. non-zero
; hwf : + 4100580593576699 -933 (2.63126e-281) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00001011010 #b1110100100010111010011010001101001110010101011111011)))
(assert (= y (fp #b0 #b01011110000 #b0110011010000111110101010111111001011110000101110011)))
(assert (= r (fp #b0 #b00001011010 #b1110100100010111010011010001101001110010101011111011)))
(assert (= (fp.min x y) r))
(check-sat)
(exit)