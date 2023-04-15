(set-info :smt-lib-version 2.6)
(set-logic QF_NIA)
(set-info :source |
Generated by: Cristina Borralleras, Daniel Larraz, Albert Oliveras, Enric Rodriguez-Carbonell, Albert Rubio
Generated on: 2017-04-27
Generator: VeryMax
Application: Termination proving
Target solver: barcelogic
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun Nl2arg11 () Int)
(declare-fun Nl2arg21 () Int)
(declare-fun Nl2arg12 () Int)
(declare-fun Nl2arg22 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun Nl2CT2 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n0 () Int)
(declare-fun arg1 () Int)
(declare-fun arg2 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam5n3 () Int)
(declare-fun lam5n4 () Int)
(declare-fun lam5n5 () Int)
(declare-fun FV_arg1_1 () Int)
(declare-fun FV_arg2_1 () Int)
(assert ( and ( <= ( - 1 ) Nl2arg11 ) ( <= Nl2arg11 1 ) ( <= ( - 1 ) Nl2arg21 ) ( <= Nl2arg21 1 ) ( <= ( - 1 ) Nl2arg12 ) ( <= Nl2arg12 1 ) ( <= ( - 1 ) Nl2arg22 ) ( <= Nl2arg22 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( > ( + ( * 52 lam0n0 ) ( * 52 lam0n1 ) ( * 1 lam0n2 ) ( * ( - 100 ) lam0n3 ) ( * Nl2CT1 lam0n4 ) ( * Nl2CT2 lam0n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n2 ) ( * 1 lam0n3 ) ( * Nl2arg11 lam0n4 ) ( * Nl2arg12 lam0n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * ( - 1 ) lam0n2 ) ( * 1 lam0n3 ) ( * Nl2arg21 lam0n4 ) ( * Nl2arg22 lam0n5 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( >= lam1n4 0 ) ( >= lam1n5 0 ) ( > ( + ( * 52 lam1n0 ) ( * 52 lam1n1 ) ( * 1 lam1n2 ) ( * ( - 100 ) lam1n3 ) ( * Nl2CT1 lam1n4 ) ( * Nl2CT2 lam1n5 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2arg11 1 ) ) ( * Nl2arg21 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * 1 lam1n2 ) ( * 1 lam1n3 ) ( * Nl2arg11 lam1n4 ) ( * Nl2arg12 lam1n5 ) ( - ( + 0 ( * Nl2arg11 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * ( - 1 ) lam1n1 ) ( * ( - 1 ) lam1n2 ) ( * 1 lam1n3 ) ( * Nl2arg21 lam1n4 ) ( * Nl2arg22 lam1n5 ) ( - ( + 0 ( * Nl2arg21 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( > ( + ( * 52 lam0n0 ) ( * 52 lam0n1 ) ( * 1 lam0n2 ) ( * ( - 100 ) lam0n3 ) ( * Nl2CT1 lam0n4 ) ( * Nl2CT2 lam0n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n2 ) ( * 1 lam0n3 ) ( * Nl2arg11 lam0n4 ) ( * Nl2arg12 lam0n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * ( - 1 ) lam0n2 ) ( * 1 lam0n3 ) ( * Nl2arg21 lam0n4 ) ( * Nl2arg22 lam0n5 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( >= lam2n4 0 ) ( >= lam2n5 0 ) ( > ( + ( * 52 lam2n0 ) ( * 52 lam2n1 ) ( * 1 lam2n2 ) ( * ( - 100 ) lam2n3 ) ( * Nl2CT1 lam2n4 ) ( * Nl2CT2 lam2n5 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2arg12 1 ) ) ( * Nl2arg22 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * 1 lam2n2 ) ( * 1 lam2n3 ) ( * Nl2arg11 lam2n4 ) ( * Nl2arg12 lam2n5 ) ( - ( + 0 ( * Nl2arg12 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * ( - 1 ) lam2n1 ) ( * ( - 1 ) lam2n2 ) ( * 1 lam2n3 ) ( * Nl2arg21 lam2n4 ) ( * Nl2arg22 lam2n5 ) ( - ( + 0 ( * Nl2arg22 1 ) ) ) ) 0 ) ) ))
(assert ( and ( = arg1 0 ) ( = ( + ( - 100 ) arg2 ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2arg11 ) arg1 ) ( * ( + 0 Nl2arg21 ) arg2 ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2arg12 ) arg1 ) ( * ( + 0 Nl2arg22 ) arg2 ) ) 0 ) ( <= ( + 50 ( * ( - 1 ) arg2 ) ) 0 ) ( <= ( + ( - 100 ) arg1 arg2 ) 0 ) ))
(assert ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n3 0 ) ( >= lam5n4 0 ) ( >= lam5n5 0 ) ( > ( + ( * 52 lam5n0 ) ( * ( - 100 ) lam5n1 ) ( * ( - 51 ) lam5n2 ) ( * 50 lam5n3 ) ( * Nl2CT1 lam5n4 ) ( * Nl2CT2 lam5n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * 1 lam5n1 ) ( * Nl2arg11 lam5n4 ) ( * Nl2arg12 lam5n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * 1 lam5n1 ) ( * 1 lam5n2 ) ( * ( - 1 ) lam5n3 ) ( * Nl2arg21 lam5n4 ) ( * Nl2arg22 lam5n5 ) ) 0 ) ))
(assert ( and ( and ( <= ( + Nl2CT1 ( * Nl2arg11 FV_arg1_1 ) ( * Nl2arg21 FV_arg2_1 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2arg12 FV_arg1_1 ) ( * Nl2arg22 FV_arg2_1 ) ) 0 ) ) ( or ( and ( <= ( + 52 ( * ( - 1 ) FV_arg1_1 ) ( * ( - 1 ) FV_arg2_1 ) ) 0 ) ( <= ( + 52 ( * ( - 1 ) FV_arg2_1 ) ) 0 ) ( <= ( + 1 FV_arg1_1 ( * ( - 1 ) FV_arg2_1 ) ) 0 ) ( <= ( + ( - 100 ) FV_arg1_1 FV_arg2_1 ) 0 ) ) ( and ( <= ( + 1 FV_arg1_1 ( * ( - 1 ) FV_arg2_1 ) ) 0 ) ( <= ( + ( - 51 ) FV_arg1_1 FV_arg2_1 ) 0 ) ( <= ( + 50 ( * ( - 1 ) FV_arg2_1 ) ) 0 ) ) ) ))
(assert ( and ( and ( <= ( + Nl2CT1 ( * Nl2arg11 FV_arg1_1 ) ( * Nl2arg21 FV_arg2_1 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2arg12 FV_arg1_1 ) ( * Nl2arg22 FV_arg2_1 ) ) 0 ) ) ( and ( <= ( + 1 FV_arg1_1 ( * ( - 1 ) FV_arg2_1 ) ) 0 ) ( <= ( + ( - 51 ) FV_arg1_1 FV_arg2_1 ) 0 ) ( <= ( + 50 ( * ( - 1 ) FV_arg2_1 ) ) 0 ) ) ))
(check-sat)
(exit)