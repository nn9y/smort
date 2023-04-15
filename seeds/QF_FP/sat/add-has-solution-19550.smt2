(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.3909877670759129841826506890356540679931640625p81 {- 1760852362109504 81 (-3.3632e+024)}
; Y = 1.60979487854689384818129838095046579837799072265625p-298 {+ 2746271987796228 -298 (3.16105e-090)}
; -1.3909877670759129841826506890356540679931640625p81 + 1.60979487854689384818129838095046579837799072265625p-298 == -1.3909877670759127621380457640043459832668304443359375p81
; [HW: -1.3909877670759127621380457640043459832668304443359375p81] 

; mpf : - 1760852362109503 81
; mpfd: - 1760852362109503 81 (-3.3632e+024) class: Neg. norm. non-zero
; hwf : - 1760852362109503 81 (-3.3632e+024) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10001010000 #b0110010000010111110001100011100010111010001001000000)))
(assert (= y (fp #b0 #b01011010101 #b1001110000011011100001000110010010100000100100000100)))
(assert (= r (fp #b1 #b10001010000 #b0110010000010111110001100011100010111010001000111111)))
(assert (= (fp.add roundTowardPositive x y) r))
(check-sat)
(exit)