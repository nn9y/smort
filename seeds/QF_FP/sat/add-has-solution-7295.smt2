(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.806394116349628209405864254222251474857330322265625p679 {+ 3631676241905946 679 (4.53085e+204)}
; Y = -1.33671796323772884562686158460564911365509033203125p-329 {- 1516442893766388 -329 (-1.22228e-099)}
; 1.806394116349628209405864254222251474857330322265625p679 + -1.33671796323772884562686158460564911365509033203125p-329 == 1.806394116349628209405864254222251474857330322265625p679
; [HW: 1.806394116349628209405864254222251474857330322265625p679] 

; mpf : + 3631676241905946 679
; mpfd: + 3631676241905946 679 (4.53085e+204) class: Pos. norm. non-zero
; hwf : + 3631676241905946 679 (4.53085e+204) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11010100110 #b1100111001101111110110000100010101101000100100011010)))
(assert (= y (fp #b1 #b01010110110 #b0101011000110011001001100000000000010100111011110100)))
(assert (= r (fp #b0 #b11010100110 #b1100111001101111110110000100010101101000100100011010)))
(assert (= (fp.add roundTowardPositive x y) r))
(check-sat)
(exit)