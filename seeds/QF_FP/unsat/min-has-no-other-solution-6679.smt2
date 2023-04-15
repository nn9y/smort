(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.3235186330769768137116670914110727608203887939453125p899 {+ 1456998395372885 899 (5.59366e+270)}
; Y = -1.9923283561494422588822317266021855175495147705078125p882 {- 4469049614983805 882 (-6.42417e+265)}
; 1.3235186330769768137116670914110727608203887939453125p899 m -1.9923283561494422588822317266021855175495147705078125p882 == -1.9923283561494422588822317266021855175495147705078125p882
; [HW: -1.9923283561494422588822317266021855175495147705078125p882] 

; mpf : - 4469049614983805 882
; mpfd: - 4469049614983805 882 (-6.42417e+265) class: Neg. norm. non-zero
; hwf : - 4469049614983805 882 (-6.42417e+265) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11110000010 #b0101001011010010000111011111110010110110010101010101)))
(assert (= y (fp #b1 #b11101110001 #b1111111000001001001110110010110010001110001001111101)))
(assert (= r (fp #b1 #b11101110001 #b1111111000001001001110110010110010001110001001111101)))
(assert  (not (= (fp.min x y) r)))
(check-sat)
(exit)