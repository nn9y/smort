(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Monniaux, David; Quantifier Elimination by Lazy Model Enumeration, CAV 2010
|)
(set-info :category "random")
; ./Mjollnir_examples/B1/formula_158.m
(set-info :status sat)
(assert
 (forall ((|v9:0| Real) )(exists ((|v8:1| Real) )(forall ((|v7:2| Real) )(exists ((|v6:3| Real) )(forall ((|v5:4| Real) )(exists ((|v4:5| Real) )(forall ((|v3:6| Real) )(exists ((|v2:7| Real) )(forall ((|v1:8| Real) )(exists ((|v0:9| Real) )(let ((?x10 (- 11)))
(let ((?x228 (+ (+ (* 12 |v2:7|) (* 0 |v3:6|)) (* (- 6) |v7:2|))))
(let ((?x222 (+ (+ (* (- 13) |v9:0|) (* (- 8) |v0:9|)) (* 9 |v3:6|))))
(let ((?x212 (+ (+ (* (- 5) |v2:7|) (* (- 6) |v5:4|)) (* 18 |v0:9|))))
(let ((?x206 (+ (+ (* (- 2) |v4:5|) (* (- 7) |v3:6|)) (* 15 |v8:1|))))
(let (($x231 (and (or (<= ?x206 (- 13)) (<= ?x212 12)) (or (<= ?x222 (- 20)) (<= ?x228 ?x10)))))
(let ((?x196 (+ (+ (* 6 |v9:0|) (* 7 |v3:6|)) (* (- 1) |v2:7|))))
(let ((?x66 (- 4)))
(let ((?x36 (* (- 15) |v4:5|)))
(let (($x191 (<= (+ (+ (* (- 18) |v2:7|) (* 4 |v5:4|)) ?x36) ?x66)))
(let ((?x143 0))
(let ((?x183 (+ (+ (* 5 |v1:8|) (* (- 12) |v8:1|)) (* (- 7) |v5:4|))))
(let ((?x18 18))
(let ((?x177 (+ (+ (* ?x66 |v7:2|) (* (- 2) |v9:0|)) (* (- 19) |v2:7|))))
(let ((?x26 (- 1)))
(let ((?x122 (* ?x26 |v7:2|)))
(let (($x169 (<= (+ (+ (* 13 |v3:6|) (* (- 18) |v5:4|)) ?x122) (- 9))))
(let ((?x159 (+ (+ (* 13 |v3:6|) (* 6 |v9:0|)) (* (- 10) |v8:1|))))
(let (($x186 (or (and (<= ?x159 4) $x169) (and (<= ?x177 ?x18) (<= ?x183 ?x143)))))
(let ((?x149 (+ (+ (* 11 |v1:8|) (* ?x143 |v9:0|)) (* 3 |v6:3|))))
(let ((?x92 6))
(let ((?x136 (+ (+ (* 5 |v8:1|) (* 10 |v6:3|)) (* (- 6) |v6:3|))))
(let (($x130 (<= (+ (+ ?x122 (* (- 6) |v5:4|)) (* (- 14) |v8:1|)) 11)))
(let ((?x116 (* (- 5) |v2:7|)))
(let (($x119 (<= (+ (+ (* (- 19) |v5:4|) (* (- 16) |v8:1|)) ?x116) (- 17))))
(let ((?x88 13))
(let ((?x108 (+ (+ (* 8 |v7:2|) (* ?x88 |v4:5|)) (* 2 |v8:1|))))
(let (($x152 (and (or (and (<= ?x108 ?x88) $x119) (or $x130 (<= ?x136 ?x92))) (<= ?x149 17))))
(let ((?x95 (- 19)))
(let (($x84 (<= (+ (+ |v0:9| (* 7 |v3:6|)) (* ?x26 |v1:8|)) 14)))
(let (($x97 (and $x84 (<= (+ (+ (* ?x18 |v3:6|) (* ?x88 |v1:8|)) (* ?x92 |v4:5|)) ?x95))))
(let ((?x74 (+ (+ (* 10 |v8:1|) (* (- 12) |v3:6|)) (* ?x10 |v8:1|))))
(let ((?x65 (+ (+ (* (- 3) |v1:8|) (* (- 6) |v1:8|)) (* ?x18 |v9:0|))))
(let ((?x52 (+ (+ (* 10 |v4:5|) (* 5 |v0:9|)) (* (- 5) |v0:9|))))
(let ((?x38 (- 6)))
(let (($x55 (or (<= (+ (+ (* ?x26 |v1:8|) (* (- 12) |v7:2|)) ?x36) ?x38) (<= ?x52 (- 8)))))
(let ((?x21 (- 7)))
(let (($x22 (<= (+ (+ (* ?x10 |v5:4|) (* (- 10) |v2:7|)) (* ?x18 |v2:7|)) ?x21)))
(let (($x153 (or (and (or $x22 $x55) (and (and (<= ?x65 ?x66) (<= ?x74 ?x26)) $x97)) $x152)))
(or $x153 (and (or $x186 $x191) (or (<= ?x196 (- 20)) $x231)))))))))))))))))))))))))))))))))))))))))))
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
