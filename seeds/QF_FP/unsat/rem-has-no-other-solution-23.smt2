(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.2262756376584420525688301495392806828022003173828125p-823 {- 1019054877441581 -823 (-2.19231e-248)}
; Y = 1.8557256598221678611793095114990137517452239990234375p282 {+ 3853845762706487 282 (1.44202e+085)}
; -1.2262756376584420525688301495392806828022003173828125p-823 % 1.8557256598221678611793095114990137517452239990234375p282 == -1.2262756376584420525688301495392806828022003173828125p-823
; [HW: -1.2262756376584420525688301495392806828022003173828125p-823] 

; mpf : - 1019054877441581 -823
; mpfd: - 1019054877441581 -823 (-2.19231e-248) class: Neg. norm. non-zero
; hwf : - 1019054877441581 -823 (-2.19231e-248) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00011001000 #b0011100111101101001100110011111110011111111000101101)))
(assert (= y (fp #b0 #b10100011001 #b1101101100010000110101100011101101001000110000110111)))
(assert (= r (fp #b1 #b00011001000 #x39ed333f9fe2d)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)