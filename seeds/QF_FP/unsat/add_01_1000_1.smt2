(set-info :smt-lib-version 2.6)
(set-logic QF_FP)
(set-info :category "crafted")
(set-info :source |Alberto Griggio <griggio@fbk.eu>. These benchmarks were used for the evaluation in the following paper: L. Haller, A. Griggio, M. Brain, D. Kroening: Deciding floating-point logic with systematic abstraction. FMCAD 2012. Real-numbered literals have been automatically translated by MathSAT|)
(set-info :status unsat)
;; MathSAT API call trace
;; generated on 05/20/15 17:24:50

(declare-fun |c::main::1::a!0@1#1| () (_ FloatingPoint 8 24))
(declare-fun |c::main::1::c!0@1#1| () (_ FloatingPoint 8 24))
(declare-fun |goto_symex::&92;guard#1| () Bool)
(declare-fun |c::main::1::b!0@1#1| () (_ FloatingPoint 8 24))
(define-fun _t_3 () RoundingMode RNE)
(define-fun _t_9 () (_ FloatingPoint 8 24) |c::main::1::a!0@1#1|)
(define-fun _t_10 () (_ FloatingPoint 11 53) ((_ to_fp 11 53) _t_3 _t_9))
(define-fun _t_12 () (_ FloatingPoint 11 53) (fp #b0 #b10000001000 #b1111010000000000000000000000000000000000000000000000))
(define-fun _t_13 () Bool (fp.lt _t_10 _t_12))
(define-fun _t_14 () (_ FloatingPoint 8 24) |c::main::1::b!0@1#1|)
(define-fun _t_15 () (_ FloatingPoint 8 24) |c::main::1::c!0@1#1|)
(define-fun _t_16 () (_ FloatingPoint 8 24) (fp.add _t_3 _t_14 _t_15))
(define-fun _t_17 () (_ FloatingPoint 8 24) (fp.add _t_3 _t_9 _t_16))
(define-fun _t_18 () (_ FloatingPoint 8 24) (fp.neg _t_17))
(define-fun _t_19 () (_ FloatingPoint 8 24) (fp.add _t_3 _t_9 _t_14))
(define-fun _t_20 () (_ FloatingPoint 8 24) (fp.add _t_3 _t_15 _t_19))
(define-fun _t_21 () (_ FloatingPoint 8 24) (fp.add _t_3 _t_18 _t_20))
(define-fun _t_22 () (_ FloatingPoint 8 24) (fp #b0 #b10001000 #b11110100000000000000000))
(define-fun _t_23 () Bool (fp.leq _t_21 _t_22))
(define-fun _t_25 () (_ FloatingPoint 11 53) (fp #b1 #b10000001000 #b1111010000000000000000000000000000000000000000000000))
(define-fun _t_26 () Bool (fp.lt _t_25 _t_10))
(define-fun _t_27 () Bool (and _t_13 _t_26))
(define-fun _t_28 () (_ FloatingPoint 11 53) ((_ to_fp 11 53) _t_3 _t_14))
(define-fun _t_29 () Bool (fp.lt _t_28 _t_12))
(define-fun _t_30 () Bool (and _t_27 _t_29))
(define-fun _t_31 () Bool (fp.lt _t_25 _t_28))
(define-fun _t_32 () Bool (and _t_30 _t_31))
(define-fun _t_33 () (_ FloatingPoint 11 53) ((_ to_fp 11 53) _t_3 _t_15))
(define-fun _t_34 () Bool (fp.lt _t_33 _t_12))
(define-fun _t_35 () Bool (and _t_32 _t_34))
(define-fun _t_36 () Bool (fp.lt _t_25 _t_33))
(define-fun _t_37 () Bool (and _t_35 _t_36))
(define-fun _t_38 () Bool (fp.leq _t_14 _t_9))
(define-fun _t_39 () Bool (and _t_37 _t_38))
(define-fun _t_40 () Bool (fp.leq _t_15 _t_14))
(define-fun _t_41 () Bool (and _t_39 _t_40))
(define-fun _t_42 () (_ FloatingPoint 8 24) (fp.neg _t_14))
(define-fun _t_43 () (_ FloatingPoint 8 24) (fp.add _t_3 _t_9 _t_42))
(define-fun _t_45 () (_ FloatingPoint 8 24) (fp #b0 #b01111011 #b10011001100110011001101))
(define-fun _t_46 () Bool (fp.leq _t_43 _t_45))
(define-fun _t_47 () Bool (and _t_41 _t_46))
(define-fun _t_48 () (_ FloatingPoint 8 24) (fp.neg _t_15))
(define-fun _t_49 () (_ FloatingPoint 8 24) (fp.add _t_3 _t_9 _t_48))
(define-fun _t_50 () Bool (fp.leq _t_49 _t_45))
(define-fun _t_51 () Bool (and _t_47 _t_50))
(define-fun _t_52 () (_ FloatingPoint 8 24) (fp.add _t_3 _t_14 _t_48))
(define-fun _t_53 () Bool (fp.leq _t_52 _t_45))
(define-fun _t_54 () Bool (and _t_51 _t_53))
(define-fun _t_55 () (_ FloatingPoint 11 53) ((_ to_fp 11 53) _t_3 _t_20))
(define-fun _t_56 () (_ FloatingPoint 11 53) (_ +oo 11 53))
(define-fun _t_57 () Bool (fp.lt _t_55 _t_56))
(define-fun _t_58 () (_ FloatingPoint 11 53) (_ -oo 11 53))
(define-fun _t_59 () Bool (fp.lt _t_58 _t_55))
(define-fun _t_60 () Bool (and _t_57 _t_59))
(define-fun _t_61 () Bool (and _t_54 _t_60))
(define-fun _t_62 () (_ FloatingPoint 11 53) ((_ to_fp 11 53) _t_3 _t_17))
(define-fun _t_63 () Bool (fp.lt _t_62 _t_56))
(define-fun _t_64 () Bool (fp.lt _t_58 _t_62))
(define-fun _t_65 () Bool (and _t_63 _t_64))
(define-fun _t_66 () Bool (and _t_61 _t_65))
(define-fun _t_67 () Bool (not _t_23))
(define-fun _t_68 () Bool (and _t_66 _t_67))
(assert _t_68)
(check-sat)
(exit)