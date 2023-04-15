(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.500076104543501376298308969126082956790924072265625p111 {+ 2252142558079002 111 (3.89442e+033)}
; Y = -1.741657792632778534169801787356846034526824951171875p-411 {- 3340129758537406 -411 (-3.29333e-124)}
; 1.500076104543501376298308969126082956790924072265625p111 M -1.741657792632778534169801787356846034526824951171875p-411 == 1.500076104543501376298308969126082956790924072265625p111
; [HW: 1.500076104543501376298308969126082956790924072265625p111] 

; mpf : + 2252142558079002 111
; mpfd: + 2252142558079002 111 (3.89442e+033) class: Pos. norm. non-zero
; hwf : + 2252142558079002 111 (3.89442e+033) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10001101110 #b1000000000000100111111001101001010000110100000011010)))
(assert (= y (fp #b1 #b01001100100 #b1011110111011101010010001111110000101110011010111110)))
(assert (= r (fp #b0 #b10001101110 #b1000000000000100111111001101001010000110100000011010)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)