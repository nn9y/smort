(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = -1.131883973651326424914032031665556132793426513671875p-907 {- 593952614592254 -907 (-1.04615e-273)}
; Y = -1.511657523697826466246851850883103907108306884765625p-661 {- 2304300633066842 -661 (-1.57989e-199)}
; -1.131883973651326424914032031665556132793426513671875p-907 m -1.511657523697826466246851850883103907108306884765625p-661 == -1.511657523697826466246851850883103907108306884765625p-661
; [HW: -1.511657523697826466246851850883103907108306884765625p-661] 

; mpf : - 2304300633066842 -661
; mpfd: - 2304300633066842 -661 (-1.57989e-199) class: Neg. norm. non-zero
; hwf : - 2304300633066842 -661 (-1.57989e-199) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b00001110100 #b0010000111000011001001011110100110110010111011111110)))
(assert (= y (fp #b1 #b00101101010 #b1000001011111011111111001100101100001000110101011010)))
(assert (= r (fp #b1 #b00101101010 #b1000001011111011111111001100101100001000110101011010)))
(assert  (not (= (fp.min x y) r)))
(check-sat)
(exit)