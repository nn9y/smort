(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.739990288232786230793180948239751160144805908203125p-131 {- 3332619986342962 -131 (-6.39171e-040)}
; Y = -1.0107265141742971525928851406206376850605010986328125p-928 {- 48307925238349 -928 (-4.45449e-280)}
; -1.739990288232786230793180948239751160144805908203125p-131 * -1.0107265141742971525928851406206376850605010986328125p-928 == 0.0000000000127957644480147791909985244274139404296875p-1022
; [HW: 0.0000000000127957644480147791909985244274139404296875p-1022] 

; mpf : + 57627 -1023
; mpfd: + 57627 -1023 (2.84715e-319) class: Pos. denorm.
; hwf : + 57627 -1023 (2.84715e-319) class: Pos. denorm.

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01101111100 #b1011110101110000000000001110011101010001010000110010)))
(assert (= y (fp #b1 #b00001011111 #b0000001010111110111110010000101110010100001001001101)))
(assert (= r (fp #b0 #b00000000000 #b0000000000000000000000000000000000001110000100011011)))
(assert (= (fp.mul roundTowardZero x y) r))
(check-sat)
(exit)