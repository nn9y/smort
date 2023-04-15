(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.673770315179761158930205056094564497470855712890625p122 {+ 3034391740376874 122 (8.89929e+036)}
; Y = 1.1412903587083851331129835671163164079189300537109375p-98 {+ 636315206830127 -98 (3.60128e-030)}
; 1.673770315179761158930205056094564497470855712890625p122 M 1.1412903587083851331129835671163164079189300537109375p-98 == 1.673770315179761158930205056094564497470855712890625p122
; [HW: 1.673770315179761158930205056094564497470855712890625p122] 

; mpf : + 3034391740376874 122
; mpfd: + 3034391740376874 122 (8.89929e+036) class: Pos. norm. non-zero
; hwf : + 3034391740376874 122 (8.89929e+036) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10001111001 #b1010110001111100001101100001110010110110011100101010)))
(assert (= y (fp #b0 #b01110011101 #b0010010000101011100110101101110111100100100000101111)))
(assert (= r (fp #b0 #b10001111001 #b1010110001111100001101100001110010110110011100101010)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)