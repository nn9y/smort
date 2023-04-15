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
(declare-fun Nl4__disjvr_0^01 () Int)
(declare-fun Nl4b_7^01 () Int)
(declare-fun Nl4x_5^01 () Int)
(declare-fun Nl4y_6^01 () Int)
(declare-fun Nl4__disjvr_0^02 () Int)
(declare-fun Nl4b_7^02 () Int)
(declare-fun Nl4x_5^02 () Int)
(declare-fun Nl4y_6^02 () Int)
(declare-fun Nl4__disjvr_0^03 () Int)
(declare-fun Nl4b_7^03 () Int)
(declare-fun Nl4x_5^03 () Int)
(declare-fun Nl4y_6^03 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun lam0n6 () Int)
(declare-fun Nl4CT1 () Int)
(declare-fun Nl4CT2 () Int)
(declare-fun Nl4CT3 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam1n6 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam2n6 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n4 () Int)
(declare-fun lam3n5 () Int)
(declare-fun lam3n6 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun b_7^0 () Int)
(declare-fun x_5^0 () Int)
(declare-fun y_6^0 () Int)
(declare-fun __disjvr_0^0 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n4 () Int)
(declare-fun lam10n5 () Int)
(declare-fun lam10n6 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1___disjvr_0^0 () Int)
(declare-fun RFN1_b_7^0 () Int)
(declare-fun RFN1_x_5^0 () Int)
(declare-fun RFN1_y_6^0 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n3 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n4 () Int)
(declare-fun lam8n5 () Int)
(declare-fun lam8n6 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n3 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n4 () Int)
(declare-fun lam9n5 () Int)
(declare-fun lam9n6 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam9n3 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n4 () Int)
(declare-fun lam7n5 () Int)
(declare-fun lam7n6 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n3 () Int)
(assert ( and ( <= ( - 1 ) Nl4__disjvr_0^01 ) ( <= Nl4__disjvr_0^01 1 ) ( <= ( - 1 ) Nl4b_7^01 ) ( <= Nl4b_7^01 1 ) ( <= ( - 1 ) Nl4x_5^01 ) ( <= Nl4x_5^01 1 ) ( <= ( - 1 ) Nl4y_6^01 ) ( <= Nl4y_6^01 1 ) ( <= ( - 1 ) Nl4__disjvr_0^02 ) ( <= Nl4__disjvr_0^02 1 ) ( <= ( - 1 ) Nl4b_7^02 ) ( <= Nl4b_7^02 1 ) ( <= ( - 1 ) Nl4x_5^02 ) ( <= Nl4x_5^02 1 ) ( <= ( - 1 ) Nl4y_6^02 ) ( <= Nl4y_6^02 1 ) ( <= ( - 1 ) Nl4__disjvr_0^03 ) ( <= Nl4__disjvr_0^03 1 ) ( <= ( - 1 ) Nl4b_7^03 ) ( <= Nl4b_7^03 1 ) ( <= ( - 1 ) Nl4x_5^03 ) ( <= Nl4x_5^03 1 ) ( <= ( - 1 ) Nl4y_6^03 ) ( <= Nl4y_6^03 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( > ( + ( * 2 lam0n1 ) ( * Nl4CT1 lam0n4 ) ( * Nl4CT2 lam0n5 ) ( * Nl4CT3 lam0n6 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * Nl4__disjvr_0^01 lam0n4 ) ( * Nl4__disjvr_0^02 lam0n5 ) ( * Nl4__disjvr_0^03 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n3 ) ( * Nl4b_7^01 lam0n4 ) ( * Nl4b_7^02 lam0n5 ) ( * Nl4b_7^03 lam0n6 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * 1 lam0n1 ) ( * Nl4x_5^01 lam0n4 ) ( * Nl4x_5^02 lam0n5 ) ( * Nl4x_5^03 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * Nl4y_6^01 lam0n4 ) ( * Nl4y_6^02 lam0n5 ) ( * Nl4y_6^03 lam0n6 ) ) 0 ) ( = ( * ( - 1 ) lam0n2 ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n4 0 ) ( >= lam1n5 0 ) ( >= lam1n6 0 ) ( > ( + ( * 2 lam1n1 ) ( * Nl4CT1 lam1n4 ) ( * Nl4CT2 lam1n5 ) ( * Nl4CT3 lam1n6 ) ( - 1 ( + ( + ( + ( + Nl4CT1 ( * Nl4__disjvr_0^01 0 ) ) ( * Nl4b_7^01 0 ) ) ( * Nl4x_5^01 1 ) ) ( * Nl4y_6^01 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n2 ) ( * Nl4__disjvr_0^01 lam1n4 ) ( * Nl4__disjvr_0^02 lam1n5 ) ( * Nl4__disjvr_0^03 lam1n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * 1 lam1n3 ) ( * Nl4b_7^01 lam1n4 ) ( * Nl4b_7^02 lam1n5 ) ( * Nl4b_7^03 lam1n6 ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * 1 lam1n1 ) ( * Nl4x_5^01 lam1n4 ) ( * Nl4x_5^02 lam1n5 ) ( * Nl4x_5^03 lam1n6 ) ( - ( + 0 ( * Nl4x_5^01 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * ( - 1 ) lam1n1 ) ( * Nl4y_6^01 lam1n4 ) ( * Nl4y_6^02 lam1n5 ) ( * Nl4y_6^03 lam1n6 ) ( - ( + 0 ( * Nl4y_6^01 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n2 ) ( - ( + 0 ( * Nl4__disjvr_0^01 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( > ( + ( * 2 lam0n1 ) ( * Nl4CT1 lam0n4 ) ( * Nl4CT2 lam0n5 ) ( * Nl4CT3 lam0n6 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * Nl4__disjvr_0^01 lam0n4 ) ( * Nl4__disjvr_0^02 lam0n5 ) ( * Nl4__disjvr_0^03 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n3 ) ( * Nl4b_7^01 lam0n4 ) ( * Nl4b_7^02 lam0n5 ) ( * Nl4b_7^03 lam0n6 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * 1 lam0n1 ) ( * Nl4x_5^01 lam0n4 ) ( * Nl4x_5^02 lam0n5 ) ( * Nl4x_5^03 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * Nl4y_6^01 lam0n4 ) ( * Nl4y_6^02 lam0n5 ) ( * Nl4y_6^03 lam0n6 ) ) 0 ) ( = ( * ( - 1 ) lam0n2 ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n4 0 ) ( >= lam2n5 0 ) ( >= lam2n6 0 ) ( > ( + ( * 2 lam2n1 ) ( * Nl4CT1 lam2n4 ) ( * Nl4CT2 lam2n5 ) ( * Nl4CT3 lam2n6 ) ( - 1 ( + ( + ( + ( + Nl4CT2 ( * Nl4__disjvr_0^02 0 ) ) ( * Nl4b_7^02 0 ) ) ( * Nl4x_5^02 1 ) ) ( * Nl4y_6^02 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam2n2 ) ( * Nl4__disjvr_0^01 lam2n4 ) ( * Nl4__disjvr_0^02 lam2n5 ) ( * Nl4__disjvr_0^03 lam2n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * 1 lam2n3 ) ( * Nl4b_7^01 lam2n4 ) ( * Nl4b_7^02 lam2n5 ) ( * Nl4b_7^03 lam2n6 ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * 1 lam2n1 ) ( * Nl4x_5^01 lam2n4 ) ( * Nl4x_5^02 lam2n5 ) ( * Nl4x_5^03 lam2n6 ) ( - ( + 0 ( * Nl4x_5^02 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * ( - 1 ) lam2n1 ) ( * Nl4y_6^01 lam2n4 ) ( * Nl4y_6^02 lam2n5 ) ( * Nl4y_6^03 lam2n6 ) ( - ( + 0 ( * Nl4y_6^02 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n2 ) ( - ( + 0 ( * Nl4__disjvr_0^02 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( > ( + ( * 2 lam0n1 ) ( * Nl4CT1 lam0n4 ) ( * Nl4CT2 lam0n5 ) ( * Nl4CT3 lam0n6 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * Nl4__disjvr_0^01 lam0n4 ) ( * Nl4__disjvr_0^02 lam0n5 ) ( * Nl4__disjvr_0^03 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n3 ) ( * Nl4b_7^01 lam0n4 ) ( * Nl4b_7^02 lam0n5 ) ( * Nl4b_7^03 lam0n6 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * 1 lam0n1 ) ( * Nl4x_5^01 lam0n4 ) ( * Nl4x_5^02 lam0n5 ) ( * Nl4x_5^03 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * Nl4y_6^01 lam0n4 ) ( * Nl4y_6^02 lam0n5 ) ( * Nl4y_6^03 lam0n6 ) ) 0 ) ( = ( * ( - 1 ) lam0n2 ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n4 0 ) ( >= lam3n5 0 ) ( >= lam3n6 0 ) ( > ( + ( * 2 lam3n1 ) ( * Nl4CT1 lam3n4 ) ( * Nl4CT2 lam3n5 ) ( * Nl4CT3 lam3n6 ) ( - 1 ( + ( + ( + ( + Nl4CT3 ( * Nl4__disjvr_0^03 0 ) ) ( * Nl4b_7^03 0 ) ) ( * Nl4x_5^03 1 ) ) ( * Nl4y_6^03 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam3n2 ) ( * Nl4__disjvr_0^01 lam3n4 ) ( * Nl4__disjvr_0^02 lam3n5 ) ( * Nl4__disjvr_0^03 lam3n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * 1 lam3n3 ) ( * Nl4b_7^01 lam3n4 ) ( * Nl4b_7^02 lam3n5 ) ( * Nl4b_7^03 lam3n6 ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * 1 lam3n1 ) ( * Nl4x_5^01 lam3n4 ) ( * Nl4x_5^02 lam3n5 ) ( * Nl4x_5^03 lam3n6 ) ( - ( + 0 ( * Nl4x_5^03 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * ( - 1 ) lam3n1 ) ( * Nl4y_6^01 lam3n4 ) ( * Nl4y_6^02 lam3n5 ) ( * Nl4y_6^03 lam3n6 ) ( - ( + 0 ( * Nl4y_6^03 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n2 ) ( - ( + 0 ( * Nl4__disjvr_0^03 1 ) ) ) ) 0 ) ) ))
(assert ( and ( not ( <= ( + 1 b_7^0 ( * ( - 1 ) x_5^0 ) y_6^0 ) 0 ) ) ( = b_7^0 0 ) ( <= ( + Nl4CT1 ( * ( + 0 Nl4__disjvr_0^01 ) __disjvr_0^0 ) ( * ( + 0 Nl4b_7^01 ) b_7^0 ) ( * ( + 0 Nl4x_5^01 ) x_5^0 ) ( * ( + 0 Nl4y_6^01 ) y_6^0 ) ) 0 ) ( <= ( + Nl4CT2 ( * ( + 0 Nl4__disjvr_0^02 ) __disjvr_0^0 ) ( * ( + 0 Nl4b_7^02 ) b_7^0 ) ( * ( + 0 Nl4x_5^02 ) x_5^0 ) ( * ( + 0 Nl4y_6^02 ) y_6^0 ) ) 0 ) ( <= ( + Nl4CT3 ( * ( + 0 Nl4__disjvr_0^03 ) __disjvr_0^0 ) ( * ( + 0 Nl4b_7^03 ) b_7^0 ) ( * ( + 0 Nl4x_5^03 ) x_5^0 ) ( * ( + 0 Nl4y_6^03 ) y_6^0 ) ) 0 ) ))
(assert ( or ( and ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n4 0 ) ( >= lam10n5 0 ) ( >= lam10n6 0 ) ( > ( + ( * 2 lam10n1 ) ( * Nl4CT1 lam10n4 ) ( * Nl4CT2 lam10n5 ) ( * Nl4CT3 lam10n6 ) ( - 1 ( - ( + ( + ( + ( + RFN1_CT ( * RFN1___disjvr_0^0 0 ) ) ( * RFN1_b_7^0 0 ) ) ( * RFN1_x_5^0 1 ) ) ( * RFN1_y_6^0 1 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam10n2 ) ( * Nl4__disjvr_0^01 lam10n4 ) ( * Nl4__disjvr_0^02 lam10n5 ) ( * Nl4__disjvr_0^03 lam10n6 ) ( - ( - RFN1___disjvr_0^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n0 ) ( * 1 lam10n3 ) ( * Nl4b_7^01 lam10n4 ) ( * Nl4b_7^02 lam10n5 ) ( * Nl4b_7^03 lam10n6 ) ( - ( - RFN1_b_7^0 ) ) ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * 1 lam10n1 ) ( * Nl4x_5^01 lam10n4 ) ( * Nl4x_5^02 lam10n5 ) ( * Nl4x_5^03 lam10n6 ) ( - ( - ( + 0 ( * RFN1_x_5^0 1 ) ) RFN1_x_5^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n0 ) ( * ( - 1 ) lam10n1 ) ( * Nl4y_6^01 lam10n4 ) ( * Nl4y_6^02 lam10n5 ) ( * Nl4y_6^03 lam10n6 ) ( - ( - ( + 0 ( * RFN1_y_6^0 1 ) ) RFN1_y_6^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n2 ) ( - ( + 0 ( * RFN1___disjvr_0^0 1 ) ) ) ) 0 ) ) ( and ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n4 0 ) ( >= lam8n5 0 ) ( >= lam8n6 0 ) ( > ( + ( * 2 lam8n1 ) ( * Nl4CT1 lam8n4 ) ( * Nl4CT2 lam8n5 ) ( * Nl4CT3 lam8n6 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam8n2 ) ( * Nl4__disjvr_0^01 lam8n4 ) ( * Nl4__disjvr_0^02 lam8n5 ) ( * Nl4__disjvr_0^03 lam8n6 ) ( - ( - RFN1___disjvr_0^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * 1 lam8n3 ) ( * Nl4b_7^01 lam8n4 ) ( * Nl4b_7^02 lam8n5 ) ( * Nl4b_7^03 lam8n6 ) ( - ( - RFN1_b_7^0 ) ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * 1 lam8n1 ) ( * Nl4x_5^01 lam8n4 ) ( * Nl4x_5^02 lam8n5 ) ( * Nl4x_5^03 lam8n6 ) ( - ( - RFN1_x_5^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * ( - 1 ) lam8n1 ) ( * Nl4y_6^01 lam8n4 ) ( * Nl4y_6^02 lam8n5 ) ( * Nl4y_6^03 lam8n6 ) ( - ( - RFN1_y_6^0 ) ) ) 0 ) ( = ( * ( - 1 ) lam8n2 ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n4 0 ) ( >= lam9n5 0 ) ( >= lam9n6 0 ) ( > ( + ( * 2 lam9n1 ) ( * Nl4CT1 lam9n4 ) ( * Nl4CT2 lam9n5 ) ( * Nl4CT3 lam9n6 ) ( - 1 ( + ( - ( + ( + ( + ( + RFN1_CT ( * RFN1___disjvr_0^0 0 ) ) ( * RFN1_b_7^0 0 ) ) ( * RFN1_x_5^0 1 ) ) ( * RFN1_y_6^0 1 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * 1 lam9n2 ) ( * Nl4__disjvr_0^01 lam9n4 ) ( * Nl4__disjvr_0^02 lam9n5 ) ( * Nl4__disjvr_0^03 lam9n6 ) ( - ( - RFN1___disjvr_0^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * 1 lam9n3 ) ( * Nl4b_7^01 lam9n4 ) ( * Nl4b_7^02 lam9n5 ) ( * Nl4b_7^03 lam9n6 ) ( - ( - RFN1_b_7^0 ) ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * 1 lam9n1 ) ( * Nl4x_5^01 lam9n4 ) ( * Nl4x_5^02 lam9n5 ) ( * Nl4x_5^03 lam9n6 ) ( - ( - ( + 0 ( * RFN1_x_5^0 1 ) ) RFN1_x_5^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * ( - 1 ) lam9n1 ) ( * Nl4y_6^01 lam9n4 ) ( * Nl4y_6^02 lam9n5 ) ( * Nl4y_6^03 lam9n6 ) ( - ( - ( + 0 ( * RFN1_y_6^0 1 ) ) RFN1_y_6^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n2 ) ( - ( + 0 ( * RFN1___disjvr_0^0 1 ) ) ) ) 0 ) ) ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n4 0 ) ( >= lam7n5 0 ) ( >= lam7n6 0 ) ( > ( + ( * 2 lam7n1 ) ( * Nl4CT1 lam7n4 ) ( * Nl4CT2 lam7n5 ) ( * Nl4CT3 lam7n6 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam7n2 ) ( * Nl4__disjvr_0^01 lam7n4 ) ( * Nl4__disjvr_0^02 lam7n5 ) ( * Nl4__disjvr_0^03 lam7n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * 1 lam7n3 ) ( * Nl4b_7^01 lam7n4 ) ( * Nl4b_7^02 lam7n5 ) ( * Nl4b_7^03 lam7n6 ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * 1 lam7n1 ) ( * Nl4x_5^01 lam7n4 ) ( * Nl4x_5^02 lam7n5 ) ( * Nl4x_5^03 lam7n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * ( - 1 ) lam7n1 ) ( * Nl4y_6^01 lam7n4 ) ( * Nl4y_6^02 lam7n5 ) ( * Nl4y_6^03 lam7n6 ) ) 0 ) ( = ( * ( - 1 ) lam7n2 ) 0 ) ) ))
(check-sat)
(exit)