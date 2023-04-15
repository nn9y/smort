(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.9442176335560230615584487168234772980213165283203125p-157 {- 4252378182639557 -157 (-1.06423e-047)}
; Y = -1.138471200466240507154225269914604723453521728515625p811 {- 623618846821306 811 (-1.55471e+244)}
; -1.9442176335560230615584487168234772980213165283203125p-157 m -1.138471200466240507154225269914604723453521728515625p811 == -1.138471200466240507154225269914604723453521728515625p811
; [HW: -1.138471200466240507154225269914604723453521728515625p811] 

; mpf : - 623618846821306 811
; mpfd: - 623618846821306 811 (-1.55471e+244) class: Neg. norm. non-zero
; hwf : - 623618846821306 811 (-1.55471e+244) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01101100010 #b1111000110111000001111110011000001101101111111000101)))
(assert (= y (fp #b1 #b11100101010 #b0010001101110010110110010011110101110000101110111010)))
(assert (= r (fp #b1 #b11100101010 #b0010001101110010110110010011110101110000101110111010)))
(assert (= (fp.min x y) r))
(check-sat)
(exit)