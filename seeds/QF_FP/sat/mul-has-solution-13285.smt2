(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.905244127436860335222945650457404553890228271484375p463 {- 4076857115003974 463 (-4.53773e+139)}
; Y = 1.5762797653950333387484761260566301643848419189453125p-916 {+ 2595333336694229 -916 (2.84549e-276)}
; -1.905244127436860335222945650457404553890228271484375p463 * 1.5762797653950333387484761260566301643848419189453125p-916 == -1.501598883108219428805796269443817436695098876953125p-452
; [HW: -1.501598883108219428805796269443817436695098876953125p-452] 

; mpf : - 2259000543055634 -452
; mpfd: - 2259000543055634 -452 (-1.29121e-136) class: Neg. norm. non-zero
; hwf : - 2259000543055634 -452 (-1.29121e-136) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10111001110 #b1110011110111110000101000100001000111100110001000110)))
(assert (= y (fp #b0 #b00001101011 #b1001001110000111000100100001100110110111110111010101)))
(assert (= r (fp #b1 #b01000111011 #b1000000001101000110010001100111010101000111100010010)))
(assert (= (fp.mul roundTowardPositive x y) r))
(check-sat)
(exit)