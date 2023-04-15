(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.6080637590544142323523146842489950358867645263671875p790 {+ 2738475718694963 790 (1.04713e+238)}
; Y = -1.5758627852918787315417148420237936079502105712890625p591 {- 2593455425257041 591 (-1.27716e+178)}
; 1.6080637590544142323523146842489950358867645263671875p790 + -1.5758627852918787315417148420237936079502105712890625p591 == 1.6080637590544142323523146842489950358867645263671875p790
; [HW: 1.6080637590544142323523146842489950358867645263671875p790] 

; mpf : + 2738475718694963 790
; mpfd: + 2738475718694963 790 (1.04713e+238) class: Pos. norm. non-zero
; hwf : + 2738475718694963 790 (1.04713e+238) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11100010101 #b1001101110101010000100010000011100000101100000110011)))
(assert (= y (fp #b1 #b11001001110 #b1001001101101011101111100101010111001111111001010001)))
(assert (= r (fp #b0 #b11100010101 #b1001101110101010000100010000011100000101100000110011)))
(assert  (not (= (fp.add roundNearestTiesToEven x y) r)))
(check-sat)
(exit)