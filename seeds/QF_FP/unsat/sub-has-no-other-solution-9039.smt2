(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.5777543821045549865544899148517288267612457275390625p135 {+ 2601974419957745 135 (6.87209e+040)}
; Y = 1.8178364011339798178568116782116703689098358154296875p528 {+ 3683207711397019 528 (1.59732e+159)}
; 1.5777543821045549865544899148517288267612457275390625p135 - 1.8178364011339798178568116782116703689098358154296875p528 == -1.817836401133979595812206753180362284183502197265625p528
; [HW: -1.817836401133979595812206753180362284183502197265625p528] 

; mpf : - 3683207711397018 528
; mpfd: - 3683207711397018 528 (-1.59732e+159) class: Neg. norm. non-zero
; hwf : - 3683207711397018 528 (-1.59732e+159) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10010000110 #b1001001111100111101101100001000001000010011111110001)))
(assert (= y (fp #b0 #b11000001111 #b1101000101011101101110011111010001011001010010011011)))
(assert (= r (fp #b1 #b11000001111 #b1101000101011101101110011111010001011001010010011010)))
(assert  (not (= (fp.sub roundTowardZero x y) r)))
(check-sat)
(exit)