(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = -1.23527237979436765868967995629645884037017822265625p326 {- 1059572601972484 326 (-1.68866e+098)}
; Y = -1.7031958852489548217334913715603761374950408935546875p113 {- 3166912726775659 113 (-1.7687e+034)}
; -1.23527237979436765868967995629645884037017822265625p326 M -1.7031958852489548217334913715603761374950408935546875p113 == -1.7031958852489548217334913715603761374950408935546875p113
; [HW: -1.7031958852489548217334913715603761374950408935546875p113] 

; mpf : - 3166912726775659 113
; mpfd: - 3166912726775659 113 (-1.7687e+034) class: Neg. norm. non-zero
; hwf : - 3166912726775659 113 (-1.7687e+034) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b10101000101 #b0011110000111010110011111000100011011110011100000100)))
(assert (= y (fp #b1 #b10001110000 #b1011010000000100101001010100000111010011011101101011)))
(assert (= r (fp #b1 #b10001110000 #b1011010000000100101001010100000111010011011101101011)))
(assert  (not (= (fp.max x y) r)))
(check-sat)
(exit)