(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.863272030600097384223090557497926056385040283203125p-713 {+ 3887831595329970 -713 (4.32404e-215)}
; Y = -1.9787301624292019663897690406884066760540008544921875p-316 {- 4407808794812419 -316 (-1.4822e-095)}
; 1.863272030600097384223090557497926056385040283203125p-713 % -1.9787301624292019663897690406884066760540008544921875p-316 == 1.863272030600097384223090557497926056385040283203125p-713
; [HW: 1.863272030600097384223090557497926056385040283203125p-713] 

; mpf : + 3887831595329970 -713
; mpfd: + 3887831595329970 -713 (4.32404e-215) class: Pos. norm. non-zero
; hwf : + 3887831595329970 -713 (4.32404e-215) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b00100110110 #b1101110011111111011001010101001011111010100110110010)))
(assert (= y (fp #b1 #b01011000011 #b1111101010001110000011110101011100111110000000000011)))
(assert (= r (fp #b0 #b00100110110 #xdcff6552fa9b2)))
(assert (= (fp.rem x y) r))
(check-sat)
(exit)