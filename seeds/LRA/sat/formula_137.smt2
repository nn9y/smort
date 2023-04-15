(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Monniaux, David; Quantifier Elimination by Lazy Model Enumeration, CAV 2010
|)
(set-info :category "random")
; ./Mjollnir_examples/B1/formula_137.m
(set-info :status sat)
(assert
 (forall ((|v9:0| Real) )(exists ((|v8:1| Real) )(forall ((|v7:2| Real) )(exists ((|v6:3| Real) )(forall ((|v5:4| Real) )(exists ((|v4:5| Real) )(forall ((|v3:6| Real) )(exists ((|v2:7| Real) )(forall ((|v1:8| Real) )(exists ((|v0:9| Real) )(let ((?x116 (- 1)))
(let ((?x199 (+ (+ (* 20 |v2:7|) (* 2 |v4:5|)) (* (- 14) |v6:3|))))
(let ((?x186 (+ (+ (* 4 |v7:2|) (* (- 19) |v6:3|)) (* (- 13) |v1:8|))))
(let ((?x96 (- 7)))
(let ((?x176 (+ (+ (* (- 5) |v5:4|) (* 8 |v8:1|)) (* ?x116 |v7:2|))))
(let ((?x80 (* 9 |v7:2|)))
(let (($x168 (<= (+ (+ (* 18 |v8:1|) (* 0 |v9:0|)) ?x80) 15)))
(let (($x162 (<= (+ (+ |v3:6| (* (- 9) |v7:2|)) (* (- 3) |v9:0|)) (- 14))))
(let ((?x50 (- 3)))
(let (($x190 (and (<= (+ (+ (* (- 9) |v4:5|) (* ?x96 |v8:1|)) |v8:1|) ?x50) (or (or $x162 $x168) (and (<= ?x176 ?x96) (<= ?x186 (- 12)))))))
(let ((?x145 (+ (+ (* (- 15) |v2:7|) (* 14 |v4:5|)) (* 4 |v3:6|))))
(let ((?x29 (- 11)))
(let ((?x139 (+ (+ (* 11 |v7:2|) (* 15 |v8:1|)) (* 11 |v9:0|))))
(let ((?x126 (* (- 15) |v2:7|)))
(let (($x129 (<= (+ (+ (* 4 |v4:5|) (* 4 |v2:7|)) ?x126) (- 6))))
(let ((?x63 0))
(let ((?x114 (* ?x63 |v9:0|)))
(let (($x130 (and (<= (+ (+ (* ?x63 |v2:7|) (* (- 16) |v7:2|)) ?x114) ?x116) $x129)))
(let ((?x106 (+ (+ (* (- 10) |v1:8|) (* 8 |v7:2|)) (* ?x29 |v6:3|))))
(let ((?x98 (+ (+ (* (- 20) |v1:8|) (* (- 16) |v5:4|)) (* ?x96 |v0:9|))))
(let (($x86 (<= (+ (+ (* ?x50 |v7:2|) ?x80) (* 14 |v4:5|)) 6)))
(let (($x150 (or (and $x86 (or (<= ?x98 (- 20)) (<= ?x106 (- 18)))) (and $x130 (and (<= ?x139 ?x29) (<= ?x145 (- 2)))))))
(let ((?x71 (+ (+ (* 5 |v4:5|) (* 12 |v4:5|)) (* ?x63 |v8:1|))))
(let (($x64 (<= (+ (+ (* ?x29 |v8:1|) (* ?x50 |v2:7|)) (* (- 12) |v0:9|)) ?x63)))
(let ((?x49 (+ (+ (* 17 |v0:9|) (* (- 18) |v6:3|)) (* ?x29 |v0:9|))))
(let ((?x36 (+ (+ (* 6 |v0:9|) (* ?x29 |v1:8|)) (* 5 |v9:0|))))
(let (($x74 (or (or (<= ?x36 1) (<= ?x49 ?x50)) (or $x64 (<= ?x71 12)))))
(let ((?x20 (+ (+ (* (- 8) |v1:8|) (* (- 9) |v4:5|)) (* 19 |v4:5|))))
(and (and (or (<= ?x20 (- 10)) $x74) $x150) (or $x190 (<= ?x199 ?x116))))))))))))))))))))))))))))))))
)
)
)
)
)
)
)
)
)
)
(check-sat)
(exit)
