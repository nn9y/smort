(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.82166809037681787231122143566608428955078125p-445 {+ 3700464105643264 -445 (2.00503e-134)}
; Y = -1.7877901308460761864438381962827406823635101318359375p-197 {- 3547891339724543 -197 (-8.90036e-060)}
; 1.82166809037681787231122143566608428955078125p-445 % -1.7877901308460761864438381962827406823635101318359375p-197 == 1.82166809037681787231122143566608428955078125p-445
; [HW: 1.82166809037681787231122143566608428955078125p-445] 

; mpf : + 3700464105643264 -445
; mpfd: + 3700464105643264 -445 (2.00503e-134) class: Pos. norm. non-zero
; hwf : + 3700464105643264 -445 (2.00503e-134) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01001000010 #b1101001001011000110101110000100001010101110100000000)))
(assert (= y (fp #b1 #b01100111010 #b1100100110101100100111010011000000011000011011111111)))
(assert (= r (fp #b0 #b01001000010 #xd258d70855d00)))
(assert (= (fp.rem x y) r))
(check-sat)
(exit)