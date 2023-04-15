(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.0965613522869255280767220028792507946491241455078125p-405 {+ 434873670177789 -405 (1.32704e-122)}
; Y = -1.7305917703140518693061267185839824378490447998046875p-438 {- 3290292824546315 -438 (-2.43813e-132)}
; 1.0965613522869255280767220028792507946491241455078125p-405 % -1.7305917703140518693061267185839824378490447998046875p-438 == 1.845972243108219057461383272311650216579437255859375p-439
; [HW: 1.845972243108219057461383272311650216579437255859375p-439] 

; mpf : + 3809920278827958 -439
; mpfd: + 3809920278827958 -439 (1.30034e-132) class: Pos. norm. non-zero
; hwf : + 3809920278827958 -439 (1.30034e-132) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01001101010 #b0001100010111000001111101010101000100001001111111101)))
(assert (= y (fp #b1 #b01001001001 #b1011101100001000000011111111000000111001110000001011)))
(assert (= r (fp #b1 #b01001001000 #x9d7e7cd2fa460)))
(assert (= (fp.rem x y) r))
(check-sat)
(exit)