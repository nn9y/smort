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
(declare-fun Nl3main_x1 () Int)
(declare-fun Nl3main_c1 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun Nl3CT1 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun main_x () Int)
(declare-fun main_c () Int)
(declare-fun undef4 () Int)
(declare-fun undef3 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_main_x () Int)
(declare-fun RFN1_main_c () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(assert ( and ( <= ( - 1 ) Nl3main_x1 ) ( <= Nl3main_x1 1 ) ( <= ( - 1 ) Nl3main_c1 ) ( <= Nl3main_c1 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( > ( + ( * Nl3CT1 lam0n1 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl3main_x1 lam0n1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl3main_c1 lam0n1 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( > ( + ( * Nl3CT1 lam1n1 ) ( - 1 ( + ( + Nl3CT1 ( * Nl3main_x1 0 ) ) ( * Nl3main_c1 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * Nl3main_x1 lam1n1 ) ( - ( + 0 ( * Nl3main_x1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * Nl3main_c1 lam1n1 ) ( - ( + ( + 0 ( * Nl3main_x1 ( - 1 ) ) ) ( * Nl3main_c1 1 ) ) ) ) 0 ) ) ))
(assert ( and ( not ( <= ( + 1 main_x main_c ) 0 ) ) ( <= ( + 1 undef4 ) 0 ) ( = ( + main_x ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_c ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl3CT1 ( * ( + 0 Nl3main_x1 ) main_x ) ( * ( + 0 Nl3main_c1 ) main_c ) ) 0 ) ))
(assert ( or ( and ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( > ( + ( * Nl3CT1 lam6n1 ) ( - 1 ( - ( + ( + RFN1_CT ( * RFN1_main_x 0 ) ) ( * RFN1_main_c ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * Nl3main_x1 lam6n1 ) ( - ( - ( + 0 ( * RFN1_main_x 1 ) ) RFN1_main_x ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * Nl3main_c1 lam6n1 ) ( - ( - ( + ( + 0 ( * RFN1_main_x ( - 1 ) ) ) ( * RFN1_main_c 1 ) ) RFN1_main_c ) ) ) 0 ) ) ( and ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( > ( + ( * Nl3CT1 lam4n1 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl3main_x1 lam4n1 ) ( - ( - RFN1_main_x ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl3main_c1 lam4n1 ) ( - ( - RFN1_main_c ) ) ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( > ( + ( * Nl3CT1 lam5n1 ) ( - 1 ( + ( - ( + ( + RFN1_CT ( * RFN1_main_x 0 ) ) ( * RFN1_main_c ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl3main_x1 lam5n1 ) ( - ( - ( + 0 ( * RFN1_main_x 1 ) ) RFN1_main_x ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl3main_c1 lam5n1 ) ( - ( - ( + ( + 0 ( * RFN1_main_x ( - 1 ) ) ) ( * RFN1_main_c 1 ) ) RFN1_main_c ) ) ) 0 ) ) ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( > ( + ( * Nl3CT1 lam3n1 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl3main_x1 lam3n1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl3main_c1 lam3n1 ) ) 0 ) ) ))
(check-sat)
(exit)