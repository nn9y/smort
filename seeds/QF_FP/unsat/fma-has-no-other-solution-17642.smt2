(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.8153508916998546407484127485076896846294403076171875p-750 {+ 3672013972035667 -750 (3.06524e-226)}
; Y = -1.2991114639122283147543157610925845801830291748046875p814 {- 1347078277417355 814 (-1.41926e+245)}
; Z = -1.9257921645395221776908556421403773128986358642578125p902 {- 4169397247242717 902 (-6.51127e+271)}
; 1.8153508916998546407484127485076896846294403076171875p-750 x -1.2991114639122283147543157610925845801830291748046875p814 -1.9257921645395221776908556421403773128986358642578125p902 == -1.9257921645395221776908556421403773128986358642578125p902
; [HW: -1.9257921645395221776908556421403773128986358642578125p902] 

; mpf : - 4169397247242717 902
; mpfd: - 4169397247242717 902 (-6.51127e+271) class: Neg. norm. non-zero
; hwf : - 4169397247242717 902 (-6.51127e+271) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun z () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00100010001 #b1101000010111010110101100000011010011101100001010011)))
(assert (= y (fp #b1 #b11100101101 #b0100110010010010100100011010001101011100100110001011)))
(assert (= z (fp #b1 #b11110000101 #b1110110100000000101101110001110110010111000111011101)))
(assert (= r (fp #b1 #b11110000101 #b1110110100000000101101110001110110010111000111011101)))
(assert  (not (= (fp.fma roundNearestTiesToEven x y z) r)))
(check-sat)
(exit)