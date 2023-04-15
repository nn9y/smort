(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.5749036650094792033627300043008290231227874755859375p152 {+ 2589135931510623 152 (8.99111e+045)}
; Y = -1.5259470883847174871306151544558815658092498779296875p969 {- 2368655111266011 969 (-7.61387e+291)}
; Z = 1.0087807457289403867406463177758269011974334716796875p512 {+ 39544963192891 512 (1.35255e+154)}
; 1.5749036650094792033627300043008290231227874755859375p152 x -1.5259470883847174871306151544558815658092498779296875p969 1.0087807457289403867406463177758269011974334716796875p512 == -oo
; [HW: -oo] 

; mpf : - 0 1024
; mpfd: - 0 1024 (-1.#INF) class: -INF
; hwf : - 0 1024 (-1.#INF) class: -INF

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun z () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10010010111 #b1001001100101100111000101111011110010000111101011111)))
(assert (= y (fp #b1 #b11111001000 #b1000011010100100011101111110100000001001111011011011)))
(assert (= z (fp #b0 #b10111111111 #b0000001000111111011101000111011110111101100000111011)))
(assert (= r (_ -oo 11 53)))
(assert  (not (= (fp.fma roundTowardNegative x y z) r)))
(check-sat)
(exit)