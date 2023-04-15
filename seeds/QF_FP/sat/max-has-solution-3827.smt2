(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.0078027046289832480141512860427610576152801513671875p91 {+ 35140257659571 91 (2.4952e+027)}
; Y = -1.7323301046475647613220871789962984621524810791015625p557 {- 3298121586402969 557 (-8.17219e+167)}
; 1.0078027046289832480141512860427610576152801513671875p91 M -1.7323301046475647613220871789962984621524810791015625p557 == 1.0078027046289832480141512860427610576152801513671875p91
; [HW: 1.0078027046289832480141512860427610576152801513671875p91] 

; mpf : + 35140257659571 91
; mpfd: + 35140257659571 91 (2.4952e+027) class: Pos. norm. non-zero
; hwf : + 35140257659571 91 (2.4952e+027) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10001011010 #b0000000111111111010110111010100100110011101010110011)))
(assert (= y (fp #b1 #b11000101100 #b1011101101111001111111000101100101010110011010011001)))
(assert (= r (fp #b0 #b10001011010 #b0000000111111111010110111010100100110011101010110011)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)