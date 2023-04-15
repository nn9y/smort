(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.7185378932183164035762956700637005269527435302734375p-619 {+ 3236006988149591 -619 (7.89936e-187)}
; Y = -1.528507797387534505872963563888333737850189208984375p643 {- 2380187519376902 643 (-5.57898e+193)}
; 1.7185378932183164035762956700637005269527435302734375p-619 M -1.528507797387534505872963563888333737850189208984375p643 == 1.7185378932183164035762956700637005269527435302734375p-619
; [HW: 1.7185378932183164035762956700637005269527435302734375p-619] 

; mpf : + 3236006988149591 -619
; mpfd: + 3236006988149591 -619 (7.89936e-187) class: Pos. norm. non-zero
; hwf : + 3236006988149591 -619 (7.89936e-187) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00110010100 #b1011011111110010000110010111000001001111001101010111)))
(assert (= y (fp #b1 #b11010000010 #b1000011101001100010010010111100101110101111000000110)))
(assert (= r (fp #b0 #b00110010100 #b1011011111110010000110010111000001001111001101010111)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)