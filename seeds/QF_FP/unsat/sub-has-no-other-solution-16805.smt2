(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.2858193900600685122270760984974913299083709716796875p-689 {- 1287216098569787 -689 (-5.00625e-208)}
; Y = -1.8139287331086373367128317113383673131465911865234375p800 {- 3665609139134199 800 (-1.20953e+241)}
; -1.2858193900600685122270760984974913299083709716796875p-689 - -1.8139287331086373367128317113383673131465911865234375p800 == 1.813928733108637114668226786307059228420257568359375p800
; [HW: 1.813928733108637114668226786307059228420257568359375p800] 

; mpf : + 3665609139134198 800
; mpfd: + 3665609139134198 800 (1.20953e+241) class: Pos. norm. non-zero
; hwf : + 3665609139134198 800 (1.20953e+241) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00101001110 #b0100100100101011011101011010010011011110111000111011)))
(assert (= y (fp #b1 #b11100011111 #b1101000001011101101000100010100111111001111011110111)))
(assert (= r (fp #b0 #b11100011111 #b1101000001011101101000100010100111111001111011110110)))
(assert  (not (= (fp.sub roundTowardZero x y) r)))
(check-sat)
(exit)