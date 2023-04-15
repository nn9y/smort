(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.087621613240415729961796387215144932270050048828125p-513 {- 394612664739138 -513 (-4.05593e-155)}
; Y = -1.791182913834350909354498071479611098766326904296875p931 {- 3563171075926286 931 (-3.25137e+280)}
; -1.087621613240415729961796387215144932270050048828125p-513 - -1.791182913834350909354498071479611098766326904296875p931 == 1.7911829138343506873098931464483030140399932861328125p931
; [HW: 1.7911829138343506873098931464483030140399932861328125p931] 

; mpf : + 3563171075926285 931
; mpfd: + 3563171075926285 931 (3.25137e+280) class: Pos. norm. non-zero
; hwf : + 3563171075926285 931 (3.25137e+280) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00111111110 #b0001011001101110010111101011101101001010010101000010)))
(assert (= y (fp #b1 #b11110100010 #b1100101010001010111101101010010000010010100100001110)))
(assert (= r (fp #b0 #b11110100010 #b1100101010001010111101101010010000010010100100001101)))
(assert (= (fp.sub roundTowardZero x y) r))
(check-sat)
(exit)