(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.296469633675905175351772413705475628376007080078125p-244 {- 1335180531749474 -244 (-4.5861e-074)}
; Y = 1.1366601230710189351924555012374185025691986083984375p-617 {+ 615462479339047 -617 (2.08989e-186)}
; -1.296469633675905175351772413705475628376007080078125p-244 / 1.1366601230710189351924555012374185025691986083984375p-617 == -1.1405956867503312945899551777984015643596649169921875p373
; [HW: -1.1405956867503312945899551777984015643596649169921875p373] 

; mpf : - 633186682458691 373
; mpfd: - 633186682458691 373 (-2.19442e+112) class: Neg. norm. non-zero
; hwf : - 633186682458691 373 (-2.19442e+112) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01100001011 #b0100101111100101011011110001010011100101001001100010)))
(assert (= y (fp #b0 #b00110010110 #b0010001011111100001010000110011101000001111000100111)))
(assert (= r (fp #b1 #b10101110100 #b0010001111111110000101000011010010001101001001000011)))
(assert (= (fp.div roundTowardZero x y) r))
(check-sat)
(exit)