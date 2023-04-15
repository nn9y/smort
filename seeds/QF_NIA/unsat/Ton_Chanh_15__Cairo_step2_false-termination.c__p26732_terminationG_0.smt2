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
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun Nl3CT1 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun undef2 () Int)
(declare-fun main_x () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_main_x () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(assert ( and ( <= ( - 2 ) Nl3main_x1 ) ( <= Nl3main_x1 2 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( > ( + ( * 1 lam0n0 ) ( * Nl3CT1 lam0n1 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl3main_x1 lam0n1 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( > ( + ( * 1 lam1n0 ) ( * Nl3CT1 lam1n1 ) ( - 1 ( + Nl3CT1 ( * Nl3main_x1 ( - 2 ) ) ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * Nl3main_x1 lam1n1 ) ( - ( + 0 ( * Nl3main_x1 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( > ( + ( * 1 lam2n0 ) ( * Nl3CT1 lam2n1 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * Nl3main_x1 lam2n1 ) ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( > ( + ( * 1 lam3n0 ) ( * Nl3CT1 lam3n1 ) ( - 1 ( + Nl3CT1 ( * Nl3main_x1 ( - 2 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl3main_x1 lam3n1 ) ( - ( + 0 ( * Nl3main_x1 1 ) ) ) ) 0 ) ) ))
(assert ( and ( <= ( + 1 ( * ( - 1 ) undef2 ) ) 0 ) ( = ( + main_x ( * ( - 1 ) undef2 ) ) 0 ) ( <= ( + Nl3CT1 ( * ( + 0 Nl3main_x1 ) main_x ) ) 0 ) ))
(assert ( or ( and ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( > ( + ( * 50001 lam8n0 ) ( * Nl3CT1 lam8n1 ) ( - 1 ( - ( + RFN1_CT ( * RFN1_main_x ( - 2 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl3main_x1 lam8n1 ) ( - ( - ( + 0 ( * RFN1_main_x 1 ) ) RFN1_main_x ) ) ) 0 ) ) ( and ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( > ( + ( * 50001 lam6n0 ) ( * Nl3CT1 lam6n1 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * Nl3main_x1 lam6n1 ) ( - ( - RFN1_main_x ) ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( > ( + ( * 50001 lam7n0 ) ( * Nl3CT1 lam7n1 ) ( - 1 ( + ( - ( + RFN1_CT ( * RFN1_main_x ( - 2 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * Nl3main_x1 lam7n1 ) ( - ( - ( + 0 ( * RFN1_main_x 1 ) ) RFN1_main_x ) ) ) 0 ) ) ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( > ( + ( * 50001 lam5n0 ) ( * Nl3CT1 lam5n1 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * Nl3main_x1 lam5n1 ) ) 0 ) ) ))
(check-sat)
(exit)