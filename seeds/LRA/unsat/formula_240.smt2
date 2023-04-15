(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Monniaux, David; Quantifier Elimination by Lazy Model Enumeration, CAV 2010
|)
(set-info :category "random")
; ./Mjollnir_examples/B1/formula_240.m
(set-info :status unsat)
(assert
 (forall ((|v9:0| Real) )(exists ((|v8:1| Real) )(forall ((|v7:2| Real) )(exists ((|v6:3| Real) )(forall ((|v5:4| Real) )(exists ((|v4:5| Real) )(forall ((|v3:6| Real) )(exists ((|v2:7| Real) )(forall ((|v1:8| Real) )(exists ((|v0:9| Real) )(let ((?x27 5))
(let (($x294 (<= (+ (+ (* 12 |v3:6|) (* ?x27 |v7:2|)) (* ?x27 |v1:8|)) ?x27)))
(let ((?x86 (- 12)))
(let ((?x287 (+ (+ (* (- 2) |v0:9|) (* 0 |v2:7|)) (* (- 18) |v0:9|))))
(let ((?x280 (+ (+ (* (- 18) |v7:2|) (* (- 20) |v4:5|)) (* (- 19) |v2:7|))))
(let ((?x99 (- 8)))
(let ((?x44 (- 7)))
(let ((?x230 (* ?x44 |v1:8|)))
(let (($x274 (<= (+ (+ (* 19 |v5:4|) (* (- 11) |v9:0|)) ?x230) ?x99)))
(let ((?x265 (+ (+ (* 18 |v3:6|) (* 9 |v6:3|)) (* ?x86 |v5:4|))))
(let ((?x67 (- 13)))
(let ((?x258 (+ (+ (* (- 15) |v9:0|) (* (- 10) |v2:7|)) (* 2 |v2:7|))))
(let ((?x249 (+ (+ (* (- 6) |v3:6|) (* ?x67 |v4:5|)) (* (- 11) |v1:8|))))
(let ((?x243 (+ (+ (* ?x67 |v3:6|) (* 13 |v8:1|)) (* (- 20) |v3:6|))))
(let (($x269 (and (and (<= ?x243 ?x99) (<= ?x249 11)) (and (<= ?x258 ?x67) (<= ?x265 (- 17))))))
(let (($x297 (and $x269 (or (or $x274 (<= ?x280 10)) (or (<= ?x287 ?x86) $x294)))))
(let ((?x35 (- 6)))
(let ((?x133 14))
(let ((?x228 (+ (+ (* 16 |v0:9|) (* (- 3) |v6:3|)) (* ?x67 |v7:2|))))
(let (($x236 (or (<= ?x228 ?x133) (<= (+ (+ ?x230 (* 15 |v8:1|)) (* ?x27 |v9:0|)) ?x35))))
(let ((?x83 0))
(let ((?x145 (* ?x83 |v2:7|)))
(let (($x222 (<= (+ (+ (* (- 18) |v6:3|) (* (- 20) |v6:3|)) ?x145) ?x35)))
(let (($x223 (or (<= (+ (+ (* 4 |v5:4|) (* ?x35 |v0:9|)) |v7:2|) ?x86) $x222)))
(let ((?x170 (- 20)))
(let (($x211 (<= (+ (+ (* 20 |v1:8|) (* ?x133 |v0:9|)) (* ?x27 |v5:4|)) ?x170)))
(let ((?x187 9))
(let ((?x204 (+ (+ (* 4 |v9:0|) (* ?x44 |v0:9|)) (* 15 |v3:6|))))
(let ((?x52 1))
(let ((?x197 (+ (+ (* ?x170 |v6:3|) (* (- 2) |v5:4|)) (* 16 |v6:3|))))
(let ((?x191 (+ (+ (* 18 |v8:1|) (* ?x187 |v7:2|)) (* 4 |v1:8|))))
(let (($x238 (and (and (or (<= ?x191 ?x52) (<= ?x197 ?x52)) (and (<= ?x204 ?x187) $x211)) (or $x223 $x236))))
(let ((?x10 7))
(let (($x178 (<= (+ (+ |v2:7| (* (- 2) |v4:5|)) (* 3 |v9:0|)) ?x10)))
(let ((?x169 (+ (+ (* ?x35 |v5:4|) (* 8 |v6:3|)) (* (- 10) |v4:5|))))
(let ((?x161 (+ (+ (* (- 1) |v0:9|) (* 11 |v2:7|)) (* 4 |v2:7|))))
(let (($x152 (<= (+ (+ (* ?x10 |v7:2|) ?x145) (* 15 |v1:8|)) (- 4))))
(let ((?x139 (- 11)))
(let (($x140 (<= (+ (+ (* ?x133 |v5:4|) (* ?x35 |v8:1|)) (* (- 19) |v4:5|)) ?x139)))
(let ((?x19 16))
(let ((?x129 (+ (+ (* 13 |v9:0|) (* 3 |v7:2|)) (* 2 |v5:4|))))
(let ((?x71 4))
(let ((?x118 (+ (+ (* ?x83 |v8:1|) (* 8 |v4:5|)) (* 12 |v6:3|))))
(let ((?x107 (+ (+ (* (- 18) |v5:4|) (* ?x27 |v4:5|)) (* (- 14) |v0:9|))))
(let (($x142 (or (and (<= ?x107 20) (<= ?x118 ?x71)) (or (<= ?x129 ?x19) $x140))))
(let ((?x98 (+ (+ (* ?x27 |v2:7|) (* 19 |v1:8|)) (* 13 |v4:5|))))
(let ((?x85 (+ (+ (* (- 10) |v0:9|) (* (- 14) |v4:5|)) (* ?x83 |v0:9|))))
(let (($x88 (and (<= (+ (+ |v0:9| (* ?x67 |v0:9|)) (* ?x71 |v7:2|)) (- 18)) (<= ?x85 ?x86))))
(let (($x62 (<= (+ (+ (* 19 |v3:6|) (* ?x19 |v7:2|)) |v7:2|) (- 5))))
(let ((?x51 (+ (+ (* ?x44 |v9:0|) (* (- 10) |v6:3|)) (* (- 3) |v3:6|))))
(let (($x39 (<= (+ (+ (* ?x27 |v4:5|) (* (- 19) |v8:1|)) (* ?x35 |v7:2|)) 17)))
(let ((?x22 (- 10)))
(let (($x23 (<= (+ (+ (* ?x10 |v0:9|) (* (- 3) |v8:1|)) (* ?x19 |v5:4|)) ?x22)))
(let (($x102 (or (and (or $x23 $x39) (and (<= ?x51 ?x52) $x62)) (and $x88 (<= ?x98 ?x99)))))
(let (($x182 (and $x102 (and $x142 (and (and $x152 (<= ?x161 ?x10)) (or (<= ?x169 ?x170) $x178))))))
(or $x182 (or $x238 $x297))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
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
