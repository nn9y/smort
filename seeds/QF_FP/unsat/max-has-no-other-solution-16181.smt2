(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.628012600722761771265822972054593265056610107421875p635 {+ 2828317314599006 635 (2.32116e+191)}
; Y = -1.414524281574071284950377958011813461780548095703125p-418 {- 1866851400033010 -418 (-2.08964e-126)}
; 1.628012600722761771265822972054593265056610107421875p635 M -1.414524281574071284950377958011813461780548095703125p-418 == 1.628012600722761771265822972054593265056610107421875p635
; [HW: 1.628012600722761771265822972054593265056610107421875p635] 

; mpf : + 2828317314599006 635
; mpfd: + 2828317314599006 635 (2.32116e+191) class: Pos. norm. non-zero
; hwf : + 2828317314599006 635 (2.32116e+191) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11001111010 #b1010000011000101011011110000110110010100100001011110)))
(assert (= y (fp #b1 #b01001011101 #b0110101000011110010000110110100011000010001011110010)))
(assert (= r (fp #b0 #b11001111010 #b1010000011000101011011110000110110010100100001011110)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)