(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.83201245429728931668478253413923084735870361328125p-519 {+ 3747050979140884 -519 (1.06748e-156)}
; Y = 1.00736610749484345461723933112807571887969970703125p853 {+ 33173998968948 853 (6.05025e+256)}
; 1.83201245429728931668478253413923084735870361328125p-519 + 1.00736610749484345461723933112807571887969970703125p853 == 1.00736610749484345461723933112807571887969970703125p853
; [HW: 1.00736610749484345461723933112807571887969970703125p853] 

; mpf : + 33173998968948 853
; mpfd: + 33173998968948 853 (6.05025e+256) class: Pos. norm. non-zero
; hwf : + 33173998968948 853 (6.05025e+256) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00111111000 #b1101010011111110110001001010100100010010010100010100)))
(assert (= y (fp #b0 #b11101010100 #b0000000111100010101111101100011011001010000001110100)))
(assert (= r (fp #b0 #b11101010100 #b0000000111100010101111101100011011001010000001110100)))
(assert  (not (= (fp.add roundTowardNegative x y) r)))
(check-sat)
(exit)