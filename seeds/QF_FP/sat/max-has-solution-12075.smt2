(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :source |Christoph M. Wintersteiger (cwinter@microsoft.com). Randomly generated floating-point testcases.|)
; Rounding mode: to zero
; Precision: double (11/53)
; X = 1.1788138289266021363488334827707149088382720947265625p570 {+ 805305893322537 570 (4.55557e+171)}
; Y = 1.736964512226668144734276211238466203212738037109375p750 {+ 3318993102649302 750 (1.0287e+226)}
; 1.1788138289266021363488334827707149088382720947265625p570 M 1.736964512226668144734276211238466203212738037109375p750 == 1.736964512226668144734276211238466203212738037109375p750
; [HW: 1.736964512226668144734276211238466203212738037109375p750] 

; mpf : + 3318993102649302 750
; mpfd: + 3318993102649302 750 (1.0287e+226) class: Pos. norm. non-zero
; hwf : + 3318993102649302 750 (1.0287e+226) class: Pos. norm. non-zero

(set-logic QF_FP)
(set-info :status sat)
(define-sort FPN () (_ FloatingPoint 11 53))
(declare-fun x () FPN)
(declare-fun y () FPN)
(declare-fun r () FPN)
(assert (= x (fp #b0 #b11000111001 #b0010110111000110101111100011101101001111111100101001)))
(assert (= y (fp #b0 #b11011101101 #b1011110010101001101101001100111001010011011111010110)))
(assert (= r (fp #b0 #b11011101101 #b1011110010101001101101001100111001010011011111010110)))
(assert (= (fp.max x y) r))
(check-sat)
(exit)