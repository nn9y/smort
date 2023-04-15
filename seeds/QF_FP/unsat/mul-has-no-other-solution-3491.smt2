(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.111582812088091287705537979491055011749267578125p707 {- 502524310940880 707 (-7.48426e+212)}
; Y = 1.2585069395630015254283762260456569492816925048828125p494 {+ 1164211756688621 494 (6.43685e+148)}
; -1.111582812088091287705537979491055011749267578125p707 * 1.2585069395630015254283762260456569492816925048828125p494 == -1.9999999999999997779553950749686919152736663818359375p1023
; [HW: -1.9999999999999997779553950749686919152736663818359375p1023] 

; mpf : - 4503599627370495 1023
; mpfd: - 4503599627370495 1023 (-1.79769e+308) class: Neg. norm. non-zero
; hwf : - 4503599627370495 1023 (-1.79769e+308) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b11011000010 #b0001110010010000101100001111000010110110110011010000)))
(assert (= y (fp #b0 #b10111101101 #b0100001000101101100000101100001100110110010011101101)))
(assert (= r (fp #b1 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
(assert  (not (= (fp.mul roundTowardPositive x y) r)))
(check-sat)
(exit)