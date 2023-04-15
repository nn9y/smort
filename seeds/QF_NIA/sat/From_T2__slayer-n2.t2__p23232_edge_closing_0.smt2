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
(declare-fun Nl2i_13^01 () Int)
(declare-fun Nl2i_13^02 () Int)
(declare-fun Nl2i_13^03 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun lam0n6 () Int)
(declare-fun lam0n7 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun UndefCntr0_CT () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun Nl2CT2 () Int)
(declare-fun Nl2CT3 () Int)
(declare-fun UndefCntr0_i_13^0 () Int)
(declare-fun UndefCntr0_undef18 () Int)
(declare-fun UndefCntr0_undef19 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam1n6 () Int)
(declare-fun lam1n7 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam2n6 () Int)
(declare-fun lam2n7 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n4 () Int)
(declare-fun lam3n5 () Int)
(declare-fun lam3n6 () Int)
(declare-fun lam3n7 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun i_13^0 () Int)
(declare-fun undef2 () Int)
(declare-fun FV_i_13^0_1 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n3 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n3 () Int)
(declare-fun UndefDef0undef19_CT () Int)
(declare-fun UndefDef0undef19_i_13^0 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam9n3 () Int)
(declare-fun UndefDef0undef18_CT () Int)
(declare-fun UndefDef0undef18_i_13^0 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n3 () Int)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam11n2 () Int)
(declare-fun lam11n3 () Int)
(declare-fun lam12n0 () Int)
(declare-fun lam12n1 () Int)
(declare-fun lam12n2 () Int)
(declare-fun lam12n3 () Int)
(declare-fun lam13n0 () Int)
(declare-fun lam13n1 () Int)
(declare-fun lam13n2 () Int)
(declare-fun lam13n3 () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam14n1 () Int)
(declare-fun lam14n2 () Int)
(declare-fun lam14n3 () Int)
(declare-fun FV_i_13^0_2 () Int)
(declare-fun FV_undef19_2 () Int)
(declare-fun FV_undef18_2 () Int)
(assert ( and ( <= ( - 1 ) Nl2i_13^01 ) ( <= Nl2i_13^01 1 ) ( <= ( - 1 ) Nl2i_13^02 ) ( <= Nl2i_13^02 1 ) ( <= ( - 1 ) Nl2i_13^03 ) ( <= Nl2i_13^03 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( >= lam0n7 0 ) ( > ( + ( * ( - 9 ) lam0n0 ) ( * 50001 lam0n1 ) ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_CT lam0n4 ) ( * Nl2CT1 lam0n5 ) ( * Nl2CT2 lam0n6 ) ( * Nl2CT3 lam0n7 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n1 ) ( * 1 lam0n3 ) ( * UndefCntr0_i_13^0 lam0n4 ) ( * Nl2i_13^01 lam0n5 ) ( * Nl2i_13^02 lam0n6 ) ( * Nl2i_13^03 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_undef18 lam0n4 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_undef19 lam0n4 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n4 0 ) ( >= lam1n5 0 ) ( >= lam1n6 0 ) ( >= lam1n7 0 ) ( > ( + ( * ( - 9 ) lam1n0 ) ( * 50001 lam1n1 ) ( * 1 lam1n2 ) ( * ( - 1 ) lam1n3 ) ( * UndefCntr0_CT lam1n4 ) ( * Nl2CT1 lam1n5 ) ( * Nl2CT2 lam1n6 ) ( * Nl2CT3 lam1n7 ) ( - 1 ( + Nl2CT1 ( * Nl2i_13^01 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n1 ) ( * 1 lam1n3 ) ( * UndefCntr0_i_13^0 lam1n4 ) ( * Nl2i_13^01 lam1n5 ) ( * Nl2i_13^02 lam1n6 ) ( * Nl2i_13^03 lam1n7 ) ) 0 ) ( = ( + ( * 1 lam1n2 ) ( * ( - 1 ) lam1n3 ) ( * UndefCntr0_undef18 lam1n4 ) ( - ( + 0 ( * Nl2i_13^01 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * ( - 1 ) lam1n2 ) ( * UndefCntr0_undef19 lam1n4 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( >= lam0n7 0 ) ( > ( + ( * ( - 9 ) lam0n0 ) ( * 50001 lam0n1 ) ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_CT lam0n4 ) ( * Nl2CT1 lam0n5 ) ( * Nl2CT2 lam0n6 ) ( * Nl2CT3 lam0n7 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n1 ) ( * 1 lam0n3 ) ( * UndefCntr0_i_13^0 lam0n4 ) ( * Nl2i_13^01 lam0n5 ) ( * Nl2i_13^02 lam0n6 ) ( * Nl2i_13^03 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_undef18 lam0n4 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_undef19 lam0n4 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n4 0 ) ( >= lam2n5 0 ) ( >= lam2n6 0 ) ( >= lam2n7 0 ) ( > ( + ( * ( - 9 ) lam2n0 ) ( * 50001 lam2n1 ) ( * 1 lam2n2 ) ( * ( - 1 ) lam2n3 ) ( * UndefCntr0_CT lam2n4 ) ( * Nl2CT1 lam2n5 ) ( * Nl2CT2 lam2n6 ) ( * Nl2CT3 lam2n7 ) ( - 1 ( + Nl2CT2 ( * Nl2i_13^02 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam2n1 ) ( * 1 lam2n3 ) ( * UndefCntr0_i_13^0 lam2n4 ) ( * Nl2i_13^01 lam2n5 ) ( * Nl2i_13^02 lam2n6 ) ( * Nl2i_13^03 lam2n7 ) ) 0 ) ( = ( + ( * 1 lam2n2 ) ( * ( - 1 ) lam2n3 ) ( * UndefCntr0_undef18 lam2n4 ) ( - ( + 0 ( * Nl2i_13^02 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * ( - 1 ) lam2n2 ) ( * UndefCntr0_undef19 lam2n4 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( >= lam0n7 0 ) ( > ( + ( * ( - 9 ) lam0n0 ) ( * 50001 lam0n1 ) ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_CT lam0n4 ) ( * Nl2CT1 lam0n5 ) ( * Nl2CT2 lam0n6 ) ( * Nl2CT3 lam0n7 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n1 ) ( * 1 lam0n3 ) ( * UndefCntr0_i_13^0 lam0n4 ) ( * Nl2i_13^01 lam0n5 ) ( * Nl2i_13^02 lam0n6 ) ( * Nl2i_13^03 lam0n7 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * ( - 1 ) lam0n3 ) ( * UndefCntr0_undef18 lam0n4 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_undef19 lam0n4 ) ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n4 0 ) ( >= lam3n5 0 ) ( >= lam3n6 0 ) ( >= lam3n7 0 ) ( > ( + ( * ( - 9 ) lam3n0 ) ( * 50001 lam3n1 ) ( * 1 lam3n2 ) ( * ( - 1 ) lam3n3 ) ( * UndefCntr0_CT lam3n4 ) ( * Nl2CT1 lam3n5 ) ( * Nl2CT2 lam3n6 ) ( * Nl2CT3 lam3n7 ) ( - 1 ( + Nl2CT3 ( * Nl2i_13^03 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam3n1 ) ( * 1 lam3n3 ) ( * UndefCntr0_i_13^0 lam3n4 ) ( * Nl2i_13^01 lam3n5 ) ( * Nl2i_13^02 lam3n6 ) ( * Nl2i_13^03 lam3n7 ) ) 0 ) ( = ( + ( * 1 lam3n2 ) ( * ( - 1 ) lam3n3 ) ( * UndefCntr0_undef18 lam3n4 ) ( - ( + 0 ( * Nl2i_13^03 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * ( - 1 ) lam3n2 ) ( * UndefCntr0_undef19 lam3n4 ) ) 0 ) ) ))
(assert ( and ( <= ( + Nl2CT1 ( * Nl2i_13^01 FV_i_13^0_1 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2i_13^02 FV_i_13^0_1 ) ) 0 ) ( <= ( + Nl2CT3 ( * Nl2i_13^03 FV_i_13^0_1 ) ) 0 ) ))
(assert ( or ( not ( = UndefCntr0_i_13^0 0 ) ) ( not ( = UndefCntr0_undef18 0 ) ) ( not ( = UndefCntr0_undef19 0 ) ) ( = UndefCntr0_CT 0 ) ))
(assert ( or ( = UndefCntr0_i_13^0 0 ) ( or ( not ( = UndefCntr0_undef18 0 ) ) ( not ( = UndefCntr0_undef19 0 ) ) ) ))
(assert ( or ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( > ( + ( * 50001 lam7n0 ) ( * Nl2CT1 lam7n1 ) ( * Nl2CT2 lam7n2 ) ( * Nl2CT3 lam7n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * Nl2i_13^01 lam7n1 ) ( * Nl2i_13^02 lam7n2 ) ( * Nl2i_13^03 lam7n3 ) ) 0 ) ) ( and ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( > ( + ( * 50001 lam8n0 ) ( * Nl2CT1 lam8n1 ) ( * Nl2CT2 lam8n2 ) ( * Nl2CT3 lam8n3 ) ( - 1 ( + ( - 9 ) ( * 1 UndefDef0undef19_CT ) ) ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl2i_13^01 lam8n1 ) ( * Nl2i_13^02 lam8n2 ) ( * Nl2i_13^03 lam8n3 ) ( - ( * UndefDef0undef19_i_13^0 1 ) ) ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( >= lam9n3 0 ) ( > ( + ( * 50001 lam9n0 ) ( * Nl2CT1 lam9n1 ) ( * Nl2CT2 lam9n2 ) ( * Nl2CT3 lam9n3 ) ( - 1 ( + ( + 1 ( * 1 UndefDef0undef18_CT ) ) ( * ( - 1 ) UndefDef0undef19_CT ) ) ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * Nl2i_13^01 lam9n1 ) ( * Nl2i_13^02 lam9n2 ) ( * Nl2i_13^03 lam9n3 ) ( - ( + ( * UndefDef0undef18_i_13^0 1 ) ( * UndefDef0undef19_i_13^0 ( - 1 ) ) ) ) ) 0 ) ) ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( >= lam10n3 0 ) ( > ( + ( * 50001 lam10n0 ) ( * Nl2CT1 lam10n1 ) ( * Nl2CT2 lam10n2 ) ( * Nl2CT3 lam10n3 ) ( - 1 ( - ( + ( + 1 ( * 1 UndefDef0undef18_CT ) ) ( * ( - 1 ) UndefDef0undef19_CT ) ) ) ) ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * Nl2i_13^01 lam10n1 ) ( * Nl2i_13^02 lam10n2 ) ( * Nl2i_13^03 lam10n3 ) ( - ( - ( + ( * UndefDef0undef18_i_13^0 1 ) ( * UndefDef0undef19_i_13^0 ( - 1 ) ) ) ) ) ) 0 ) ) ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( >= lam11n3 0 ) ( > ( + ( * 50001 lam11n0 ) ( * Nl2CT1 lam11n1 ) ( * Nl2CT2 lam11n2 ) ( * Nl2CT3 lam11n3 ) ( - 1 ( + ( + ( - 1 ) 0 ) ( * ( - 1 ) UndefDef0undef18_CT ) ) ) ) 0 ) ( = ( + ( * 1 lam11n0 ) ( * Nl2i_13^01 lam11n1 ) ( * Nl2i_13^02 lam11n2 ) ( * Nl2i_13^03 lam11n3 ) ( - ( + 1 ( * UndefDef0undef18_i_13^0 ( - 1 ) ) ) ) ) 0 ) ) ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( >= lam12n2 0 ) ( >= lam12n3 0 ) ( > ( + ( * 50001 lam12n0 ) ( * Nl2CT1 lam12n1 ) ( * Nl2CT2 lam12n2 ) ( * Nl2CT3 lam12n3 ) ( - 1 ( - ( + ( + ( - 1 ) 0 ) ( * ( - 1 ) UndefDef0undef18_CT ) ) ) ) ) 0 ) ( = ( + ( * 1 lam12n0 ) ( * Nl2i_13^01 lam12n1 ) ( * Nl2i_13^02 lam12n2 ) ( * Nl2i_13^03 lam12n3 ) ( - ( - ( + 1 ( * UndefDef0undef18_i_13^0 ( - 1 ) ) ) ) ) ) 0 ) ) ( or ( and ( = UndefCntr0_undef18 0 ) ( = UndefCntr0_undef19 0 ) ) ( and ( >= lam13n0 0 ) ( >= lam13n1 0 ) ( >= lam13n2 0 ) ( >= lam13n3 0 ) ( > ( + ( * 50001 lam13n0 ) ( * Nl2CT1 lam13n1 ) ( * Nl2CT2 lam13n2 ) ( * Nl2CT3 lam13n3 ) ( - 1 ( + ( + ( + UndefCntr0_CT 0 ) ( * UndefCntr0_undef18 UndefDef0undef18_CT ) ) ( * UndefCntr0_undef19 UndefDef0undef19_CT ) ) ) ) 0 ) ( = ( + ( * 1 lam13n0 ) ( * Nl2i_13^01 lam13n1 ) ( * Nl2i_13^02 lam13n2 ) ( * Nl2i_13^03 lam13n3 ) ( - ( + ( + UndefCntr0_i_13^0 ( * UndefDef0undef18_i_13^0 UndefCntr0_undef18 ) ) ( * UndefDef0undef19_i_13^0 UndefCntr0_undef19 ) ) ) ) 0 ) ) ) ) ))
(assert ( and ( >= lam14n0 0 ) ( >= lam14n1 0 ) ( >= lam14n2 0 ) ( >= lam14n3 0 ) ( > ( + ( * ( - 50000 ) lam14n0 ) ( * Nl2CT1 lam14n1 ) ( * Nl2CT2 lam14n2 ) ( * Nl2CT3 lam14n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam14n0 ) ( * Nl2i_13^01 lam14n1 ) ( * Nl2i_13^02 lam14n2 ) ( * Nl2i_13^03 lam14n3 ) ) 0 ) ))
(assert ( and ( and ( <= ( + Nl2CT1 ( * Nl2i_13^01 FV_i_13^0_2 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2i_13^02 FV_i_13^0_2 ) ) 0 ) ( <= ( + Nl2CT3 ( * Nl2i_13^03 FV_i_13^0_2 ) ) 0 ) ) ( and ( <= ( + ( - 9 ) FV_undef19_2 ) 0 ) ( <= ( + 50001 FV_i_13^0_2 ) 0 ) ( = ( + 1 ( * ( - 1 ) FV_undef19_2 ) FV_undef18_2 ) 0 ) ( = ( + ( - 1 ) FV_i_13^0_2 ( * ( - 1 ) FV_undef18_2 ) ) 0 ) ) ))
(check-sat)
(exit)