(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.60116991420734589013363802223466336727142333984375p307 {- 2707428601610556 307 (-4.1749e+092)}
; Y = 1.7616677685144084275492559754638932645320892333984375p848 {+ 3430246678461607 848 (3.30644e+255)}
; -1.60116991420734589013363802223466336727142333984375p307 + 1.7616677685144084275492559754638932645320892333984375p848 == 1.7616677685144084275492559754638932645320892333984375p848
; [HW: 1.7616677685144084275492559754638932645320892333984375p848] 

; mpf : + 3430246678461607 848
; mpfd: + 3430246678461607 848 (3.30644e+255) class: Pos. norm. non-zero
; hwf : + 3430246678461607 848 (3.30644e+255) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10100110010 #b1001100111100110010001011000000011011100000100111100)))
(assert (= y (fp #b0 #b11101001111 #b1100001011111100101010001010110000101111110010100111)))
(assert (= r (fp #b0 #b11101001111 #b1100001011111100101010001010110000101111110010100111)))
(assert (= (fp.add roundTowardPositive x y) r))
(check-sat)
(exit)