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
(declare-fun Nl2main_i1 () Int)
(declare-fun Nl2main_j1 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n3 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam4n3 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam5n3 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam6n2 () Int)
(declare-fun lam6n3 () Int)
(declare-fun main_i () Int)
(declare-fun main_j () Int)
(declare-fun undef3 () Int)
(declare-fun undef4 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n3 () Int)
(declare-fun lam10n4 () Int)
(declare-fun lam10n6 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_main_i () Int)
(declare-fun RFN1_main_j () Int)
(declare-fun lam10n5 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n3 () Int)
(declare-fun lam8n4 () Int)
(declare-fun lam8n6 () Int)
(declare-fun lam8n5 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam9n3 () Int)
(declare-fun lam9n4 () Int)
(declare-fun lam9n6 () Int)
(declare-fun lam9n5 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n3 () Int)
(declare-fun lam7n4 () Int)
(declare-fun lam7n6 () Int)
(declare-fun lam7n5 () Int)
(assert ( and ( <= ( - 1 ) Nl2main_i1 ) ( <= Nl2main_i1 1 ) ( <= ( - 1 ) Nl2main_j1 ) ( <= Nl2main_j1 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n3 0 ) ( > ( + ( * 1 lam0n0 ) ( * 1 lam0n1 ) ( * Nl2CT1 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * 1 lam0n2 ) ( * Nl2main_i1 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * 1 lam0n2 ) ( * Nl2main_j1 lam0n3 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n3 0 ) ( > ( + ( * 1 lam1n0 ) ( * 1 lam1n1 ) ( * Nl2CT1 lam1n3 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2main_i1 ( - 1 ) ) ) ( * Nl2main_j1 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * 1 lam1n2 ) ( * Nl2main_i1 lam1n3 ) ( - ( + 0 ( * Nl2main_i1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * ( - 1 ) lam1n1 ) ( * 1 lam1n2 ) ( * Nl2main_j1 lam1n3 ) ( - ( + 0 ( * Nl2main_j1 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( not ( <= ( + ( * ( - 1 ) main_i ) main_j ) 0 ) ) ( not ( <= main_j 0 ) ) ( = ( + main_i main_j ) 0 ) ( = ( + main_i ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_j ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_i1 ) main_i ) ( * ( + 0 Nl2main_j1 ) main_j ) ) 0 ) ( <= ( + ( * ( - 1 ) main_i ) ( * ( - 1 ) main_j ) ) 0 ) ( <= ( + main_i main_j ) 0 ) ) ( and ( not ( <= ( + ( * ( - 1 ) main_i ) ( * ( - 1 ) main_j ) ) 0 ) ) ( not ( <= ( + ( * ( - 1 ) main_i ) main_j ) 0 ) ) ( = ( + main_i ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_j ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_i1 ) main_i ) ( * ( + 0 Nl2main_j1 ) main_j ) ) 0 ) ( <= ( + ( * ( - 1 ) main_i ) ( * ( - 1 ) main_j ) ) 0 ) ( <= ( + main_i main_j ) 0 ) ) ( and ( not ( <= ( + ( * ( - 1 ) main_i ) main_j ) 0 ) ) ( not ( <= ( + main_i main_j ) 0 ) ) ( = ( + main_i ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_j ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_i1 ) main_i ) ( * ( + 0 Nl2main_j1 ) main_j ) ) 0 ) ( <= ( + ( * ( - 1 ) main_i ) ( * ( - 1 ) main_j ) ) 0 ) ( <= ( + main_i main_j ) 0 ) ) ( and ( not ( <= ( + ( * ( - 1 ) main_i ) ( * ( - 1 ) main_j ) ) 0 ) ) ( not ( <= ( + main_i ( * ( - 1 ) main_j ) ) 0 ) ) ( = ( + main_i ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_j ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_i1 ) main_i ) ( * ( + 0 Nl2main_j1 ) main_j ) ) 0 ) ( <= ( + ( * ( - 1 ) main_i ) ( * ( - 1 ) main_j ) ) 0 ) ( <= ( + main_i main_j ) 0 ) ) ( and ( not ( <= ( + main_i ( * ( - 1 ) main_j ) ) 0 ) ) ( not ( <= ( + main_i main_j ) 0 ) ) ( = ( + main_i ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_j ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_i1 ) main_i ) ( * ( + 0 Nl2main_j1 ) main_j ) ) 0 ) ( <= ( + ( * ( - 1 ) main_i ) ( * ( - 1 ) main_j ) ) 0 ) ( <= ( + main_i main_j ) 0 ) ) ))
(assert ( or ( and ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( >= lam10n3 0 ) ( >= lam10n4 0 ) ( >= lam10n6 0 ) ( > ( + ( * 50001 lam10n0 ) ( * 50001 lam10n1 ) ( * 50001 lam10n2 ) ( * 50001 lam10n3 ) ( * 50001 lam10n4 ) ( * Nl2CT1 lam10n6 ) ( - 1 ( - ( + ( + RFN1_CT ( * RFN1_main_i ( - 1 ) ) ) ( * RFN1_main_j 1 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * 1 lam10n1 ) ( * ( - 1 ) lam10n2 ) ( * 2 lam10n3 ) ( * 1 lam10n5 ) ( * Nl2main_i1 lam10n6 ) ( - ( - ( + 0 ( * RFN1_main_i 1 ) ) RFN1_main_i ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n1 ) ( * ( - 2 ) lam10n2 ) ( * 1 lam10n3 ) ( * ( - 1 ) lam10n4 ) ( * 1 lam10n5 ) ( * Nl2main_j1 lam10n6 ) ( - ( - ( + 0 ( * RFN1_main_j 1 ) ) RFN1_main_j ) ) ) 0 ) ) ( and ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( >= lam8n4 0 ) ( >= lam8n6 0 ) ( > ( + ( * 50001 lam8n0 ) ( * 50001 lam8n1 ) ( * 50001 lam8n2 ) ( * 50001 lam8n3 ) ( * 50001 lam8n4 ) ( * Nl2CT1 lam8n6 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * 1 lam8n1 ) ( * ( - 1 ) lam8n2 ) ( * 2 lam8n3 ) ( * 1 lam8n5 ) ( * Nl2main_i1 lam8n6 ) ( - ( - RFN1_main_i ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n1 ) ( * ( - 2 ) lam8n2 ) ( * 1 lam8n3 ) ( * ( - 1 ) lam8n4 ) ( * 1 lam8n5 ) ( * Nl2main_j1 lam8n6 ) ( - ( - RFN1_main_j ) ) ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( >= lam9n3 0 ) ( >= lam9n4 0 ) ( >= lam9n6 0 ) ( > ( + ( * 50001 lam9n0 ) ( * 50001 lam9n1 ) ( * 50001 lam9n2 ) ( * 50001 lam9n3 ) ( * 50001 lam9n4 ) ( * Nl2CT1 lam9n6 ) ( - 1 ( + ( - ( + ( + RFN1_CT ( * RFN1_main_i ( - 1 ) ) ) ( * RFN1_main_j 1 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * 1 lam9n1 ) ( * ( - 1 ) lam9n2 ) ( * 2 lam9n3 ) ( * 1 lam9n5 ) ( * Nl2main_i1 lam9n6 ) ( - ( - ( + 0 ( * RFN1_main_i 1 ) ) RFN1_main_i ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n1 ) ( * ( - 2 ) lam9n2 ) ( * 1 lam9n3 ) ( * ( - 1 ) lam9n4 ) ( * 1 lam9n5 ) ( * Nl2main_j1 lam9n6 ) ( - ( - ( + 0 ( * RFN1_main_j 1 ) ) RFN1_main_j ) ) ) 0 ) ) ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( >= lam7n4 0 ) ( >= lam7n6 0 ) ( > ( + ( * 50001 lam7n0 ) ( * 50001 lam7n1 ) ( * 50001 lam7n2 ) ( * 50001 lam7n3 ) ( * 50001 lam7n4 ) ( * Nl2CT1 lam7n6 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * 1 lam7n1 ) ( * ( - 1 ) lam7n2 ) ( * 2 lam7n3 ) ( * 1 lam7n5 ) ( * Nl2main_i1 lam7n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n1 ) ( * ( - 2 ) lam7n2 ) ( * 1 lam7n3 ) ( * ( - 1 ) lam7n4 ) ( * 1 lam7n5 ) ( * Nl2main_j1 lam7n6 ) ) 0 ) ) ))
(check-sat)
(exit)