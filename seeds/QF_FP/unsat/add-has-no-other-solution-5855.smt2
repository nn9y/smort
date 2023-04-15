(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.3917261593373007055873813442303799092769622802734375p-801 {+ 1764177785222743 -801 (1.04358e-241)}
; Y = 1.652238637637598817065054390695877373218536376953125p268 {+ 2937421685421330 268 (7.83631e+080)}
; 1.3917261593373007055873813442303799092769622802734375p-801 + 1.652238637637598817065054390695877373218536376953125p268 == 1.6522386376375990391096593157271854579448699951171875p268
; [HW: 1.6522386376375990391096593157271854579448699951171875p268] 

; mpf : + 2937421685421331 268
; mpfd: + 2937421685421331 268 (7.83631e+080) class: Pos. norm. non-zero
; hwf : + 2937421685421331 268 (7.83631e+080) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00011011110 #b0110010001001000001010100110001101010111011001010111)))
(assert (= y (fp #b0 #b10100001011 #b1010011011111001000111001000000111010111010100010010)))
(assert (= r (fp #b0 #b10100001011 #b1010011011111001000111001000000111010111010100010011)))
(assert  (not (= (fp.add roundTowardPositive x y) r)))
(check-sat)
(exit)