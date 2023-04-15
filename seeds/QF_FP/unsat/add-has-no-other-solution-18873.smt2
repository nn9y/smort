(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.4329810384166326020505266569671221077442169189453125p-167 {- 1949973243271637 -167 (-7.66004e-051)}
; Y = 1.38544934527880769792318460531532764434814453125p584 {+ 1735909527767840 584 (8.77219e+175)}
; -1.4329810384166326020505266569671221077442169189453125p-167 + 1.38544934527880769792318460531532764434814453125p584 == 1.3854493452788074758785796802840195596218109130859375p584
; [HW: 1.3854493452788074758785796802840195596218109130859375p584] 

; mpf : + 1735909527767839 584
; mpfd: + 1735909527767839 584 (8.77219e+175) class: Pos. norm. non-zero
; hwf : + 1735909527767839 584 (8.77219e+175) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01101011000 #b0110111011010111110110000110011111001001100111010101)))
(assert (= y (fp #b0 #b11001000111 #b0110001010101100110011101110110000111100101100100000)))
(assert (= r (fp #b0 #b11001000111 #b0110001010101100110011101110110000111100101100011111)))
(assert  (not (= (fp.add roundTowardNegative x y) r)))
(check-sat)
(exit)