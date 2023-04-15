(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.453501595154155001665685631451196968555450439453125p766 {- 2042389614948178 766 (-5.64147e+230)}
; Y = -1.5916480997792528118139898651861585676670074462890625p-777 {- 2664546161700305 -777 (-2.00235e-234)}
; -1.453501595154155001665685631451196968555450439453125p766 M -1.5916480997792528118139898651861585676670074462890625p-777 == -1.5916480997792528118139898651861585676670074462890625p-777
; [HW: -1.5916480997792528118139898651861585676670074462890625p-777] 

; mpf : - 2664546161700305 -777
; mpfd: - 2664546161700305 -777 (-2.00235e-234) class: Neg. norm. non-zero
; hwf : - 2664546161700305 -777 (-2.00235e-234) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b11011111101 #b0111010000011000101011100011011111011110111101010010)))
(assert (= y (fp #b1 #b00011110110 #b1001011101110110001111111111011101001010110111010001)))
(assert (= r (fp #b1 #b00011110110 #b1001011101110110001111111111011101001010110111010001)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)