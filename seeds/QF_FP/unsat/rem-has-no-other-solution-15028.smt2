(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.0289504855350823930848491727374494075775146484375p-841 {- 130381395867992 -841 (-7.01727e-254)}
; Y = 1.94786857673303526183872236288152635097503662109375p-443 {+ 4268820568971100 -443 (8.57574e-134)}
; -1.0289504855350823930848491727374494075775146484375p-841 % 1.94786857673303526183872236288152635097503662109375p-443 == -1.0289504855350823930848491727374494075775146484375p-841
; [HW: -1.0289504855350823930848491727374494075775146484375p-841] 

; mpf : - 130381395867992 -841
; mpfd: - 130381395867992 -841 (-7.01727e-254) class: Neg. norm. non-zero
; hwf : - 130381395867992 -841 (-7.01727e-254) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00010110110 #b0000011101101001010011001000110010010011100101011000)))
(assert (= y (fp #b0 #b01001000100 #b1111001010100111100000111101100111111001011101011100)))
(assert (= r (fp #b1 #b00010110110 #x07694c8c93958)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)