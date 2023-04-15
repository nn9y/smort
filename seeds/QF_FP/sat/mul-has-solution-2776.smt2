(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.586846388622417780567275258363224565982818603515625p117 {+ 2642921177123642 117 (2.6366e+035)}
; Y = 1.6265011674240057448770357950706966221332550048828125p109 {+ 2821510424157933 109 (1.05566e+033)}
; 1.586846388622417780567275258363224565982818603515625p117 * 1.6265011674240057448770357950706966221332550048828125p109 == 1.290503751808464993899860928650014102458953857421875p227
; [HW: 1.290503751808464993899860928650014102458953857421875p227] 

; mpf : + 1308312588394334 227
; mpfd: + 1308312588394334 227 (2.78335e+068) class: Pos. norm. non-zero
; hwf : + 1308312588394334 227 (2.78335e+068) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10001110100 #b1001011000111011100100001001111011101000101100111010)))
(assert (= y (fp #b0 #b10001101100 #b1010000001100010011000010110100011111101111011101101)))
(assert (= r (fp #b0 #b10011100010 #b0100101001011110011101000011000101100001111101011110)))
(assert (= (fp.mul roundTowardZero x y) r))
(check-sat)
(exit)