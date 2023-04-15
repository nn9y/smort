(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = -1.3107502290104047215635318934801034629344940185546875p442 {- 1399494615576555 442 (-1.4886e+133)}
; Y = 1.1673543899846265947672918628086335957050323486328125p61 {+ 753697168373581 61 (2.69174e+018)}
; -1.3107502290104047215635318934801034629344940185546875p442 / 1.1673543899846265947672918628086335957050323486328125p61 == -1.1228383087912716664646950448513962328433990478515625p381
; [HW: -1.1228383087912716664646950448513962328433990478515625p381] 

; mpf : - 553214561699193 381
; mpfd: - 553214561699193 381 (-5.53026e+114) class: Neg. norm. non-zero
; hwf : - 553214561699193 381 (-5.53026e+114) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10110111001 #b0100111110001101010100111011011011010010111111101011)))
(assert (= y (fp #b0 #b10000111100 #b0010101011010111101111001011111111010011011101001101)))
(assert (= r (fp #b1 #b10101111100 #b0001111101110010010101001101011011110100010101111001)))
(assert  (not (= (fp.div roundNearestTiesToEven x y) r)))
(check-sat)
(exit)