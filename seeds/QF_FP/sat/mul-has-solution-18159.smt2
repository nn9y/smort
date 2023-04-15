(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.9012867822095820269368005028809420764446258544921875p-371 {+ 4059034816513027 -371 (3.95293e-112)}
; Y = -1.8046471383218054551633713344926945865154266357421875p508 {- 3623808552310819 508 (-1.51227e+153)}
; 1.9012867822095820269368005028809420764446258544921875p-371 * -1.8046471383218054551633713344926945865154266357421875p508 == -1.7155758753217977830018980966997332870960235595703125p138
; [HW: -1.7155758753217977830018980966997332870960235595703125p138] 

; mpf : - 3222667245454565 138
; mpfd: - 3222667245454565 138 (-5.97791e+041) class: Neg. norm. non-zero
; hwf : - 3222667245454565 138 (-5.97791e+041) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01010001100 #b1110011010111010101110110000010111101000010000000011)))
(assert (= y (fp #b1 #b10111111011 #b1100110111111101010110101101011111101001100000100011)))
(assert (= r (fp #b1 #b10010001001 #b1011011100101111111110110000011001010000010011100101)))
(assert (= (fp.mul roundTowardZero x y) r))
(check-sat)
(exit)