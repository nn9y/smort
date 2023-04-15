(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.874039594724810076087351262685842812061309814453125p-114 {+ 3936324393109714 -114 (9.02317e-035)}
; Y = -1.4309929862152512836104278903803788125514984130859375p-656 {- 1941019852118303 -656 (-4.78586e-198)}
; 1.874039594724810076087351262685842812061309814453125p-114 M -1.4309929862152512836104278903803788125514984130859375p-656 == 1.874039594724810076087351262685842812061309814453125p-114
; [HW: 1.874039594724810076087351262685842812061309814453125p-114] 

; mpf : + 3936324393109714 -114
; mpfd: + 3936324393109714 -114 (9.02317e-035) class: Pos. norm. non-zero
; hwf : + 3936324393109714 -114 (9.02317e-035) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01110001101 #b1101111111000001000011110001001011000000100011010010)))
(assert (= y (fp #b1 #b00101101111 #b0110111001010101100011100110110010011001100100011111)))
(assert (= r (fp #b0 #b01110001101 #b1101111111000001000011110001001011000000100011010010)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)