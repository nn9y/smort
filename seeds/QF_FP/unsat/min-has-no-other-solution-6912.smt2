(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.876401949311162997702240318176336586475372314453125p-131 {- 3946963492344530 -131 (-6.89281e-040)}
; Y = 1.9922572920159111742322011195938102900981903076171875p-927 {+ 4468729570578515 -927 (1.75606e-279)}
; -1.876401949311162997702240318176336586475372314453125p-131 m 1.9922572920159111742322011195938102900981903076171875p-927 == -1.876401949311162997702240318176336586475372314453125p-131
; [HW: -1.876401949311162997702240318176336586475372314453125p-131] 

; mpf : - 3946963492344530 -131
; mpfd: - 3946963492344530 -131 (-6.89281e-040) class: Neg. norm. non-zero
; hwf : - 3946963492344530 -131 (-6.89281e-040) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01101111100 #b1110000001011011111000001100111001110001001011010010)))
(assert (= y (fp #b0 #b00001100000 #b1111111000000100100100101110101001101101000001010011)))
(assert (= r (fp #b1 #b01101111100 #b1110000001011011111000001100111001110001001011010010)))
(assert  (not (= (fp.min x y) r)))
(check-sat)
(exit)