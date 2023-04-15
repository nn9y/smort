(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.348325406412171023617929677129723131656646728515625p-1008 {+ 1568718170521530 -1008 (4.9154e-304)}
; Y = 1.7261208939315808574832544763921760022640228271484375p-1021 {+ 3270157787336199 -1021 (7.68149e-308)}
; 1.348325406412171023617929677129723131656646728515625p-1008 - 1.7261208939315808574832544763921760022640228271484375p-1021 == 1.3481146982952358914786827881471253931522369384765625p-1008
; [HW: 1.3481146982952358914786827881471253931522369384765625p-1008] 

; mpf : + 1567769225524617 -1008
; mpfd: + 1567769225524617 -1008 (4.91463e-304) class: Pos. norm. non-zero
; hwf : + 1567769225524617 -1008 (4.91463e-304) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00000001111 #b0101100100101011110110101001010011100111111110111010)))
(assert (= y (fp #b0 #b00000000010 #b1011100111100011000011110001010001100000111000000111)))
(assert (= r (fp #b0 #b00000001111 #b0101100100011110000010110111110001101111010110001001)))
(assert  (not (= (fp.sub roundTowardNegative x y) r)))
(check-sat)
(exit)