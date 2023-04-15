(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: nearest, ties to even
; Precision: double (11/53)
; X = 1.1767994787038185133809520266368053853511810302734375p-692 {+ 796234066409815 -692 (5.72724e-209)}
; Y = -1.49506170679290217861989731318317353725433349609375p-980 {- 2229559718237916 -980 (-1.46306e-295)}
; 1.1767994787038185133809520266368053853511810302734375p-692 % -1.49506170679290217861989731318317353725433349609375p-980 == 1.44096130349868190023698844015598297119140625p-981
; [HW: 1.44096130349868190023698844015598297119140625p-981] 

; mpf : + 1985913162121472 -981
; mpfd: + 1985913162121472 -981 (7.05061e-296) class: Pos. norm. non-zero
; hwf : + 1985913162121472 -981 (7.05061e-296) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status unsat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00101001011 #b0010110101000010101110110000101011111011100101010111)))
(assert (= y (fp #b1 #b00000101011 #b0111111010111100010111010011000000101101011011011100)))
(assert (= r (fp #b0 #b00000101010 #x70e2d70954100)))
(assert  (not (= (fp.rem x y) r)))
(check-sat)
(exit)