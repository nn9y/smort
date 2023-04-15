(set-info :smt-lib-version 2.6)
(set-logic QF_BVFP)
(set-info :source |
Generated by: Daniel Liew, Daniel Schemmel, Cristian Cadar, Alastair Donaldson, and Rafael Zähl
Generated on: 2017-4-28
Generator: KLEE
Application: Branch satisfiability check for symbolic execution of C programs
Target solver: Z3 or MathSAT5
Corresponding query: An equisatisfiable query (bitvectors replaced with reads from arrays of bitvectors) is available at QF_ABVFP/20170428-Liew-KLEE/imperial_gsl_benchmarks_sort_smallest_klee_bug.x86_64/query.1612.smt2
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status sat)
(declare-fun x_ackermann!1 () (_ BitVec 64))
(declare-fun x_ackermann!0 () (_ BitVec 64))
(declare-fun x_ackermann!2 () (_ BitVec 64))
(declare-fun x_ackermann!3 () (_ BitVec 64))
(declare-fun x_ackermann!4 () (_ BitVec 64))
(declare-fun x_ackermann!5 () (_ BitVec 64))
(assert
 (let ((?x14 ((_ to_fp 11 53) x_ackermann!1)))
 (let ((?x13 ((_ to_fp 11 53) x_ackermann!0)))
 (fp.gt ?x13 ?x14))))
(assert
 (not (fp.gt ((_ to_fp 11 53) x_ackermann!2) ((_ to_fp 11 53) x_ackermann!0))))
(assert
 (let ((?x14 ((_ to_fp 11 53) x_ackermann!1)))
 (let ((?x16 ((_ to_fp 11 53) x_ackermann!2)))
 (fp.gt ?x16 ?x14))))
(assert
 (let ((?x20 ((_ to_fp 11 53) x_ackermann!3)))
 (let (($x21 (fp.isNaN ?x20)))
 (or (or $x21 (fp.isNaN ((_ to_fp 11 53) x_ackermann!0))) (fp.lt ?x20 ((_ to_fp 11 53) x_ackermann!0))))))
(assert
 (let ((?x16 ((_ to_fp 11 53) x_ackermann!2)))
 (let ((?x20 ((_ to_fp 11 53) x_ackermann!3)))
 (fp.gt ?x20 ?x16))))
(assert
 (let ((?x20 ((_ to_fp 11 53) x_ackermann!3)))
 (let (($x21 (fp.isNaN ?x20)))
 (let ((?x27 ((_ to_fp 11 53) x_ackermann!4)))
 (let (($x28 (fp.isNaN ?x27)))
 (or (or $x28 $x21) (fp.lt ?x27 ?x20)))))))
(assert
 (let ((?x16 ((_ to_fp 11 53) x_ackermann!2)))
 (let ((?x27 ((_ to_fp 11 53) x_ackermann!4)))
 (fp.gt ?x27 ?x16))))
(assert
 (let ((?x27 ((_ to_fp 11 53) x_ackermann!4)))
 (let (($x28 (fp.isNaN ?x27)))
 (or $x28 (fp.lt ((_ to_fp 11 53) x_ackermann!5) ?x27)))))
(assert
 (not (fp.gt ((_ to_fp 11 53) x_ackermann!5) ((_ to_fp 11 53) x_ackermann!2))))
(assert
 (not (fp.gt ((_ to_fp 11 53) x_ackermann!5) ((_ to_fp 11 53) x_ackermann!1))))
(assert
 (let ((?x33 ((_ to_fp 11 53) x_ackermann!5)))
 (let (($x40 (fp.isNaN ?x33)))
 (not $x40))))
(assert
 (let ((?x33 ((_ to_fp 11 53) x_ackermann!5)))
 (let (($x40 (fp.isNaN ?x33)))
 (or (or (fp.isNaN ((_ to_fp 11 53) x_ackermann!1)) $x40) (fp.gt ((_ to_fp 11 53) x_ackermann!1) ?x33)))))
(assert
 (not false))
(check-sat)
(exit)