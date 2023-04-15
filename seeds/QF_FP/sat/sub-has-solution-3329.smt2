(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.918835929262615369594868752756156027317047119140625p364 {- 4138069148641738 364 (-7.21035e+109)}
; Y = 1.9175279523736088460594828575267456471920013427734375p-985 {+ 4132178544411799 -985 (5.86403e-297)}
; -1.918835929262615369594868752756156027317047119140625p364 - 1.9175279523736088460594828575267456471920013427734375p-985 == -1.9188359292626155916394736777874641120433807373046875p364
; [HW: -1.9188359292626155916394736777874641120433807373046875p364] 

; mpf : - 4138069148641739 364
; mpfd: - 4138069148641739 364 (-7.21035e+109) class: Neg. norm. non-zero
; hwf : - 4138069148641739 364 (-7.21035e+109) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10101101011 #b1110101100111000110101001101101010010010100111001010)))
(assert (= y (fp #b0 #b00000100110 #b1110101011100011000111001010010010011100010010010111)))
(assert (= r (fp #b1 #b10101101011 #b1110101100111000110101001101101010010010100111001011)))
(assert (= (fp.sub roundTowardNegative x y) r))
(check-sat)
(exit)