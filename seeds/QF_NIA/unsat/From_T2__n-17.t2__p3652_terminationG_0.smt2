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
(declare-fun Nl2x_5^01 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n1 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n1 () Int)
(declare-fun x_5^0 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n1 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_x_5^0 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n2 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam5n1 () Int)
(assert ( and ( <= ( - 1 ) Nl2x_5^01 ) ( <= Nl2x_5^01 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n2 0 ) ( > ( + ( * ( - 1 ) lam0n1 ) ( * Nl2CT1 lam0n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n1 ) ( * Nl2x_5^01 lam0n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n1 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n2 0 ) ( > ( + ( * ( - 1 ) lam1n1 ) ( * Nl2CT1 lam1n2 ) ( - 1 ( + Nl2CT1 ( * Nl2x_5^01 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n1 ) ( * Nl2x_5^01 lam1n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * ( - 1 ) lam1n1 ) ( - ( + 0 ( * Nl2x_5^01 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam2n0 0 ) ( >= lam2n2 0 ) ( > ( + ( * 1 lam2n0 ) ( * ( - 1 ) lam2n1 ) ( * Nl2CT1 lam2n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam2n1 ) ( * Nl2x_5^01 lam2n2 ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * ( - 1 ) lam2n1 ) ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n2 0 ) ( > ( + ( * 1 lam3n0 ) ( * ( - 1 ) lam3n1 ) ( * Nl2CT1 lam3n2 ) ( - 1 ( + Nl2CT1 ( * Nl2x_5^01 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam3n1 ) ( * Nl2x_5^01 lam3n2 ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * ( - 1 ) lam3n1 ) ( - ( + 0 ( * Nl2x_5^01 1 ) ) ) ) 0 ) ) ))
(assert ( <= ( + Nl2CT1 ( * ( + 0 Nl2x_5^01 ) x_5^0 ) ) 0 ))
(assert ( or ( and ( and ( >= lam8n0 0 ) ( >= lam8n2 0 ) ( > ( + ( * 1 lam8n0 ) ( * ( - 1 ) lam8n1 ) ( * Nl2CT1 lam8n2 ) ( - 1 ( - ( + RFN1_CT ( * RFN1_x_5^0 0 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam8n1 ) ( * Nl2x_5^01 lam8n2 ) ( - ( - RFN1_x_5^0 ) ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * ( - 1 ) lam8n1 ) ( - ( + 0 ( * RFN1_x_5^0 1 ) ) ) ) 0 ) ) ( and ( and ( >= lam6n0 0 ) ( >= lam6n2 0 ) ( > ( + ( * 1 lam6n0 ) ( * ( - 1 ) lam6n1 ) ( * Nl2CT1 lam6n2 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam6n1 ) ( * Nl2x_5^01 lam6n2 ) ( - ( - RFN1_x_5^0 ) ) ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * ( - 1 ) lam6n1 ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n2 0 ) ( > ( + ( * 1 lam7n0 ) ( * ( - 1 ) lam7n1 ) ( * Nl2CT1 lam7n2 ) ( - 1 ( + ( - ( + RFN1_CT ( * RFN1_x_5^0 0 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * 1 lam7n1 ) ( * Nl2x_5^01 lam7n2 ) ( - ( - RFN1_x_5^0 ) ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * ( - 1 ) lam7n1 ) ( - ( + 0 ( * RFN1_x_5^0 1 ) ) ) ) 0 ) ) ) ) ( and ( >= lam5n0 0 ) ( >= lam5n2 0 ) ( > ( + ( * 1 lam5n0 ) ( * ( - 1 ) lam5n1 ) ( * Nl2CT1 lam5n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam5n1 ) ( * Nl2x_5^01 lam5n2 ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * ( - 1 ) lam5n1 ) ) 0 ) ) ))
(check-sat)
(exit)