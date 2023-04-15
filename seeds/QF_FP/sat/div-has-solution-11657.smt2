(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.40791408707964205149210101808421313762664794921875p613 {- 1837081730571052 613 (-4.7859e+184)}
; Y = 1.7001561755223904004452606386621482670307159423828125p733 {+ 3153223091183789 733 (7.68202e+220)}
; -1.40791408707964205149210101808421313762664794921875p613 / 1.7001561755223904004452606386621482670307159423828125p733 == -1.656217360910442248922436192515306174755096435546875p-121
; [HW: -1.656217360910442248922436192515306174755096435546875p-121] 

; mpf : - 2955340262070318 -121
; mpfd: - 2955340262070318 -121 (-6.23e-037) class: Neg. norm. non-zero
; hwf : - 2955340262070318 -121 (-6.23e-037) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b11001100100 #b0110100001101101000011101011111110010101101100101100)))
(assert (= y (fp #b0 #b11011011100 #b1011001100111101011011110110001111110110000010101101)))
(assert (= r (fp #b1 #b01110000110 #b1010011111111101110111000110100000101101100000101110)))
(assert (= (fp.div roundTowardZero x y) r))
(check-sat)
(exit)