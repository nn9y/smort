(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.9962346774262227366847355369827710092067718505859375p735 {+ 4486642122030303 735 (3.60793e+221)}
; Y = -1.052853565375147848470760436612181365489959716796875p-537 {- 238031297328718 -537 (-2.34024e-162)}
; 1.9962346774262227366847355369827710092067718505859375p735 m -1.052853565375147848470760436612181365489959716796875p-537 == -1.052853565375147848470760436612181365489959716796875p-537
; [HW: -1.052853565375147848470760436612181365489959716796875p-537] 

; mpf : - 238031297328718 -537
; mpfd: - 238031297328718 -537 (-2.34024e-162) class: Neg. norm. non-zero
; hwf : - 238031297328718 -537 (-2.34024e-162) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11011011110 #b1111111100001001001111000101111010101111110011011111)))
(assert (= y (fp #b1 #b00111100110 #b0000110110000111110011111010111011000011011001001110)))
(assert (= r (fp #b1 #b00111100110 #b0000110110000111110011111010111011000011011001001110)))
(assert (= (fp.min x y) r))
(check-sat)
(exit)