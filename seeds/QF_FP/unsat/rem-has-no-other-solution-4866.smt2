(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.269758710608169138822631794027984142303466796875p241 {+ 1214885228574896 241 (4.48694e+072)}
; Y = 1.318136177378751217048602484283037483692169189453125p-226 {+ 1432757969896018 -226 (1.22231e-068)}
; 1.269758710608169138822631794027984142303466796875p241 % 1.318136177378751217048602484283037483692169189453125p-226 == 1.50922562299295837107138140709139406681060791015625p-227
; [HW: 1.50922562299295837107138140709139406681060791015625p-227] 

; mpf : + 2293348325958596 -227
; mpfd: + 2293348325958596 -227 (6.99754e-069) class: Pos. norm. non-zero
; hwf : + 2293348325958596 -227 (6.99754e-069) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10011110000 #b0100010100001110111010000010011111011111100010110000)))
(assert (= y (fp #b0 #b01100011101 #b0101000101110001010111110101110110000100001001010010)))
(assert (= r (fp #b1 #b01100011100 #x20862275fe0e0)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)