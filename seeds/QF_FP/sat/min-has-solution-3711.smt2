(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.2683665192971924629006252871477045118808746337890625p-1002 {- 1208615356305553 -1002 (-2.9593e-302)}
; Y = 1.5287250197012181018862975179217755794525146484375p504 {+ 2381165801707864 504 (8.00658e+151)}
; -1.2683665192971924629006252871477045118808746337890625p-1002 m 1.5287250197012181018862975179217755794525146484375p504 == -1.2683665192971924629006252871477045118808746337890625p-1002
; [HW: -1.2683665192971924629006252871477045118808746337890625p-1002] 

; mpf : - 1208615356305553 -1002
; mpfd: - 1208615356305553 -1002 (-2.9593e-302) class: Neg. norm. non-zero
; hwf : - 1208615356305553 -1002 (-2.9593e-302) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00000010101 #b0100010010110011101010110000111110111001000010010001)))
(assert (= y (fp #b0 #b10111110111 #b1000011101011010100001011101110000110001100101011000)))
(assert (= r (fp #b1 #b00000010101 #b0100010010110011101010110000111110111001000010010001)))
(assert (= (fp.min x y) r))
(check-sat)
(exit)