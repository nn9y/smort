(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.5734704364594473968708143729600124061107635498046875p-177 {- 2582681243946763 -177 (-8.2139e-054)}
; Y = -1.271317159142650865533141768537461757659912109375p-419 {- 1221903856814064 -419 (-9.39044e-127)}
; -1.5734704364594473968708143729600124061107635498046875p-177 / -1.271317159142650865533141768537461757659912109375p-419 == 1.2376694714956590903653932400629855692386627197265625p242
; [HW: 1.2376694714956590903653932400629855692386627197265625p242] 

; mpf : + 1070368143265193 242
; mpfd: + 1070368143265193 242 (8.74709e+072) class: Pos. norm. non-zero
; hwf : + 1070368143265193 242 (8.74709e+072) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01101001110 #b1001001011001110111101010110000111010000111100001011)))
(assert (= y (fp #b1 #b01001011100 #b0100010101110101000010101001010101011100011111110000)))
(assert (= r (fp #b0 #b10011110001 #b0011110011010111111010000000111101010100110110101001)))
(assert (= (fp.div roundNearestTiesToEven x y) r))
(check-sat)
(exit)