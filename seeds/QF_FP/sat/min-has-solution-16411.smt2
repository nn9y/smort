(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.316494892117650028495745573309250175952911376953125p-564 {+ 1425366278205714 -564 (2.18023e-170)}
; Y = 1.0204595608328246303386777071864344179630279541015625p-218 {+ 92141670542873 -218 (2.42246e-066)}
; 1.316494892117650028495745573309250175952911376953125p-564 m 1.0204595608328246303386777071864344179630279541015625p-218 == 1.316494892117650028495745573309250175952911376953125p-564
; [HW: 1.316494892117650028495745573309250175952911376953125p-564] 

; mpf : + 1425366278205714 -564
; mpfd: + 1425366278205714 -564 (2.18023e-170) class: Pos. norm. non-zero
; hwf : + 1425366278205714 -564 (2.18023e-170) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00111001011 #b0101000100000101110011110010101011111111000100010010)))
(assert (= y (fp #b0 #b01100100101 #b0000010100111100110101100111100010101010111000011001)))
(assert (= r (fp #b0 #b00111001011 #b0101000100000101110011110010101011111111000100010010)))
(assert (= (fp.min x y) r))
(check-sat)
(exit)