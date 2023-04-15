(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.588701215068053951284809954813681542873382568359375p405 {- 2651274572813046 405 (-1.31278e+122)}
; Y = 1.4221101538818732290536672735470347106456756591796875p298 {+ 1901015131731707 298 (7.24222e+089)}
; -1.588701215068053951284809954813681542873382568359375p405 * 1.4221101538818732290536672735470347106456756591796875p298 == -1.129654064716374417542965602478943765163421630859375p704
; [HW: -1.129654064716374417542965602478943765163421630859375p704] 

; mpf : - 583909997543734 704
; mpfd: - 583909997543734 704 (-9.50741e+211) class: Neg. norm. non-zero
; hwf : - 583909997543734 704 (-9.50741e+211) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10110010100 #b1001011010110101000111110111000111010101001011110110)))
(assert (= y (fp #b0 #b10100101001 #b0110110000001111011010010011101000111011011011111011)))
(assert (= r (fp #b1 #b11010111111 #b0010000100110001000000100011111111000000000100110110)))
(assert (= (fp.mul roundTowardPositive x y) r))
(check-sat)
(exit)