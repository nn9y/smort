(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.9182440985614228612377019089763052761554718017578125p-638 {+ 4135403780116381 -638 (1.68177e-192)}
; Y = 1.2236615700892865543636389702442102134227752685546875p201 {+ 1007282163711211 201 (3.9327e+060)}
; 1.9182440985614228612377019089763052761554718017578125p-638 / 1.2236615700892865543636389702442102134227752685546875p201 == 1.567626331863519073550605753553099930286407470703125p-839
; [HW: 1.567626331863519073550605753553099930286407470703125p-839] 

; mpf : + 2556361736666226 -839
; mpfd: + 2556361736666226 -839 (4.27638e-253) class: Pos. norm. non-zero
; hwf : + 2556361736666226 -839 (4.27638e-253) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00110000001 #b1110101100010010000010111001010100010000111110011101)))
(assert (= y (fp #b0 #b10011001000 #b0011100101000001111000100111100011100111110011101011)))
(assert (= r (fp #b0 #b00010111000 #b1001000101001111111101011001001110110011110001110010)))
(assert  (not (= (fp.div roundTowardZero x y) r)))
(check-sat)
(exit)