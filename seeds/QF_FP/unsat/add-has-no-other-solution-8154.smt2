(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.0219433196571563460253173616365529596805572509765625p128 {+ 98823926231241 128 (3.47749e+038)}
; Y = 1.9808481528533838922356835610116831958293914794921875p-650 {+ 4417347375697539 -650 (4.23988e-196)}
; 1.0219433196571563460253173616365529596805572509765625p128 + 1.9808481528533838922356835610116831958293914794921875p-650 == 1.0219433196571563460253173616365529596805572509765625p128
; [HW: 1.0219433196571563460253173616365529596805572509765625p128] 

; mpf : + 98823926231241 128
; mpfd: + 98823926231241 128 (3.47749e+038) class: Pos. norm. non-zero
; hwf : + 98823926231241 128 (3.47749e+038) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10001111111 #b0000010110011110000100111101000001001011000011001001)))
(assert (= y (fp #b0 #b00101110101 #b1111101100011000110111010101001011011000111010000011)))
(assert (= r (fp #b0 #b10001111111 #b0000010110011110000100111101000001001011000011001001)))
(assert  (not (= (fp.add roundNearestTiesToEven x y) r)))
(check-sat)
(exit)