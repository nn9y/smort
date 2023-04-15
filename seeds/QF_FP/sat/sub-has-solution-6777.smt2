(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to negative
; Precision: double (11/53)
; X = 1.5218559370990296653047835206962190568447113037109375p169 {+ 2350230203860271 169 (1.13879e+051)}
; Y = -1.1432514985555373154824110315530560910701751708984375p550 {- 645147395514983 550 (-4.21347e+165)}
; 1.5218559370990296653047835206962190568447113037109375p169 - -1.1432514985555373154824110315530560910701751708984375p550 == 1.1432514985555373154824110315530560910701751708984375p550
; [HW: 1.1432514985555373154824110315530560910701751708984375p550] 

; mpf : + 645147395514983 550
; mpfd: + 645147395514983 550 (4.21347e+165) class: Pos. norm. non-zero
; hwf : + 645147395514983 550 (4.21347e+165) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b10010101000 #b1000010110011000010110011100011100010000010100101111)))
(assert (= y (fp #b1 #b11000100101 #b0010010010101100001000010101010101100110001001100111)))
(assert (= r (fp #b0 #b11000100101 #b0010010010101100001000010101010101100110001001100111)))
(assert (= (fp.sub roundTowardNegative x y) r))
(check-sat)
(exit)