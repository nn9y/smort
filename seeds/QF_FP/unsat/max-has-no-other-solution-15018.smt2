(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.7631829595084400619242614993709139525890350341796875p757 {- 3437070492057723 757 (-1.33661e+228)}
; Y = 1.6389825427739459495768414853955619037151336669921875p862 {+ 2877721541532995 862 (5.04e+259)}
; -1.7631829595084400619242614993709139525890350341796875p757 M 1.6389825427739459495768414853955619037151336669921875p862 == 1.6389825427739459495768414853955619037151336669921875p862
; [HW: 1.6389825427739459495768414853955619037151336669921875p862] 

; mpf : + 2877721541532995 862
; mpfd: + 2877721541532995 862 (5.04e+259) class: Pos. norm. non-zero
; hwf : + 2877721541532995 862 (5.04e+259) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b11011110100 #b1100001101011111111101010101101111110100000001111011)))
(assert (= y (fp #b0 #b11101011101 #b1010001110010100010111000010001111101101110101000011)))
(assert (= r (fp #b0 #b11101011101 #b1010001110010100010111000010001111101101110101000011)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)