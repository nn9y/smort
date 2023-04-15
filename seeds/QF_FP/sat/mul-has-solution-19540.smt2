(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.4015023331653957416875755370710976421833038330078125p803 {+ 1808205758032061 803 (7.47619e+241)}
; Y = -1.657457148871639862619531413656659424304962158203125p-608 {- 2960923770670386 -608 (-1.56029e-183)}
; 1.4015023331653957416875755370710976421833038330078125p803 * -1.657457148871639862619531413656659424304962158203125p-608 == -1.1614650306326341766549603562452830374240875244140625p196
; [HW: -1.1614650306326341766549603562452830374240875244140625p196] 

; mpf : - 727173851790497 196
; mpfd: - 727173851790497 196 (-1.1665e+059) class: Neg. norm. non-zero
; hwf : - 727173851790497 196 (-1.1665e+059) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11100100010 #b0110011011001000110110110101111000110110100010111101)))
(assert (= y (fp #b1 #b00110011111 #b1010100001001111000111001001100011101100110100110010)))
(assert (= r (fp #b1 #b10011000011 #b0010100101010101110001011011001000000011110010100001)))
(assert (= (fp.mul roundTowardNegative x y) r))
(check-sat)
(exit)