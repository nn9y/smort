(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.41507778478773449393202099599875509738922119140625p-369 {+ 1869344156899812 -369 (1.17683e-111)}
; Y = 1.6390180242988547920646169586689211428165435791015625p794 {+ 2877881336115353 794 (1.70766e+239)}
; 1.41507778478773449393202099599875509738922119140625p-369 % 1.6390180242988547920646169586689211428165435791015625p794 == 1.41507778478773449393202099599875509738922119140625p-369
; [HW: 1.41507778478773449393202099599875509738922119140625p-369] 

; mpf : + 1869344156899812 -369
; mpfd: + 1869344156899812 -369 (1.17683e-111) class: Pos. norm. non-zero
; hwf : + 1869344156899812 -369 (1.17683e-111) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01010001110 #b0110101001000010100010011010011011110101100111100100)))
(assert (= y (fp #b0 #b11100011001 #b1010001110010110101011110110101111101011000010011001)))
(assert (= r (fp #b0 #b01010001110 #x6a4289a6f59e4)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)