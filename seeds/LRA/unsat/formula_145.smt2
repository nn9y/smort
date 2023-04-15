(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Monniaux, David; Quantifier Elimination by Lazy Model Enumeration, CAV 2010
|)
(set-info :category "random")
; ./Mjollnir_examples/B2/formula_145.m
(set-info :status unsat)
(assert
 (forall ((|v11:0| Real) )(exists ((|v10:1| Real) )(forall ((|v9:2| Real) )(exists ((|v8:3| Real) )(forall ((|v7:4| Real) )(exists ((|v6:5| Real) )(forall ((|v5:6| Real) )(exists ((|v4:7| Real) )(forall ((|v3:8| Real) )(exists ((|v2:9| Real) )(forall ((|v1:10| Real) )(exists ((|v0:11| Real) )(let ((?x238 (+ (+ (* (- 4) |v11:0|) (* 7 |v5:6|)) (* 10 |v2:9|))))
(let ((?x33 10))
(let ((?x230 (+ (+ (* 13 |v3:8|) (* 19 |v10:1|)) (* (- 18) |v3:8|))))
(let ((?x145 (- 10)))
(let ((?x72 (* (- 6) |v1:10|)))
(let ((?x219 (+ (+ (* 9 |v9:2|) (* (- 16) |v2:9|)) (* 2 |v6:5|))))
(let ((?x212 (+ (+ (+ |v4:7| (* (- 16) |v10:1|)) (* ?x145 |v4:7|)) (* 19 |v1:10|))))
(let ((?x199 (+ (+ (* 15 |v1:10|) (* 14 |v5:6|)) (* 15 |v0:11|))))
(let ((?x56 (- 17)))
(let ((?x191 (+ (+ (* 20 |v1:10|) (* 4 |v5:6|)) (* (- 1) |v9:2|))))
(let (($x205 (and (<= (+ ?x191 (* 0 |v1:10|)) ?x56) (<= (+ ?x199 (* 6 |v3:8|)) ?x145))))
(let ((?x29 (- 4)))
(let ((?x183 (+ (+ (+ (* 9 |v7:4|) |v3:8|) (* (- 5) |v6:5|)) (* (- 11) |v10:1|))))
(let ((?x105 (- 11)))
(let ((?x174 (+ (+ (+ (* ?x105 |v9:2|) (* ?x145 |v6:5|)) (* 20 |v3:8|)) (* (- 5) |v7:4|))))
(let ((?x161 (+ (+ (* (- 19) |v2:9|) (* (- 19) |v7:4|)) (* (- 15) |v8:3|))))
(let ((?x63 (- 18)))
(let ((?x51 (- 16)))
(let ((?x152 (* ?x51 |v10:1|)))
(let ((?x153 (+ (+ (+ (* ?x145 |v4:7|) (* ?x29 |v4:7|)) (* (- 12) |v7:4|)) ?x152)))
(let (($x186 (and (and (<= ?x153 ?x63) (<= (+ ?x161 (* 7 |v2:9|)) ?x56)) (or (<= ?x174 ?x105) (<= ?x183 ?x29)))))
(let (($x224 (and $x186 (and $x205 (or (<= ?x212 (- 9)) (<= (+ ?x219 ?x72) ?x145))))))
(let ((?x133 (+ (+ (* 4 |v8:3|) (* 18 |v9:2|)) (* 17 |v7:4|))))
(let ((?x77 2))
(let ((?x118 (+ (+ (* 14 |v3:8|) (* ?x29 |v11:0|)) (* 15 |v2:9|))))
(let (($x141 (or (<= (+ ?x118 (* ?x77 |v5:6|)) ?x77) (<= (+ ?x133 (* (- 3) |v10:1|)) (- 1)))))
(let ((?x103 (+ (+ (* (- 14) |v4:7|) (* (- 5) |v1:10|)) (* 5 |v5:6|))))
(let ((?x91 (+ (+ (+ (* 11 |v6:5|) |v9:2|) (* ?x33 |v5:6|)) (* (- 2) |v8:3|))))
(let (($x110 (or (<= ?x91 1) (<= (+ ?x103 (* ?x105 |v4:7|)) (- 15)))))
(let ((?x76 (+ (+ (+ (* 0 |v6:5|) ?x72) (* 0 |v0:11|)) |v2:9|)))
(let ((?x62 (+ (+ (+ (* ?x51 |v9:2|) (* ?x51 |v9:2|)) (* ?x56 |v1:10|)) (* (- 8) |v4:7|))))
(let ((?x45 (+ (+ (+ (* ?x29 |v4:7|) (* ?x33 |v8:3|)) (* 3 |v0:11|)) (* 13 |v2:9|))))
(let ((?x23 (+ (+ (+ (* 20 |v11:0|) |v5:6|) (* 15 |v9:2|)) (* (- 14) |v7:4|))))
(let (($x80 (or (and (<= ?x23 12) (<= ?x45 (- 13))) (or (<= ?x62 ?x63) (<= ?x76 ?x77)))))
(let (($x234 (or (and (and $x80 (or $x110 $x141)) $x224) (<= (+ ?x230 (* 7 |v7:4|)) ?x33))))
(or $x234 (<= (+ ?x238 (* 12 |v1:10|)) (- 9)))))))))))))))))))))))))))))))))))))))
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
)
)
(check-sat)
(exit)
