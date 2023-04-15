(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.5565403688018546457527691018185578286647796630859375p-681 {+ 2506434997552671 -681 (1.55143e-205)}
; Y = -1.9504814043016567293165053342818282544612884521484375p297 {- 4280587698235527 297 (-4.9665e+089)}
; 1.5565403688018546457527691018185578286647796630859375p-681 / -1.9504814043016567293165053342818282544612884521484375p297 == -1.5960576351756119439784242786117829382419586181640625p-979
; [HW: -1.5960576351756119439784242786117829382419586181640625p-979] 

; mpf : - 2684404943668225 -979
; mpfd: - 2684404943668225 -979 (-3.1238e-295) class: Neg. norm. non-zero
; hwf : - 2684404943668225 -979 (-3.1238e-295) class: Neg. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00101010110 #b1000111001111001011011011111101011101000011000011111)))
(assert (= y (fp #b1 #b10100101000 #b1111001101010010101111111101001011101110100010000111)))
(assert (= r (fp #b1 #b00000101100 #b1001100010010111001110111011000110011100010000000001)))
(assert (= (fp.div roundTowardZero x y) r))
(check-sat)
(exit)