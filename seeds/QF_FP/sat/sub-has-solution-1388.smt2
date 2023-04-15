(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to positive
; Precision: double (11/53)
; X = -1.491307019110732934308316544047556817531585693359375p-253 {- 2212650108191606 -253 (-1.03033e-076)}
; Y = -1.7098625440047297008305804411065764725208282470703125p883 {- 3196936688663973 883 (-1.10267e+266)}
; -1.491307019110732934308316544047556817531585693359375p-253 - -1.7098625440047297008305804411065764725208282470703125p883 == 1.7098625440047297008305804411065764725208282470703125p883
; [HW: 1.7098625440047297008305804411065764725208282470703125p883] 

; mpf : + 3196936688663973 883
; mpfd: + 3196936688663973 883 (1.10267e+266) class: Pos. norm. non-zero
; hwf : + 3196936688663973 883 (1.10267e+266) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b1 #b01100000010 #b0111110111000110010010111111101101100000001101110110)))
(assert (= y (fp #b1 #b11101110010 #b1011010110111001100011010011101100100111110110100101)))
(assert (= r (fp #b0 #b11101110010 #b1011010110111001100011010011101100100111110110100101)))
(assert (= (fp.sub roundTowardPositive x y) r))
(check-sat)
(exit)