(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.2200719376338702293338656090782023966312408447265625p170 {- 991115896322601 170 (-1.82593e+051)}
; Y = -1.675839756665113089439955729176290333271026611328125p654 {- 3043711676279170 654 (-1.25271e+197)}
; -1.2200719376338702293338656090782023966312408447265625p170 m -1.675839756665113089439955729176290333271026611328125p654 == -1.675839756665113089439955729176290333271026611328125p654
; [HW: -1.675839756665113089439955729176290333271026611328125p654] 

; mpf : - 3043711676279170 654
; mpfd: - 3043711676279170 654 (-1.25271e+197) class: Neg. norm. non-zero
; hwf : - 3043711676279170 654 (-1.25271e+197) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10010101001 #b0011100001010110101000100110111011100111101000101001)))
(assert (= y (fp #b1 #b11010001101 #b1010110100000011110101011001010000110110100110000010)))
(assert (= r (fp #b1 #b11010001101 #b1010110100000011110101011001010000110110100110000010)))
(assert  (not (= (fp.min x y) r)))
(check-sat)
(exit)