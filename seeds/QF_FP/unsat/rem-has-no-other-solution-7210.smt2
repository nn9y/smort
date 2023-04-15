(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.4607738576653936934945932080154307186603546142578125p-646 {- 2075140973683933 -646 (-5.00272e-195)}
; Y = 1.9499330407391430863839332232601009309291839599609375p394 {+ 4278118088299727 394 (7.86752e+118)}
; -1.4607738576653936934945932080154307186603546142578125p-646 % 1.9499330407391430863839332232601009309291839599609375p394 == -1.4607738576653936934945932080154307186603546142578125p-646
; [HW: -1.4607738576653936934945932080154307186603546142578125p-646] 

; mpf : - 2075140973683933 -646
; mpfd: - 2075140973683933 -646 (-5.00272e-195) class: Neg. norm. non-zero
; hwf : - 2075140973683933 -646 (-5.00272e-195) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00101111001 #b0111010111110101010001101000100110000110010011011101)))
(assert (= y (fp #b0 #b10110001001 #b1111001100101110110011111100111101011101010011001111)))
(assert (= r (fp #b1 #b00101111001 #x75f54689864dd)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)