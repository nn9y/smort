(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.1510395085847131557699185577803291380405426025390625p436 {+ 680221474580337 436 (2.04253e+131)}
; Y = -1.4984858890104015838318218811764381825923919677734375p-459 {- 2244980863996695 -459 (-1.00666e-138)}
; 1.1510395085847131557699185577803291380405426025390625p436 + -1.4984858890104015838318218811764381825923919677734375p-459 == 1.1510395085847131557699185577803291380405426025390625p436
; [HW: 1.1510395085847131557699185577803291380405426025390625p436] 

; mpf : + 680221474580337 436
; mpfd: + 680221474580337 436 (2.04253e+131) class: Pos. norm. non-zero
; hwf : + 680221474580337 436 (2.04253e+131) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10110110011 #b0010011010101010100001100111010111000110011101110001)))
(assert (= y (fp #b1 #b01000110100 #b0111111110011100110001010110111011010001001100010111)))
(assert (= r (fp #b0 #b10110110011 #b0010011010101010100001100111010111000110011101110001)))
(assert  (not (= (fp.add roundNearestTiesToEven x y) r)))
(check-sat)
(exit)