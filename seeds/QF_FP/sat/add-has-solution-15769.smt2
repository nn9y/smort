(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.580590869074637083713241736404597759246826171875p-997 {+ 2614748821619248 -997 (1.18009e-300)}
; Y = -1.4607167029798926449757345835678279399871826171875p-859 {- 2074883571863608 -859 (-3.80014e-259)}
; 1.580590869074637083713241736404597759246826171875p-997 + -1.4607167029798926449757345835678279399871826171875p-859 == -1.4607167029798926449757345835678279399871826171875p-859
; [HW: -1.4607167029798926449757345835678279399871826171875p-859] 

; mpf : - 2074883571863608 -859
; mpfd: - 2074883571863608 -859 (-3.80014e-259) class: Neg. norm. non-zero
; hwf : - 2074883571863608 -859 (-3.80014e-259) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00000011010 #b1001010010100001100110100110101100001000001000110000)))
(assert (= y (fp #b1 #b00010100100 #b0111010111110001100001111010010000000101000000111000)))
(assert (= r (fp #b1 #b00010100100 #b0111010111110001100001111010010000000101000000111000)))
(assert (= (fp.add roundNearestTiesToEven x y) r))
(check-sat)
(exit)