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
(declare-fun Nl1x^01 () Int)
(declare-fun Nl1x^02 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun lam0n2 () Int)
(declare-fun UndefCntr0_CT () Int)
(declare-fun Nl1CT1 () Int)
(declare-fun Nl1CT2 () Int)
(declare-fun UndefCntr0_x^0 () Int)
(declare-fun UndefCntr0_undef1 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam2n2 () Int)
(declare-fun x^0 () Int)
(declare-fun FV_x^0_1 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam6n2 () Int)
(declare-fun UndefDef0undef1_CT () Int)
(declare-fun UndefDef0undef1_x^0 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n3 () Int)
(declare-fun FV_x^0_2 () Int)
(declare-fun FV_undef1_2 () Int)
(assert ( and ( <= ( - 1 ) Nl1x^01 ) ( <= Nl1x^01 1 ) ( <= ( - 1 ) Nl1x^02 ) ( <= Nl1x^02 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( > ( + ( * 201 lam0n0 ) ( * 200 lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_CT lam0n3 ) ( * Nl1CT1 lam0n4 ) ( * Nl1CT2 lam0n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_x^0 lam0n3 ) ( * Nl1x^01 lam0n4 ) ( * Nl1x^02 lam0n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_undef1 lam0n3 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n3 0 ) ( >= lam1n4 0 ) ( >= lam1n5 0 ) ( > ( + ( * 201 lam1n0 ) ( * 200 lam1n1 ) ( * 1 lam1n2 ) ( * UndefCntr0_CT lam1n3 ) ( * Nl1CT1 lam1n4 ) ( * Nl1CT2 lam1n5 ) ( - 1 ( + Nl1CT1 ( * Nl1x^01 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n1 ) ( * 1 lam1n2 ) ( * UndefCntr0_x^0 lam1n3 ) ( * Nl1x^01 lam1n4 ) ( * Nl1x^02 lam1n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * ( - 1 ) lam1n2 ) ( * UndefCntr0_undef1 lam1n3 ) ( - ( + 0 ( * Nl1x^01 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( > ( + ( * 201 lam0n0 ) ( * 200 lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_CT lam0n3 ) ( * Nl1CT1 lam0n4 ) ( * Nl1CT2 lam0n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_x^0 lam0n3 ) ( * Nl1x^01 lam0n4 ) ( * Nl1x^02 lam0n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_undef1 lam0n3 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n3 0 ) ( >= lam2n4 0 ) ( >= lam2n5 0 ) ( > ( + ( * 201 lam2n0 ) ( * 200 lam2n1 ) ( * 1 lam2n2 ) ( * UndefCntr0_CT lam2n3 ) ( * Nl1CT1 lam2n4 ) ( * Nl1CT2 lam2n5 ) ( - 1 ( + Nl1CT2 ( * Nl1x^02 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n1 ) ( * 1 lam2n2 ) ( * UndefCntr0_x^0 lam2n3 ) ( * Nl1x^01 lam2n4 ) ( * Nl1x^02 lam2n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * ( - 1 ) lam2n2 ) ( * UndefCntr0_undef1 lam2n3 ) ( - ( + 0 ( * Nl1x^02 1 ) ) ) ) 0 ) ) ))
(assert ( and ( <= ( + Nl1CT1 ( * Nl1x^01 FV_x^0_1 ) ) 0 ) ( <= ( + Nl1CT2 ( * Nl1x^02 FV_x^0_1 ) ) 0 ) ))
(assert ( or ( not ( = UndefCntr0_x^0 0 ) ) ( not ( = UndefCntr0_undef1 0 ) ) ( = UndefCntr0_CT 0 ) ))
(assert ( or ( = UndefCntr0_x^0 0 ) ( not ( = UndefCntr0_undef1 0 ) ) ))
(assert ( or ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( > ( + ( * 200 lam5n0 ) ( * Nl1CT1 lam5n1 ) ( * Nl1CT2 lam5n2 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl1x^01 lam5n1 ) ( * Nl1x^02 lam5n2 ) ) 0 ) ) ( and ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( > ( + ( * 200 lam6n0 ) ( * Nl1CT1 lam6n1 ) ( * Nl1CT2 lam6n2 ) ( - 1 ( + 201 ( * ( - 1 ) UndefDef0undef1_CT ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * Nl1x^01 lam6n1 ) ( * Nl1x^02 lam6n2 ) ( - ( * UndefDef0undef1_x^0 ( - 1 ) ) ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( > ( + ( * 200 lam7n0 ) ( * Nl1CT1 lam7n1 ) ( * Nl1CT2 lam7n2 ) ( - 1 ( + ( + 1 0 ) ( * ( - 1 ) UndefDef0undef1_CT ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * Nl1x^01 lam7n1 ) ( * Nl1x^02 lam7n2 ) ( - ( + 1 ( * UndefDef0undef1_x^0 ( - 1 ) ) ) ) ) 0 ) ) ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( > ( + ( * 200 lam8n0 ) ( * Nl1CT1 lam8n1 ) ( * Nl1CT2 lam8n2 ) ( - 1 ( - ( + ( + 1 0 ) ( * ( - 1 ) UndefDef0undef1_CT ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * Nl1x^01 lam8n1 ) ( * Nl1x^02 lam8n2 ) ( - ( - ( + 1 ( * UndefDef0undef1_x^0 ( - 1 ) ) ) ) ) ) 0 ) ) ( or ( = UndefCntr0_undef1 0 ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( > ( + ( * 200 lam9n0 ) ( * Nl1CT1 lam9n1 ) ( * Nl1CT2 lam9n2 ) ( - 1 ( + ( + UndefCntr0_CT 0 ) ( * UndefCntr0_undef1 UndefDef0undef1_CT ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * Nl1x^01 lam9n1 ) ( * Nl1x^02 lam9n2 ) ( - ( + UndefCntr0_x^0 ( * UndefDef0undef1_x^0 UndefCntr0_undef1 ) ) ) ) 0 ) ) ) ) ))
(assert ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( >= lam10n3 0 ) ( > ( + ( * 1 lam10n0 ) ( * ( - 199 ) lam10n1 ) ( * Nl1CT1 lam10n2 ) ( * Nl1CT2 lam10n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n0 ) ( * 1 lam10n1 ) ( * Nl1x^01 lam10n2 ) ( * Nl1x^02 lam10n3 ) ) 0 ) ))
(assert ( and ( and ( <= ( + Nl1CT1 ( * Nl1x^01 FV_x^0_2 ) ) 0 ) ( <= ( + Nl1CT2 ( * Nl1x^02 FV_x^0_2 ) ) 0 ) ) ( and ( <= ( + 201 ( * ( - 1 ) FV_undef1_2 ) ) 0 ) ( <= ( + 200 ( * ( - 1 ) FV_x^0_2 ) ) 0 ) ( = ( + 1 ( * ( - 1 ) FV_undef1_2 ) FV_x^0_2 ) 0 ) ) ))
(check-sat)
(exit)