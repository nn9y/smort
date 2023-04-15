(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.91566732674772044475730581325478851795196533203125p-758 {- 4123799031536372 -758 (-1.26352e-228)}
; Y = 1.9397350839890687979050198919139802455902099609375p921 {+ 4232190574080152 921 (3.4385e+277)}
; -1.91566732674772044475730581325478851795196533203125p-758 - 1.9397350839890687979050198919139802455902099609375p921 == -1.9397350839890687979050198919139802455902099609375p921
; [HW: -1.9397350839890687979050198919139802455902099609375p921] 

; mpf : - 4232190574080152 921
; mpfd: - 4232190574080152 921 (-3.4385e+277) class: Neg. norm. non-zero
; hwf : - 4232190574080152 921 (-3.4385e+277) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00100001001 #b1110101001101001001011001000011001100101101011110100)))
(assert (= y (fp #b0 #b11110011000 #b1111000010010010011110100111110010100011000010011000)))
(assert (= r (fp #b1 #b11110011000 #b1111000010010010011110100111110010100011000010011000)))
(assert  (not (= (fp.sub roundNearestTiesToEven x y) r)))
(check-sat)
(exit)