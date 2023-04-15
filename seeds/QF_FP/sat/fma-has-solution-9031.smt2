(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.3678867389422222355932490245322696864604949951171875p-185 {- 1656814580414739 -185 (-2.78934e-056)}
; Y = 1.6655941545474153286932050832547247409820556640625p231 {+ 2997569586399720 231 (5.74775e+069)}
; Z = 1.135272987944107025981566039263270795345306396484375p175 {+ 609215378098374 175 (5.43688e+052)}
; -1.3678867389422222355932490245322696864604949951171875p-185 x 1.6655941545474153286932050832547247409820556640625p231 1.135272987944107025981566039263270795345306396484375p175 == 1.1352729879441068039369611142319627106189727783203125p175
; [HW: 1.1352729879441068039369611142319627106189727783203125p175] 

; mpf : + 609215378098373 175
; mpfd: + 609215378098373 175 (5.43688e+052) class: Pos. norm. non-zero
; hwf : + 609215378098373 175 (5.43688e+052) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun z () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01101000110 #b0101111000101101110100110100100001100011100100010011)))
(assert (= y (fp #b0 #b10011100110 #b1010101001100100011000001110011000110000100111101000)))
(assert (= z (fp #b0 #b10010101110 #b0010001010100001010000000010001101000000100011000110)))
(assert (= r (fp #b0 #b10010101110 #b0010001010100001010000000010001101000000100011000101)))
(assert (= (fp.fma roundTowardZero x y z) r))
(check-sat)
(exit)