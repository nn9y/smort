(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.1191380743572540978902907227165997028350830078125p-299 {- 536550187280968 -299 (-1.09879e-090)}
; Y = -1.50039148439977854110338739701546728610992431640625p534 {- 2253562902682212 534 (-8.43766e+160)}
; -1.1191380743572540978902907227165997028350830078125p-299 % -1.50039148439977854110338739701546728610992431640625p534 == -1.1191380743572540978902907227165997028350830078125p-299
; [HW: -1.1191380743572540978902907227165997028350830078125p-299] 

; mpf : - 536550187280968 -299
; mpfd: - 536550187280968 -299 (-1.09879e-090) class: Neg. norm. non-zero
; hwf : - 536550187280968 -299 (-1.09879e-090) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01011010100 #b0001111001111111110101010011010100010010101001001000)))
(assert (= y (fp #b1 #b11000010101 #b1000000000011001101010000000010010110001101001100100)))
(assert (= r (fp #b1 #b01011010100 #x1e7fd53512a48)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)