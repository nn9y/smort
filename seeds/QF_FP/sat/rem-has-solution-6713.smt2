(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -0.36963586847377793986879623844288289546966552734375p-1022 {- 1664691959521276 -1023 (-8.22467e-309)}
; Y = -1.88182281567456843873742400319315493106842041015625p-223 {- 3971376904078788 -223 (-1.39601e-067)}
; -0.36963586847377793986879623844288289546966552734375p-1022 % -1.88182281567456843873742400319315493106842041015625p-223 == -0.36963586847377793986879623844288289546966552734375p-1022
; [HW: -0.36963586847377793986879623844288289546966552734375p-1022] 

; mpf : - 1664691959521276 -1023
; mpfd: - 1664691959521276 -1023 (-8.22467e-309) class: Neg. denorm.
; hwf : - 1664691959521276 -1023 (-8.22467e-309) class: Neg. denorm.

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00000000000 #b0101111010100000011101001100111010000101111111111100)))
(assert (= y (fp #b1 #b01100100000 #b1110000110111111001000111101101000110000010111000100)))
(assert (= r (fp #b1 #b00000000000 #x5ea074ce85ffc)))
(assert (= (fp.rem x y) r))
(check-sat)
(exit)