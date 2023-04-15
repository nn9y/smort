(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.25155003673616338488727706135250627994537353515625p-457 {- 1132880651710020 -457 (-3.3631e-138)}
; Y = 1.1994499223585586289431148543371818959712982177734375p600 {+ 898242596013079 600 (4.97714e+180)}
; -1.25155003673616338488727706135250627994537353515625p-457 - 1.1994499223585586289431148543371818959712982177734375p600 == -1.1994499223585586289431148543371818959712982177734375p600
; [HW: -1.1994499223585586289431148543371818959712982177734375p600] 

; mpf : - 898242596013079 600
; mpfd: - 898242596013079 600 (-4.97714e+180) class: Neg. norm. non-zero
; hwf : - 898242596013079 600 (-4.97714e+180) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01000110110 #b0100000001100101100101010100110100010110111001000100)))
(assert (= y (fp #b0 #b11001010111 #b0011001100001111001001100110110110111000010000010111)))
(assert (= r (fp #b1 #b11001010111 #b0011001100001111001001100110110110111000010000010111)))
(assert  (not (= (fp.sub roundNearestTiesToEven x y) r)))
(check-sat)
(exit)