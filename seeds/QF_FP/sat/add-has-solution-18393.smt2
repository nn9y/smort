(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.2117059832167604849217923401738516986370086669921875p-215 {- 953438987127107 -215 (-2.30117e-065)}
; Y = 1.89854537177301363470860451343469321727752685546875p430 {+ 4046688601492428 430 (5.26404e+129)}
; -1.2117059832167604849217923401738516986370086669921875p-215 + 1.89854537177301363470860451343469321727752685546875p430 == 1.8985453717730134126639995884033851325511932373046875p430
; [HW: 1.8985453717730134126639995884033851325511932373046875p430] 

; mpf : + 4046688601492427 430
; mpfd: + 4046688601492427 430 (5.26404e+129) class: Pos. norm. non-zero
; hwf : + 4046688601492427 430 (5.26404e+129) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01100101000 #b0011011000110010010111010000001001001000100101000011)))
(assert (= y (fp #b0 #b10110101101 #b1110011000000111000100011100100110111100101111001100)))
(assert (= r (fp #b0 #b10110101101 #b1110011000000111000100011100100110111100101111001011)))
(assert (= (fp.add roundTowardNegative x y) r))
(check-sat)
(exit)