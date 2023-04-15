(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.893476270990350318612627233960665762424468994140625p-454 {- 4023859401096522 -454 (-4.07044e-137)}
; Y = 1.0659537172282520511856773737235926091670989990234375p337 {+ 297029136332855 337 (2.98433e+101)}
; -1.893476270990350318612627233960665762424468994140625p-454 + 1.0659537172282520511856773737235926091670989990234375p337 == 1.0659537172282520511856773737235926091670989990234375p337
; [HW: 1.0659537172282520511856773737235926091670989990234375p337] 

; mpf : + 297029136332855 337
; mpfd: + 297029136332855 337 (2.98433e+101) class: Pos. norm. non-zero
; hwf : + 297029136332855 337 (2.98433e+101) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01000111001 #b1110010010111010110111000110001110100111110101001010)))
(assert (= y (fp #b0 #b10101010000 #b0001000011100010010101111100001010001011100000110111)))
(assert (= r (fp #b0 #b10101010000 #b0001000011100010010101111100001010001011100000110111)))
(assert  (not (= (fp.add roundTowardPositive x y) r)))
(check-sat)
(exit)