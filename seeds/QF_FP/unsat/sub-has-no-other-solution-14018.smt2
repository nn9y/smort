(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.1917883584362154447688908476266078650951385498046875p-524 {- 863737979587339 -524 (-2.17011e-158)}
; Y = -1.025958057782084598130722952191717922687530517578125p-853 {- 116904699354658 -853 (-1.70822e-257)}
; -1.1917883584362154447688908476266078650951385498046875p-524 - -1.025958057782084598130722952191717922687530517578125p-853 == -1.191788358436215222724285922595299780368804931640625p-524
; [HW: -1.191788358436215222724285922595299780368804931640625p-524] 

; mpf : - 863737979587338 -524
; mpfd: - 863737979587338 -524 (-2.17011e-158) class: Neg. norm. non-zero
; hwf : - 863737979587338 -524 (-2.17011e-158) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00111110011 #b0011000100011001000010101011011100111100101100001011)))
(assert (= y (fp #b1 #b00010101010 #b0000011010100101001011111111000100111101111000100010)))
(assert (= r (fp #b1 #b00111110011 #b0011000100011001000010101011011100111100101100001010)))
(assert  (not (= (fp.sub roundTowardPositive x y) r)))
(check-sat)
(exit)