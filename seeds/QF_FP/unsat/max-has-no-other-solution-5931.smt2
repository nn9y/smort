(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.205234689862781483071785260108299553394317626953125p915 {- 924294872789522 915 (-3.33824e+275)}
; Y = 1.0574956791265639477472859653062187135219573974609375p-726 {+ 258937519089807 -726 (2.99572e-219)}
; -1.205234689862781483071785260108299553394317626953125p915 M 1.0574956791265639477472859653062187135219573974609375p-726 == 1.0574956791265639477472859653062187135219573974609375p-726
; [HW: 1.0574956791265639477472859653062187135219573974609375p-726] 

; mpf : + 258937519089807 -726
; mpfd: + 258937519089807 -726 (2.99572e-219) class: Pos. norm. non-zero
; hwf : + 258937519089807 -726 (2.99572e-219) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b11110010010 #b0011010010001010010000101011100011110111001000010010)))
(assert (= y (fp #b0 #b00100101001 #b0000111010111000000010010110110110000010100010001111)))
(assert (= r (fp #b0 #b00100101001 #b0000111010111000000010010110110110000010100010001111)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)