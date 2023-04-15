(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.2929584989718778675893418039777316153049468994140625p293 {+ 1319367786804769 293 (2.05766e+088)}
; Y = 1.771862272151952577559086421388201415538787841796875p-844 {+ 3476158641244878 -844 (1.51048e-254)}
; 1.2929584989718778675893418039777316153049468994140625p293 + 1.771862272151952577559086421388201415538787841796875p-844 == 1.2929584989718778675893418039777316153049468994140625p293
; [HW: 1.2929584989718778675893418039777316153049468994140625p293] 

; mpf : + 1319367786804769 293
; mpfd: + 1319367786804769 293 (2.05766e+088) class: Pos. norm. non-zero
; hwf : + 1319367786804769 293 (2.05766e+088) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10100100100 #b0100101011111111010101000000010000101011011000100001)))
(assert (= y (fp #b0 #b00010110011 #b1100010110011000110001000000111111101000101011001110)))
(assert (= r (fp #b0 #b10100100100 #b0100101011111111010101000000010000101011011000100001)))
(assert  (not (= (fp.add roundNearestTiesToEven x y) r)))
(check-sat)
(exit)