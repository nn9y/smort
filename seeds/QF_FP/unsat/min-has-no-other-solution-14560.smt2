(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.2880680876051775474167016000137664377689361572265625p79 {- 1297343331996009 79 (-7.78589e+023)}
; Y = -1.863969744906340597623284338624216616153717041015625p924 {- 3890973821219578 924 (-2.64335e+278)}
; -1.2880680876051775474167016000137664377689361572265625p79 m -1.863969744906340597623284338624216616153717041015625p924 == -1.863969744906340597623284338624216616153717041015625p924
; [HW: -1.863969744906340597623284338624216616153717041015625p924] 

; mpf : - 3890973821219578 924
; mpfd: - 3890973821219578 924 (-2.64335e+278) class: Neg. norm. non-zero
; hwf : - 3890973821219578 924 (-2.64335e+278) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10001001110 #b0100100110111110110101001000011101001001000101101001)))
(assert (= y (fp #b1 #b11110011011 #b1101110100101101000111110000011100011011001011111010)))
(assert (= r (fp #b1 #b11110011011 #b1101110100101101000111110000011100011011001011111010)))
(assert  (not (= (fp.min x y) r)))
(check-sat)
(exit)