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
(declare-fun Nl2main_c1 () Int)
(declare-fun Nl2main_a2 () Int)
(declare-fun Nl2main_b2 () Int)
(declare-fun Nl2main_c2 () Int)
(declare-fun Nl2main_a3 () Int)
(declare-fun Nl2main_b3 () Int)
(declare-fun Nl2main_c3 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun lam0n6 () Int)
(declare-fun lam0n7 () Int)
(declare-fun UndefCntr0_CT () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun Nl2CT2 () Int)
(declare-fun Nl2CT3 () Int)
(declare-fun lam0n3 () Int)
(declare-fun UndefCntr0_main_a () Int)
(declare-fun UndefCntr0_main_b () Int)
(declare-fun UndefCntr0_main_c () Int)
(declare-fun UndefCntr0_undef8 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam1n6 () Int)
(declare-fun lam1n7 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam2n6 () Int)
(declare-fun lam2n7 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n4 () Int)
(declare-fun lam3n5 () Int)
(declare-fun lam3n6 () Int)
(declare-fun lam3n7 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam6n2 () Int)
(declare-fun main_a () Int)
(declare-fun undef5 () Int)
(declare-fun main_b () Int)
(declare-fun undef6 () Int)
(declare-fun main_c () Int)
(declare-fun undef7 () Int)
(declare-fun FV_main_a_1 () Int)
(declare-fun FV_main_b_1 () Int)
(declare-fun FV_main_c_1 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n3 () Int)
(declare-fun lam7n4 () Int)
(declare-fun lam7n5 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n3 () Int)
(declare-fun lam8n4 () Int)
(declare-fun lam8n5 () Int)
(declare-fun UndefDef0undef8_CT () Int)
(declare-fun lam8n2 () Int)
(declare-fun UndefDef0undef8_main_a () Int)
(declare-fun UndefDef0undef8_main_b () Int)
(declare-fun UndefDef0undef8_main_c () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n3 () Int)
(declare-fun lam9n4 () Int)
(declare-fun lam9n5 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n3 () Int)
(declare-fun lam10n4 () Int)
(declare-fun lam10n5 () Int)
(declare-fun FV_main_a_2 () Int)
(declare-fun FV_main_b_2 () Int)
(declare-fun FV_main_c_2 () Int)
(declare-fun FV_undef8_2 () Int)
(assert ( and ( <= ( - 10 ) Nl2main_a1 ) ( <= Nl2main_a1 10 ) ( <= ( - 10 ) Nl2main_b1 ) ( <= Nl2main_b1 10 ) ( <= ( - 10 ) Nl2main_c1 ) ( <= Nl2main_c1 10 ) ( <= ( - 10 ) Nl2main_a2 ) ( <= Nl2main_a2 10 ) ( <= ( - 10 ) Nl2main_b2 ) ( <= Nl2main_b2 10 ) ( <= ( - 10 ) Nl2main_c2 ) ( <= Nl2main_c2 10 ) ( <= ( - 10 ) Nl2main_a3 ) ( <= Nl2main_a3 10 ) ( <= ( - 10 ) Nl2main_b3 ) ( <= Nl2main_b3 10 ) ( <= ( - 10 ) Nl2main_c3 ) ( <= Nl2main_c3 10 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( >= lam0n7 0 ) ( > ( + ( * 1 lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_CT lam0n4 ) ( * Nl2CT1 lam0n5 ) ( * Nl2CT2 lam0n6 ) ( * Nl2CT3 lam0n7 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n1 ) ( * 1 lam0n3 ) ( * UndefCntr0_main_a lam0n4 ) ( * Nl2main_a1 lam0n5 ) ( * Nl2main_a2 lam0n6 ) ( * Nl2main_a3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_main_b lam0n4 ) ( * Nl2main_b1 lam0n5 ) ( * Nl2main_b2 lam0n6 ) ( * Nl2main_b3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_main_c lam0n4 ) ( * Nl2main_c1 lam0n5 ) ( * Nl2main_c2 lam0n6 ) ( * Nl2main_c3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * UndefCntr0_undef8 lam0n4 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n4 0 ) ( >= lam1n5 0 ) ( >= lam1n6 0 ) ( >= lam1n7 0 ) ( > ( + ( * 1 lam1n1 ) ( * 1 lam1n2 ) ( * UndefCntr0_CT lam1n4 ) ( * Nl2CT1 lam1n5 ) ( * Nl2CT2 lam1n6 ) ( * Nl2CT3 lam1n7 ) ( - 1 ( + ( + ( + Nl2CT1 ( * Nl2main_a1 1 ) ) ( * Nl2main_b1 10 ) ) ( * Nl2main_c1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * 1 lam1n1 ) ( * 1 lam1n3 ) ( * UndefCntr0_main_a lam1n4 ) ( * Nl2main_a1 lam1n5 ) ( * Nl2main_a2 lam1n6 ) ( * Nl2main_a3 lam1n7 ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * ( - 1 ) lam1n1 ) ( * ( - 1 ) lam1n2 ) ( * UndefCntr0_main_b lam1n4 ) ( * Nl2main_b1 lam1n5 ) ( * Nl2main_b2 lam1n6 ) ( * Nl2main_b3 lam1n7 ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * 1 lam1n2 ) ( * ( - 1 ) lam1n3 ) ( * UndefCntr0_main_c lam1n4 ) ( * Nl2main_c1 lam1n5 ) ( * Nl2main_c2 lam1n6 ) ( * Nl2main_c3 lam1n7 ) ( - ( + ( + 0 ( * Nl2main_a1 1 ) ) ( * Nl2main_c1 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * UndefCntr0_undef8 lam1n4 ) ( - ( + ( + 0 ( * Nl2main_a1 1 ) ) ( * Nl2main_c1 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( >= lam0n7 0 ) ( > ( + ( * 1 lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_CT lam0n4 ) ( * Nl2CT1 lam0n5 ) ( * Nl2CT2 lam0n6 ) ( * Nl2CT3 lam0n7 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n1 ) ( * 1 lam0n3 ) ( * UndefCntr0_main_a lam0n4 ) ( * Nl2main_a1 lam0n5 ) ( * Nl2main_a2 lam0n6 ) ( * Nl2main_a3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_main_b lam0n4 ) ( * Nl2main_b1 lam0n5 ) ( * Nl2main_b2 lam0n6 ) ( * Nl2main_b3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_main_c lam0n4 ) ( * Nl2main_c1 lam0n5 ) ( * Nl2main_c2 lam0n6 ) ( * Nl2main_c3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * UndefCntr0_undef8 lam0n4 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n4 0 ) ( >= lam2n5 0 ) ( >= lam2n6 0 ) ( >= lam2n7 0 ) ( > ( + ( * 1 lam2n1 ) ( * 1 lam2n2 ) ( * UndefCntr0_CT lam2n4 ) ( * Nl2CT1 lam2n5 ) ( * Nl2CT2 lam2n6 ) ( * Nl2CT3 lam2n7 ) ( - 1 ( + ( + ( + Nl2CT2 ( * Nl2main_a2 1 ) ) ( * Nl2main_b2 10 ) ) ( * Nl2main_c2 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * 1 lam2n1 ) ( * 1 lam2n3 ) ( * UndefCntr0_main_a lam2n4 ) ( * Nl2main_a1 lam2n5 ) ( * Nl2main_a2 lam2n6 ) ( * Nl2main_a3 lam2n7 ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * ( - 1 ) lam2n1 ) ( * ( - 1 ) lam2n2 ) ( * UndefCntr0_main_b lam2n4 ) ( * Nl2main_b1 lam2n5 ) ( * Nl2main_b2 lam2n6 ) ( * Nl2main_b3 lam2n7 ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * 1 lam2n2 ) ( * ( - 1 ) lam2n3 ) ( * UndefCntr0_main_c lam2n4 ) ( * Nl2main_c1 lam2n5 ) ( * Nl2main_c2 lam2n6 ) ( * Nl2main_c3 lam2n7 ) ( - ( + ( + 0 ( * Nl2main_a2 1 ) ) ( * Nl2main_c2 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * UndefCntr0_undef8 lam2n4 ) ( - ( + ( + 0 ( * Nl2main_a2 1 ) ) ( * Nl2main_c2 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( >= lam0n7 0 ) ( > ( + ( * 1 lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_CT lam0n4 ) ( * Nl2CT1 lam0n5 ) ( * Nl2CT2 lam0n6 ) ( * Nl2CT3 lam0n7 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n1 ) ( * 1 lam0n3 ) ( * UndefCntr0_main_a lam0n4 ) ( * Nl2main_a1 lam0n5 ) ( * Nl2main_a2 lam0n6 ) ( * Nl2main_a3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_main_b lam0n4 ) ( * Nl2main_b1 lam0n5 ) ( * Nl2main_b2 lam0n6 ) ( * Nl2main_b3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_main_c lam0n4 ) ( * Nl2main_c1 lam0n5 ) ( * Nl2main_c2 lam0n6 ) ( * Nl2main_c3 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * UndefCntr0_undef8 lam0n4 ) ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n4 0 ) ( >= lam3n5 0 ) ( >= lam3n6 0 ) ( >= lam3n7 0 ) ( > ( + ( * 1 lam3n1 ) ( * 1 lam3n2 ) ( * UndefCntr0_CT lam3n4 ) ( * Nl2CT1 lam3n5 ) ( * Nl2CT2 lam3n6 ) ( * Nl2CT3 lam3n7 ) ( - 1 ( + ( + ( + Nl2CT3 ( * Nl2main_a3 1 ) ) ( * Nl2main_b3 10 ) ) ( * Nl2main_c3 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * 1 lam3n1 ) ( * 1 lam3n3 ) ( * UndefCntr0_main_a lam3n4 ) ( * Nl2main_a1 lam3n5 ) ( * Nl2main_a2 lam3n6 ) ( * Nl2main_a3 lam3n7 ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * ( - 1 ) lam3n1 ) ( * ( - 1 ) lam3n2 ) ( * UndefCntr0_main_b lam3n4 ) ( * Nl2main_b1 lam3n5 ) ( * Nl2main_b2 lam3n6 ) ( * Nl2main_b3 lam3n7 ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * 1 lam3n2 ) ( * ( - 1 ) lam3n3 ) ( * UndefCntr0_main_c lam3n4 ) ( * Nl2main_c1 lam3n5 ) ( * Nl2main_c2 lam3n6 ) ( * Nl2main_c3 lam3n7 ) ( - ( + ( + 0 ( * Nl2main_a3 1 ) ) ( * Nl2main_c3 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * UndefCntr0_undef8 lam3n4 ) ( - ( + ( + 0 ( * Nl2main_a3 1 ) ) ( * Nl2main_c3 1 ) ) ) ) 0 ) ) ))
(assert ( and ( <= ( + Nl2CT1 ( * Nl2main_a1 FV_main_a_1 ) ( * Nl2main_b1 FV_main_b_1 ) ( * Nl2main_c1 FV_main_c_1 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2main_a2 FV_main_a_1 ) ( * Nl2main_b2 FV_main_b_1 ) ( * Nl2main_c2 FV_main_c_1 ) ) 0 ) ( <= ( + Nl2CT3 ( * Nl2main_a3 FV_main_a_1 ) ( * Nl2main_b3 FV_main_b_1 ) ( * Nl2main_c3 FV_main_c_1 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) FV_main_b_1 ) FV_main_c_1 ) 0 ) ( <= ( + FV_main_a_1 ( * ( - 1 ) FV_main_c_1 ) ) 0 ) ))
(assert ( or ( not ( = UndefCntr0_main_a 0 ) ) ( not ( = UndefCntr0_main_b 0 ) ) ( not ( = UndefCntr0_main_c 0 ) ) ( not ( = UndefCntr0_undef8 0 ) ) ( = UndefCntr0_CT 0 ) ))
(assert ( or ( and ( = UndefCntr0_main_a 0 ) ( = UndefCntr0_main_b 0 ) ( = UndefCntr0_main_c 0 ) ) ( not ( = UndefCntr0_undef8 0 ) ) ))
(assert ( or ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n3 0 ) ( >= lam7n4 0 ) ( >= lam7n5 0 ) ( > ( + ( * 1 lam7n0 ) ( * 1 lam7n1 ) ( * Nl2CT1 lam7n3 ) ( * Nl2CT2 lam7n4 ) ( * Nl2CT3 lam7n5 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * 1 lam7n2 ) ( * Nl2main_a1 lam7n3 ) ( * Nl2main_a2 lam7n4 ) ( * Nl2main_a3 lam7n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * ( - 1 ) lam7n1 ) ( * Nl2main_b1 lam7n3 ) ( * Nl2main_b2 lam7n4 ) ( * Nl2main_b3 lam7n5 ) ) 0 ) ( = ( + ( * 1 lam7n1 ) ( * ( - 1 ) lam7n2 ) ( * Nl2main_c1 lam7n3 ) ( * Nl2main_c2 lam7n4 ) ( * Nl2main_c3 lam7n5 ) ) 0 ) ) ( and ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n3 0 ) ( >= lam8n4 0 ) ( >= lam8n5 0 ) ( > ( + ( * 1 lam8n0 ) ( * 1 lam8n1 ) ( * Nl2CT1 lam8n3 ) ( * Nl2CT2 lam8n4 ) ( * Nl2CT3 lam8n5 ) ( - 1 ( + ( + ( + ( + 0 0 ) 0 ) 0 ) ( * 1 UndefDef0undef8_CT ) ) ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * 1 lam8n2 ) ( * Nl2main_a1 lam8n3 ) ( * Nl2main_a2 lam8n4 ) ( * Nl2main_a3 lam8n5 ) ( - ( + ( - 1 ) ( * UndefDef0undef8_main_a 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * ( - 1 ) lam8n1 ) ( * Nl2main_b1 lam8n3 ) ( * Nl2main_b2 lam8n4 ) ( * Nl2main_b3 lam8n5 ) ( - ( + 1 ( * UndefDef0undef8_main_b 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam8n1 ) ( * ( - 1 ) lam8n2 ) ( * Nl2main_c1 lam8n3 ) ( * Nl2main_c2 lam8n4 ) ( * Nl2main_c3 lam8n5 ) ( - ( + 1 ( * UndefDef0undef8_main_c 1 ) ) ) ) 0 ) ) ( or ( = UndefCntr0_undef8 0 ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n3 0 ) ( >= lam9n4 0 ) ( >= lam9n5 0 ) ( > ( + ( * 1 lam9n0 ) ( * 1 lam9n1 ) ( * Nl2CT1 lam9n3 ) ( * Nl2CT2 lam9n4 ) ( * Nl2CT3 lam9n5 ) ( - 1 ( + ( + ( + ( + UndefCntr0_CT 0 ) 0 ) 0 ) ( * UndefCntr0_undef8 UndefDef0undef8_CT ) ) ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * 1 lam9n2 ) ( * Nl2main_a1 lam9n3 ) ( * Nl2main_a2 lam9n4 ) ( * Nl2main_a3 lam9n5 ) ( - ( + UndefCntr0_main_a ( * UndefDef0undef8_main_a UndefCntr0_undef8 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * ( - 1 ) lam9n1 ) ( * Nl2main_b1 lam9n3 ) ( * Nl2main_b2 lam9n4 ) ( * Nl2main_b3 lam9n5 ) ( - ( + UndefCntr0_main_b ( * UndefDef0undef8_main_b UndefCntr0_undef8 ) ) ) ) 0 ) ( = ( + ( * 1 lam9n1 ) ( * ( - 1 ) lam9n2 ) ( * Nl2main_c1 lam9n3 ) ( * Nl2main_c2 lam9n4 ) ( * Nl2main_c3 lam9n5 ) ( - ( + UndefCntr0_main_c ( * UndefDef0undef8_main_c UndefCntr0_undef8 ) ) ) ) 0 ) ) ) ) ))
(assert ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( >= lam10n3 0 ) ( >= lam10n4 0 ) ( >= lam10n5 0 ) ( > ( + ( * 1 lam10n0 ) ( * 1 lam10n1 ) ( * 1 lam10n2 ) ( * Nl2CT1 lam10n3 ) ( * Nl2CT2 lam10n4 ) ( * Nl2CT3 lam10n5 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * 1 lam10n1 ) ( * Nl2main_a1 lam10n3 ) ( * Nl2main_a2 lam10n4 ) ( * Nl2main_a3 lam10n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n0 ) ( * ( - 1 ) lam10n2 ) ( * Nl2main_b1 lam10n3 ) ( * Nl2main_b2 lam10n4 ) ( * Nl2main_b3 lam10n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n1 ) ( * 1 lam10n2 ) ( * Nl2main_c1 lam10n3 ) ( * Nl2main_c2 lam10n4 ) ( * Nl2main_c3 lam10n5 ) ) 0 ) ))
(assert ( and ( and ( <= ( + Nl2CT1 ( * Nl2main_a1 FV_main_a_2 ) ( * Nl2main_b1 FV_main_b_2 ) ( * Nl2main_c1 FV_main_c_2 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2main_a2 FV_main_a_2 ) ( * Nl2main_b2 FV_main_b_2 ) ( * Nl2main_c2 FV_main_c_2 ) ) 0 ) ( <= ( + Nl2CT3 ( * Nl2main_a3 FV_main_a_2 ) ( * Nl2main_b3 FV_main_b_2 ) ( * Nl2main_c3 FV_main_c_2 ) ) 0 ) ) ( and ( <= ( + ( * ( - 1 ) FV_main_a_2 ) FV_main_b_2 FV_main_c_2 FV_undef8_2 ) 0 ) ( <= ( + 1 FV_main_a_2 ( * ( - 1 ) FV_main_b_2 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) FV_main_b_2 ) FV_main_c_2 ) 0 ) ( = ( + FV_main_a_2 ( * ( - 1 ) FV_main_c_2 ) ) 0 ) ) ))
(check-sat)
(exit)