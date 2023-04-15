(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.2481033294526238108801408088766038417816162109375p879 {- 1117358062072216 879 (-5.03056e+264)}
; Y = -1.4601166111839585237675009921076707541942596435546875p567 {- 2072180998675051 567 (-7.05334e+170)}
; -1.2481033294526238108801408088766038417816162109375p879 / -1.4601166111839585237675009921076707541942596435546875p567 == 1.7095940418629707036046738721779547631740570068359375p311
; [HW: 1.7095940418629707036046738721779547631740570068359375p311] 

; mpf : + 3195727462518399 311
; mpfd: + 3195727462518399 311 (7.13217e+093) class: Pos. norm. non-zero
; hwf : + 3195727462518399 311 (7.13217e+093) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b11101101110 #b0011111110000011101100110010011000000111000110011000)))
(assert (= y (fp #b1 #b11000110110 #b0111010111001010001100111100010101100001101001101011)))
(assert (= r (fp #b0 #b10100110110 #b1011010110100111111101001000001100111100111001111111)))
(assert (= (fp.div roundTowardNegative x y) r))
(check-sat)
(exit)