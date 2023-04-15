(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.7499944773695867983320795246982015669345855712890625p101 {+ 3377674848811601 101 (4.43676e+030)}
; Y = 1.50713994142739693415933288633823394775390625p615 {+ 2283955251237120 615 (2.04928e+185)}
; 1.7499944773695867983320795246982015669345855712890625p101 m 1.50713994142739693415933288633823394775390625p615 == 1.7499944773695867983320795246982015669345855712890625p101
; [HW: 1.7499944773695867983320795246982015669345855712890625p101] 

; mpf : + 3377674848811601 101
; mpfd: + 3377674848811601 101 (4.43676e+030) class: Pos. norm. non-zero
; hwf : + 3377674848811601 101 (4.43676e+030) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10001100100 #b1011111111111111101000110101100001111011101001010001)))
(assert (= y (fp #b0 #b11001100110 #b1000000111010011111011000101011011101101000100000000)))
(assert (= r (fp #b0 #b10001100100 #b1011111111111111101000110101100001111011101001010001)))
(assert (= (fp.min x y) r))
(check-sat)
(exit)