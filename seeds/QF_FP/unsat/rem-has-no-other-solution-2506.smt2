(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.685065653274408159489894387661479413509368896484375p-183 {+ 3085261420810950 -183 (1.37445e-055)}
; Y = -1.1369339632301933562530393828637897968292236328125p-140 {- 616695745777864 -140 (-8.1571e-043)}
; 1.685065653274408159489894387661479413509368896484375p-183 % -1.1369339632301933562530393828637897968292236328125p-140 == 1.685065653274408159489894387661479413509368896484375p-183
; [HW: 1.685065653274408159489894387661479413509368896484375p-183] 

; mpf : + 3085261420810950 -183
; mpfd: + 3085261420810950 -183 (1.37445e-055) class: Pos. norm. non-zero
; hwf : + 3085261420810950 -183 (1.37445e-055) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01101001000 #b1010111101100000011101100111000001101101001011000110)))
(assert (= y (fp #b1 #b01101110011 #b0010001100001110000110101010110111001001000011001000)))
(assert (= r (fp #b0 #b01101001000 #xaf6076706d2c6)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)