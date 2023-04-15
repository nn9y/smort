(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.6204285576069203944626906377379782497882843017578125p-954 {- 2794161820848541 -954 (-1.06418e-287)}
; Y = -1.469025401386395035530085806385613977909088134765625p-918 {- 2112302622911066 -918 (-6.62969e-277)}
; -1.6204285576069203944626906377379782497882843017578125p-954 - -1.469025401386395035530085806385613977909088134765625p-918 == 1.4690254013628145646208622565609402954578399658203125p-918
; [HW: 1.4690254013628145646208622565609402954578399658203125p-918] 

; mpf : + 2112302622804869 -918
; mpfd: + 2112302622804869 -918 (6.62969e-277) class: Pos. norm. non-zero
; hwf : + 2112302622804869 -918 (6.62969e-277) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00001000101 #b1001111011010100011001111110110001101101000110011101)))
(assert (= y (fp #b1 #b00001101001 #b0111100000010010000011000111011111110010101001011010)))
(assert (= r (fp #b0 #b00001101001 #b0111100000010010000011000111011111011000101110000101)))
(assert  (not (= (fp.sub roundTowardZero x y) r)))
(check-sat)
(exit)