(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.806071707057067765589408736559562385082244873046875p-384 {+ 3630224239536110 -384 (4.5837e-116)}
; Y = 1.2844563415449403720458576572127640247344970703125p149 {+ 1281077473784968 149 (9.16619e+044)}
; 1.806071707057067765589408736559562385082244873046875p-384 M 1.2844563415449403720458576572127640247344970703125p149 == 1.2844563415449403720458576572127640247344970703125p149
; [HW: 1.2844563415449403720458576572127640247344970703125p149] 

; mpf : + 1281077473784968 149
; mpfd: + 1281077473784968 149 (9.16619e+044) class: Pos. norm. non-zero
; hwf : + 1281077473784968 149 (9.16619e+044) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01001111111 #b1100111001011010101101110010010000001010011111101110)))
(assert (= y (fp #b0 #b10010010100 #b0100100011010010001000010111110000010011010010001000)))
(assert (= r (fp #b0 #b10010010100 #b0100100011010010001000010111110000010011010010001000)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)