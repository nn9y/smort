(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.825449792631504752904447741457261145114898681640625p233 {- 3717495378508298 233 (-2.51976e+070)}
; Y = -1.7621879112909628606331580158439464867115020751953125p78 {- 3432589193276277 78 (-5.32589e+023)}
; -1.825449792631504752904447741457261145114898681640625p233 % -1.7621879112909628606331580158439464867115020751953125p78 == -1.967246449657363172036639298312366008758544921875p75
; [HW: -1.967246449657363172036639298312366008758544921875p75] 

; mpf : - 4356090750252336 75
; mpfd: - 4356090750252336 75 (-7.43205e+022) class: Neg. norm. non-zero
; hwf : - 4356090750252336 75 (-7.43205e+022) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10011101000 #b1101001101010000101011010111011111010111101000001010)))
(assert (= y (fp #b1 #b10001001101 #b1100001100011110101111110011100001100110101101110101)))
(assert (= r (fp #b1 #b10001001010 #xf79d769c73530)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)