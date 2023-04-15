(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.779608160448137521569833552348427474498748779296875p481 {- 3511043020889230 481 (-1.1111e+145)}
; Y = -1.8850581155031651547915316768921911716461181640625p-18 {- 3985947399181288 -18 (-7.19093e-006)}
; -1.779608160448137521569833552348427474498748779296875p481 - -1.8850581155031651547915316768921911716461181640625p-18 == -1.779608160448137521569833552348427474498748779296875p481
; [HW: -1.779608160448137521569833552348427474498748779296875p481] 

; mpf : - 3511043020889230 481
; mpfd: - 3511043020889230 481 (-1.1111e+145) class: Neg. norm. non-zero
; hwf : - 3511043020889230 481 (-1.1111e+145) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10111100000 #b1100011110010100011001101000000011010001110010001110)))
(assert (= y (fp #b1 #b01111101101 #b1110001010010011001010110010110100100101001111101000)))
(assert (= r (fp #b1 #b10111100000 #b1100011110010100011001101000000011010001110010001110)))
(assert  (not (= (fp.sub roundTowardNegative x y) r)))
(check-sat)
(exit)