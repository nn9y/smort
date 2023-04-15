(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Monniaux, David; Quantifier Elimination by Lazy Model Enumeration, CAV 2010
|)
(set-info :category "random")
; ./Mjollnir_examples/B1/formula_226.m
(set-info :status sat)
(assert
 (forall ((|v9:0| Real) )(exists ((|v8:1| Real) )(forall ((|v7:2| Real) )(exists ((|v6:3| Real) )(forall ((|v5:4| Real) )(exists ((|v4:5| Real) )(forall ((|v3:6| Real) )(exists ((|v2:7| Real) )(forall ((|v1:8| Real) )(exists ((|v0:9| Real) )(let ((?x51 3))
(let ((?x290 (+ (+ (* (- 11) |v9:0|) (* (- 5) |v2:7|)) (* (- 3) |v4:5|))))
(let ((?x22 9))
(let ((?x284 (+ (+ (* 16 |v5:4|) (* (- 5) |v4:5|)) (* 17 |v7:2|))))
(let ((?x74 12))
(let ((?x277 (+ (+ (* ?x74 |v2:7|) (* (- 14) |v4:5|)) (* (- 4) |v9:0|))))
(let ((?x124 20))
(let (($x279 (or (<= (+ (+ (* (- 11) |v5:4|) (* ?x51 |v2:7|)) |v5:4|) ?x124) (<= ?x277 ?x74))))
(let ((?x264 (+ (+ (* (- 9) |v6:3|) (* (- 13) |v0:9|)) (* (- 8) |v9:0|))))
(let ((?x107 (- 19)))
(let ((?x257 (+ (+ (* (- 18) |v5:4|) (* 2 |v2:7|)) (* 4 |v4:5|))))
(let ((?x249 (+ (+ (* 5 |v4:5|) (* 18 |v6:3|)) (* (- 6) |v2:7|))))
(let ((?x39 (- 2)))
(let ((?x242 (+ (+ (* 8 |v6:3|) (* 0 |v0:9|)) (* ?x22 |v1:8|))))
(let (($x267 (and (and (<= ?x242 ?x39) (<= ?x249 (- 17))) (and (<= ?x257 ?x107) (<= ?x264 ?x22)))))
(let ((?x10 5))
(let ((?x233 (+ (+ (* 10 |v2:7|) (* ?x51 |v3:6|)) (* 4 |v1:8|))))
(let ((?x228 (+ (+ (* 6 |v8:1|) (* (- 6) |v7:2|)) (* (- 20) |v5:4|))))
(let (($x220 (<= (+ (+ |v1:8| (* (- 15) |v7:2|)) (* 8 |v8:1|)) ?x22)))
(let ((?x145 4))
(let ((?x92 10))
(let ((?x202 (* ?x92 |v2:7|)))
(let (($x221 (or (<= (+ (+ (* ?x124 |v5:4|) (* (- 15) |v3:6|)) ?x202) ?x145) $x220)))
(let ((?x103 0))
(let ((?x199 (+ (+ (* (- 13) |v6:3|) (* (- 9) |v0:9|)) (* (- 11) |v3:6|))))
(let (($x207 (and (<= ?x199 ?x74) (<= (+ (+ (* ?x39 |v4:5|) ?x202) (* (- 18) |v9:0|)) ?x103))))
(let ((?x190 (+ (+ (* 2 |v8:1|) (* ?x39 |v7:2|)) (* (- 11) |v4:5|))))
(let ((?x19 6))
(let ((?x101 (* ?x19 |v7:2|)))
(let (($x183 (<= (+ (+ (* 18 |v3:6|) (* (- 10) |v5:4|)) ?x101) ?x10)))
(let (($x237 (and (and (or $x183 (<= ?x190 ?x22)) $x207) (or $x221 (or (<= ?x228 (- 1)) (<= ?x233 ?x10))))))
(let ((?x47 16))
(let ((?x174 (+ (+ (* (- 18) |v1:8|) (* (- 1) |v1:8|)) (* ?x47 |v9:0|))))
(let (($x167 (<= (+ (+ (* 11 |v2:7|) (* ?x103 |v7:2|)) (* ?x145 |v9:0|)) ?x107)))
(let ((?x159 (+ (+ (* 18 |v8:1|) (* 2 |v7:2|)) (* 11 |v3:6|))))
(let ((?x151 (+ (+ (* (- 3) |v5:4|) (* ?x145 |v8:1|)) (* 2 |v3:6|))))
(let ((?x14 (- 5)))
(let ((?x117 18))
(let ((?x139 (* ?x117 |v3:6|)))
(let (($x134 (<= (+ (+ (* 17 |v1:8|) |v7:2|) (* 14 |v8:1|)) (- 14))))
(let (($x125 (<= (+ (+ (* ?x22 |v6:3|) (* ?x117 |v9:0|)) (* (- 9) |v6:3|)) ?x124)))
(let (($x142 (or (and $x125 $x134) (<= (+ (+ (* ?x124 |v3:6|) (* (- 6) |v9:0|)) ?x139) ?x14))))
(let (($x178 (and $x142 (or (or (<= ?x151 ?x92) (<= ?x159 ?x92)) (and $x167 (<= ?x174 ?x47))))))
(let ((?x99 (+ (+ (* ?x92 |v6:3|) (* 8 |v4:5|)) (* (- 4) |v5:4|))))
(let (($x111 (or (<= ?x99 ?x10) (<= (+ (+ ?x101 (* ?x103 |v9:0|)) (* ?x107 |v2:7|)) ?x74))))
(let ((?x88 (- 6)))
(let ((?x87 (+ (+ (* (- 18) |v0:9|) (* ?x10 |v6:3|)) (* 14 |v1:8|))))
(let (($x77 (<= (+ (+ (* ?x19 |v6:3|) (* 19 |v5:4|)) (* ?x74 |v5:4|)) (- 12))))
(let ((?x64 (+ (+ (* 8 |v1:8|) (* 8 |v0:9|)) (* (- 3) |v6:3|))))
(let ((?x43 (- 3)))
(let (($x67 (and (<= (+ (+ (* ?x43 |v9:0|) (* ?x47 |v7:2|)) (* ?x51 |v0:9|)) ?x43) (<= ?x64 (- 7)))))
(let ((?x38 (+ (+ (* 19 |v4:5|) (* (- 10) |v9:0|)) (* (- 12) |v0:9|))))
(let (($x41 (or (<= (+ (+ (* ?x10 |v8:1|) (* ?x14 |v3:6|)) (* ?x19 |v2:7|)) ?x22) (<= ?x38 ?x39))))
(or (or (or (or $x41 $x67) (and (or $x77 (<= ?x87 ?x88)) $x111)) $x178) (or $x237 (or $x267 (or $x279 (and (<= ?x284 ?x22) (<= ?x290 ?x51))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
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
