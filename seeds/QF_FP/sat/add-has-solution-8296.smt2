(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.6477849328390146155243201064877212047576904296875p-1015 {- 2917363982150008 -1015 (-4.69305e-306)}
; Y = 1.846193633821673341088853703695349395275115966796875p581 {+ 3810917333962574 581 (1.46118e+175)}
; -1.6477849328390146155243201064877212047576904296875p-1015 + 1.846193633821673341088853703695349395275115966796875p581 == 1.846193633821673341088853703695349395275115966796875p581
; [HW: 1.846193633821673341088853703695349395275115966796875p581] 

; mpf : + 3810917333962574 581
; mpfd: + 3810917333962574 581 (1.46118e+175) class: Pos. norm. non-zero
; hwf : + 3810917333962574 581 (1.46118e+175) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00000001000 #b1010010111010101001110111011110101100010100101111000)))
(assert (= y (fp #b0 #b11001000100 #b1101100010100000001001010101111101011000111101001110)))
(assert (= r (fp #b0 #b11001000100 #b1101100010100000001001010101111101011000111101001110)))
(assert (= (fp.add roundNearestTiesToEven x y) r))
(check-sat)
(exit)