(set-info :smt-lib-version 2.6)
;;; Processed by pysmt to remove constant-real bitvector literals
(set-logic QF_FP)
(set-info :source |SPARK inspired floating point problems by Florian Schanda and Martin Brain|)
(set-info :category "crafted")
(set-info :status sat)
(define-fun is_finite ((f Float32)) Bool (or (fp.isZero f) (fp.isNormal f) (fp.isSubnormal f)))
(declare-fun a () Float32)
(declare-fun b () Float32)
(declare-fun c () Float32)
(assert (is_finite a))
(assert (is_finite b))
(assert (is_finite c))
(assert (is_finite (fp.mul RNE a b)))
(assert (is_finite (fp.mul RNE b c)))
(assert (is_finite (fp.mul RNE a (fp.mul RNE b c))))
(assert (is_finite (fp.mul RNE (fp.mul RNE a b) c)))
(assert (not (fp.eq (fp.mul RNE a (fp.mul RNE b c)) (fp.mul RNE (fp.mul RNE a b) c))))
(check-sat)
(exit)