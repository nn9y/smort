(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.42259334648827273639426493900828063488006591796875p83 {+ 1903191237773836 83 (1.37585e+025)}
; Y = 1.338522651380576800050903329974971711635589599609375p671 {+ 1524570486614038 671 (1.31145e+202)}
; 1.42259334648827273639426493900828063488006591796875p83 - 1.338522651380576800050903329974971711635589599609375p671 == -1.338522651380576800050903329974971711635589599609375p671
; [HW: -1.338522651380576800050903329974971711635589599609375p671] 

; mpf : - 1524570486614038 671
; mpfd: - 1524570486614038 671 (-1.31145e+202) class: Neg. norm. non-zero
; hwf : - 1524570486614038 671 (-1.31145e+202) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10001010010 #b0110110000101111000100111101101010101100101000001100)))
(assert (= y (fp #b0 #b11010011110 #b0101011010101001011010111010010010100010100000010110)))
(assert (= r (fp #b1 #b11010011110 #b0101011010101001011010111010010010100010100000010110)))
(assert  (not (= (fp.sub roundTowardNegative x y) r)))
(check-sat)
(exit)