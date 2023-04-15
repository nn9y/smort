(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.7736499202013529252752732645603828132152557373046875p493 {- 3484209492334027 493 (-4.53582e+148)}
; Y = 1.957127511472413150528382175252772867679595947265625p355 {+ 4310519104013210 355 (1.43637e+107)}
; -1.7736499202013529252752732645603828132152557373046875p493 % 1.957127511472413150528382175252772867679595947265625p355 == -1.66602724273365510043731774203479290008544921875p355
; [HW: -1.66602724273365510043731774203479290008544921875p355] 

; mpf : - 2999520042193888 355
; mpfd: - 2999520042193888 355 (-1.22273e+107) class: Neg. norm. non-zero
; hwf : - 2999520042193888 355 (-1.22273e+107) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10111101100 #b1100011000001101111010111101000111010001010111001011)))
(assert (= y (fp #b0 #b10101100010 #b1111010100000110010011101111111111100000001110011010)))
(assert (= r (fp #b0 #b10101100000 #x2a1630585bee8)))
(assert (= (fp.rem x y) r))
(check-sat)
(exit)