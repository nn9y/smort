(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.362328076649444330570304373395629227161407470703125p-159 {+ 1631780590984306 -159 (1.86429e-048)}
; Y = 1.65449889210900469294074355275370180606842041015625p195 {+ 2947600966616516 195 (8.30837e+058)}
; 1.362328076649444330570304373395629227161407470703125p-159 M 1.65449889210900469294074355275370180606842041015625p195 == 1.65449889210900469294074355275370180606842041015625p195
; [HW: 1.65449889210900469294074355275370180606842041015625p195] 

; mpf : + 2947600966616516 195
; mpfd: + 2947600966616516 195 (8.30837e+058) class: Pos. norm. non-zero
; hwf : + 2947600966616516 195 (8.30837e+058) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b01101100000 #b0101110011000001100010000110011110100001110001110010)))
(assert (= y (fp #b0 #b10011000010 #b1010011110001101001111010100100011100000010111000100)))
(assert (= r (fp #b0 #b10011000010 #b1010011110001101001111010100100011100000010111000100)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)