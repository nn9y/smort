(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.875929009504485378556637442670762538909912109375p767 {+ 3944833560807408 767 (1.45621e+231)}
; Y = -1.08065541069080239822142175398766994476318359375p940 {- 363239677532512 940 (-1.00435e+283)}
; 1.875929009504485378556637442670762538909912109375p767 - -1.08065541069080239822142175398766994476318359375p940 == 1.0806554106908026202660266790189780294895172119140625p940
; [HW: 1.0806554106908026202660266790189780294895172119140625p940] 

; mpf : + 363239677532513 940
; mpfd: + 363239677532513 940 (1.00435e+283) class: Pos. norm. non-zero
; hwf : + 363239677532513 940 (1.00435e+283) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11011111110 #b1110000000111100111000100011000101110000011111110000)))
(assert (= y (fp #b1 #b11110101011 #b0001010010100101110101010011111100101001100101100000)))
(assert (= r (fp #b0 #b11110101011 #b0001010010100101110101010011111100101001100101100001)))
(assert (= (fp.sub roundTowardPositive x y) r))
(check-sat)
(exit)