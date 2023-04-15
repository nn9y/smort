(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = 1.3778594048890171475107990772812627255916595458984375p-623 {+ 1701727475056615 -623 (3.95838e-188)}
; Y = 1.01612079641578834099391315248794853687286376953125p-936 {+ 72601612731060 -936 (1.74932e-282)}
; 1.3778594048890171475107990772812627255916595458984375p-623 M 1.01612079641578834099391315248794853687286376953125p-936 == 1.3778594048890171475107990772812627255916595458984375p-623
; [HW: 1.3778594048890171475107990772812627255916595458984375p-623] 

; mpf : + 1701727475056615 -623
; mpfd: + 1701727475056615 -623 (3.95838e-188) class: Pos. norm. non-zero
; hwf : + 1701727475056615 -623 (3.95838e-188) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00110010000 #b0110000010111011011001001101101001111011111111100111)))
(assert (= y (fp #b0 #b00001010111 #b0000010000100000011111100001010101100100001010110100)))
(assert (= r (fp #b0 #b00110010000 #b0110000010111011011001001101101001111011111111100111)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)