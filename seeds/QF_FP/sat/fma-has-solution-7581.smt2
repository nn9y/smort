(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.8146315060010866915263250120915472507476806640625p197 {+ 3668774146870760 197 (3.645e+059)}
; Y = 1.8027974752801345648123287901398725807666778564453125p464 {+ 3615478410525589 464 (8.58746e+139)}
; Z = 1.57171437785620327076685498468577861785888671875p-323 {+ 2574772659075552 -323 (9.19782e-098)}
; 1.8146315060010866915263250120915472507476806640625p197 x 1.8027974752801345648123287901398725807666778564453125p464 1.57171437785620327076685498468577861785888671875p-323 == 1.63570654879127364011992540326900780200958251953125p662
; [HW: 1.63570654879127364011992540326900780200958251953125p662] 

; mpf : + 2862967776253364 662
; mpfd: + 2862967776253364 662 (3.13013e+199) class: Pos. norm. non-zero
; hwf : + 2862967776253364 662 (3.13013e+199) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun z () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10011000100 #b1101000010001011101100001011110010010000110111101000)))
(assert (= y (fp #b0 #b10111001111 #b1100110110000100001000101010010110100011101110010101)))
(assert (= z (fp #b0 #b01010111100 #b1001001001011011110111111001101110001011100111100000)))
(assert (= r (fp #b0 #b11010010101 #b1010001010111101101010100001010011101001010110110100)))
(assert (= (fp.fma roundTowardNegative x y z) r))
(check-sat)
(exit)