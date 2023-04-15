(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.56874064207794372549642503145150840282440185546875p-711 {- 2561380143732684 -711 (-1.45621e-214)}
; Y = 1.351781045182195217790876995422877371311187744140625p225 {+ 1584280983998538 225 (7.28879e+067)}
; -1.56874064207794372549642503145150840282440185546875p-711 % 1.351781045182195217790876995422877371311187744140625p225 == -1.56874064207794372549642503145150840282440185546875p-711
; [HW: -1.56874064207794372549642503145150840282440185546875p-711] 

; mpf : - 2561380143732684 -711
; mpfd: - 2561380143732684 -711 (-1.45621e-214) class: Neg. norm. non-zero
; hwf : - 2561380143732684 -711 (-1.45621e-214) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00100111000 #b1001000110011000111111001001100110100001011111001100)))
(assert (= y (fp #b0 #b10011100000 #b0101101000001110010100101001010001101001000001001010)))
(assert (= r (fp #b1 #b00100111000 #x9198fc99a17cc)))
(assert (= (fp.rem x y) r))
(check-sat)
(exit)