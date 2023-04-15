(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.6921837708067302141756726996391080319881439208984375p-354 {- 3117318572277095 -354 (-4.61136e-107)}
; Y = -1.5061510168145091359548359832842834293842315673828125p193 {- 2279501530719021 193 (-1.89085e+058)}
; -1.6921837708067302141756726996391080319881439208984375p-354 m -1.5061510168145091359548359832842834293842315673828125p193 == -1.5061510168145091359548359832842834293842315673828125p193
; [HW: -1.5061510168145091359548359832842834293842315673828125p193] 

; mpf : - 2279501530719021 193
; mpfd: - 2279501530719021 193 (-1.89085e+058) class: Neg. norm. non-zero
; hwf : - 2279501530719021 193 (-1.89085e+058) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01010011101 #b1011000100110010111101001010001001101111110101100111)))
(assert (= y (fp #b1 #b10011000000 #b1000000110010011000111001111000000001110001100101101)))
(assert (= r (fp #b1 #b10011000000 #b1000000110010011000111001111000000001110001100101101)))
(assert (= (fp.min x y) r))
(check-sat)
(exit)