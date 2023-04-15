(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.5002799431400173357786798078450374305248260498046875p-540 {- 2253060565506315 -540 (-4.16845e-163)}
; Y = 1.6345901876026356358551083758356980979442596435546875p-591 {+ 2857940132420203 -591 (2.01689e-178)}
; Z = 1.979779350355253431104074479662813246250152587890625p411 {+ 4412533917165226 411 (1.047e+124)}
; -1.5002799431400173357786798078450374305248260498046875p-540 x 1.6345901876026356358551083758356980979442596435546875p-591 1.979779350355253431104074479662813246250152587890625p411 == 1.9797793503552532090594695546315051615238189697265625p411
; [HW: 1.9797793503552532090594695546315051615238189697265625p411] 

; mpf : + 4412533917165225 411
; mpfd: + 4412533917165225 411 (1.047e+124) class: Pos. norm. non-zero
; hwf : + 4412533917165225 411 (1.047e+124) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun z () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00111100011 #b1000000000010010010110001010101010100001100100001011)))
(assert (= y (fp #b0 #b00110110000 #b1010001001110100100000001010011000011101101001101011)))
(assert (= z (fp #b0 #b10110011010 #b1111101011010010110100011100101100010010011010101010)))
(assert (= r (fp #b0 #b10110011010 #b1111101011010010110100011100101100010010011010101001)))
(assert (= (fp.fma roundTowardNegative x y z) r))
(check-sat)
(exit)