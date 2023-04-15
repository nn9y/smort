(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.9999522408849930155128049591439776122570037841796875p728 {+ 4503384539437947 728 (2.82395e+219)}
; Y = 1.5581962638040349755641500451019965112209320068359375p738 {+ 2513892485667455 738 (2.25299e+222)}
; 1.9999522408849930155128049591439776122570037841796875p728 + 1.5581962638040349755641500451019965112209320068359375p738 == 1.560149342164274255395639556809328496456146240234375p738
; [HW: 1.560149342164274255395639556809328496456146240234375p738] 

; mpf : + 2522688368642854 738
; mpfd: + 2522688368642854 738 (2.25581e+222) class: Pos. norm. non-zero
; hwf : + 2522688368642854 738 (2.25581e+222) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11011010111 #b1111111111111100110111101011110000101001101101111011)))
(assert (= y (fp #b0 #b11011100001 #b1000111011100101111100110100100111001001101001111111)))
(assert (= r (fp #b0 #b11011100001 #b1000111101100101111100101000000101111000101100100110)))
(assert (= (fp.add roundTowardPositive x y) r))
(check-sat)
(exit)