(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.030204042867961522489395065349526703357696533203125p242 {- 136026916205234 242 (-7.28085e+072)}
; Y = 1.2499113136622803654773861126159317791461944580078125p-297 {+ 1125500499085117 -297 (4.90875e-090)}
; -1.030204042867961522489395065349526703357696533203125p242 M 1.2499113136622803654773861126159317791461944580078125p-297 == 1.2499113136622803654773861126159317791461944580078125p-297
; [HW: 1.2499113136622803654773861126159317791461944580078125p-297] 

; mpf : + 1125500499085117 -297
; mpfd: + 1125500499085117 -297 (4.90875e-090) class: Pos. norm. non-zero
; hwf : + 1125500499085117 -297 (4.90875e-090) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10011110001 #b0000011110111011011100111100000001010011001010110010)))
(assert (= y (fp #b0 #b01011010110 #b0011111111111010001100000001011100010100011100111101)))
(assert (= r (fp #b0 #b01011010110 #b0011111111111010001100000001011100010100011100111101)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)