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
(set-info :status sat)
(declare-fun Nl2main_a1 () Int)
(declare-fun Nl2main_b1 () Int)
(declare-fun Nl2main_a2 () Int)
(declare-fun Nl2main_b2 () Int)
(declare-fun Nl2main_a3 () Int)
(declare-fun Nl2main_b3 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun Nl2CT2 () Int)
(declare-fun Nl2CT3 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun main_a () Int)
(declare-fun undef3 () Int)
(declare-fun main_b () Int)
(declare-fun undef4 () Int)
(declare-fun FV_main_a_1 () Int)
(declare-fun FV_main_b_1 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n3 () Int)
(declare-fun FV_main_a_2 () Int)
(declare-fun FV_main_b_2 () Int)
(assert ( and ( <= ( - 1 ) Nl2main_a1 ) ( <= Nl2main_a1 1 ) ( <= ( - 1 ) Nl2main_b1 ) ( <= Nl2main_b1 1 ) ( <= ( - 1 ) Nl2main_a2 ) ( <= Nl2main_a2 1 ) ( <= ( - 1 ) Nl2main_b2 ) ( <= Nl2main_b2 1 ) ( <= ( - 1 ) Nl2main_a3 ) ( <= Nl2main_a3 1 ) ( <= ( - 1 ) Nl2main_b3 ) ( <= Nl2main_b3 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * 7 lam0n0 ) ( * Nl2CT1 lam0n1 ) ( * Nl2CT2 lam0n2 ) ( * Nl2CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl2main_a1 lam0n1 ) ( * Nl2main_a2 lam0n2 ) ( * Nl2main_a3 lam0n3 ) ) 0 ) ( = ( + ( * Nl2main_b1 lam0n1 ) ( * Nl2main_b2 lam0n2 ) ( * Nl2main_b3 lam0n3 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( > ( + ( * 7 lam1n0 ) ( * Nl2CT1 lam1n1 ) ( * Nl2CT2 lam1n2 ) ( * Nl2CT3 lam1n3 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2main_a1 0 ) ) ( * Nl2main_b1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * Nl2main_a1 lam1n1 ) ( * Nl2main_a2 lam1n2 ) ( * Nl2main_a3 lam1n3 ) ( - ( + 0 ( * Nl2main_b1 1 ) ) ) ) 0 ) ( = ( + ( * Nl2main_b1 lam1n1 ) ( * Nl2main_b2 lam1n2 ) ( * Nl2main_b3 lam1n3 ) ( - ( + 0 ( * Nl2main_a1 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * 7 lam0n0 ) ( * Nl2CT1 lam0n1 ) ( * Nl2CT2 lam0n2 ) ( * Nl2CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl2main_a1 lam0n1 ) ( * Nl2main_a2 lam0n2 ) ( * Nl2main_a3 lam0n3 ) ) 0 ) ( = ( + ( * Nl2main_b1 lam0n1 ) ( * Nl2main_b2 lam0n2 ) ( * Nl2main_b3 lam0n3 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( > ( + ( * 7 lam2n0 ) ( * Nl2CT1 lam2n1 ) ( * Nl2CT2 lam2n2 ) ( * Nl2CT3 lam2n3 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2main_a2 0 ) ) ( * Nl2main_b2 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * Nl2main_a1 lam2n1 ) ( * Nl2main_a2 lam2n2 ) ( * Nl2main_a3 lam2n3 ) ( - ( + 0 ( * Nl2main_b2 1 ) ) ) ) 0 ) ( = ( + ( * Nl2main_b1 lam2n1 ) ( * Nl2main_b2 lam2n2 ) ( * Nl2main_b3 lam2n3 ) ( - ( + 0 ( * Nl2main_a2 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * 7 lam0n0 ) ( * Nl2CT1 lam0n1 ) ( * Nl2CT2 lam0n2 ) ( * Nl2CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl2main_a1 lam0n1 ) ( * Nl2main_a2 lam0n2 ) ( * Nl2main_a3 lam0n3 ) ) 0 ) ( = ( + ( * Nl2main_b1 lam0n1 ) ( * Nl2main_b2 lam0n2 ) ( * Nl2main_b3 lam0n3 ) ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( > ( + ( * 7 lam3n0 ) ( * Nl2CT1 lam3n1 ) ( * Nl2CT2 lam3n2 ) ( * Nl2CT3 lam3n3 ) ( - 1 ( + ( + Nl2CT3 ( * Nl2main_a3 0 ) ) ( * Nl2main_b3 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl2main_a1 lam3n1 ) ( * Nl2main_a2 lam3n2 ) ( * Nl2main_a3 lam3n3 ) ( - ( + 0 ( * Nl2main_b3 1 ) ) ) ) 0 ) ( = ( + ( * Nl2main_b1 lam3n1 ) ( * Nl2main_b2 lam3n2 ) ( * Nl2main_b3 lam3n3 ) ( - ( + 0 ( * Nl2main_a3 1 ) ) ) ) 0 ) ) ))
(assert ( and ( <= ( + Nl2CT1 ( * Nl2main_a1 FV_main_a_1 ) ( * Nl2main_b1 FV_main_b_1 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2main_a2 FV_main_a_1 ) ( * Nl2main_b2 FV_main_b_1 ) ) 0 ) ( <= ( + Nl2CT3 ( * Nl2main_a3 FV_main_a_1 ) ( * Nl2main_b3 FV_main_b_1 ) ) 0 ) ))
(assert ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( > ( + ( * ( - 6 ) lam7n0 ) ( * Nl2CT1 lam7n1 ) ( * Nl2CT2 lam7n2 ) ( * Nl2CT3 lam7n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * Nl2main_a1 lam7n1 ) ( * Nl2main_a2 lam7n2 ) ( * Nl2main_a3 lam7n3 ) ) 0 ) ( = ( + ( * Nl2main_b1 lam7n1 ) ( * Nl2main_b2 lam7n2 ) ( * Nl2main_b3 lam7n3 ) ) 0 ) ))
(assert ( and ( and ( <= ( + Nl2CT1 ( * Nl2main_a1 FV_main_a_2 ) ( * Nl2main_b1 FV_main_b_2 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2main_a2 FV_main_a_2 ) ( * Nl2main_b2 FV_main_b_2 ) ) 0 ) ( <= ( + Nl2CT3 ( * Nl2main_a3 FV_main_a_2 ) ( * Nl2main_b3 FV_main_b_2 ) ) 0 ) ) ( <= ( + 7 ( * ( - 1 ) FV_main_a_2 ) ) 0 ) ))
(check-sat)
(exit)
