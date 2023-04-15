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
(declare-fun Nl3arg11 () Int)
(declare-fun Nl3arg21 () Int)
(declare-fun Nl3arg41 () Int)
(declare-fun Nl3arg51 () Int)
(declare-fun Nl3arg61 () Int)
(declare-fun Nl3arg12 () Int)
(declare-fun Nl3arg22 () Int)
(declare-fun Nl3arg42 () Int)
(declare-fun Nl3arg52 () Int)
(declare-fun Nl3arg62 () Int)
(declare-fun Nl3arg13 () Int)
(declare-fun Nl3arg23 () Int)
(declare-fun Nl3arg43 () Int)
(declare-fun Nl3arg53 () Int)
(declare-fun Nl3arg63 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun lam0n6 () Int)
(declare-fun UndefCntr0_CT () Int)
(declare-fun Nl3CT1 () Int)
(declare-fun Nl3CT2 () Int)
(declare-fun Nl3CT3 () Int)
(declare-fun UndefCntr0_arg1 () Int)
(declare-fun UndefCntr0_arg2 () Int)
(declare-fun UndefCntr0_arg4 () Int)
(declare-fun UndefCntr0_arg5 () Int)
(declare-fun UndefCntr0_arg6 () Int)
(declare-fun UndefCntr0_undef19 () Int)
(declare-fun UndefCntr0_undef22 () Int)
(declare-fun UndefCntr0_undef23 () Int)
(declare-fun UndefCntr0_undef24 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam1n6 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam2n6 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam3n4 () Int)
(declare-fun lam3n5 () Int)
(declare-fun lam3n6 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam4n3 () Int)
(declare-fun lam4n4 () Int)
(declare-fun lam4n5 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam5n3 () Int)
(declare-fun lam5n4 () Int)
(declare-fun lam5n5 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam6n2 () Int)
(declare-fun lam6n3 () Int)
(declare-fun lam6n4 () Int)
(declare-fun lam6n5 () Int)
(declare-fun arg1 () Int)
(declare-fun arg2 () Int)
(declare-fun undef25 () Int)
(declare-fun arg3 () Int)
(declare-fun arg4 () Int)
(declare-fun undef28 () Int)
(declare-fun undef29 () Int)
(declare-fun undef30 () Int)
(declare-fun FV_arg1_1 () Int)
(declare-fun FV_arg2_1 () Int)
(declare-fun FV_arg4_1 () Int)
(declare-fun FV_arg5_1 () Int)
(declare-fun FV_arg6_1 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n3 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n3 () Int)
(declare-fun UndefDef0undef19_CT () Int)
(declare-fun UndefDef0undef19_arg1 () Int)
(declare-fun UndefDef0undef19_arg2 () Int)
(declare-fun UndefDef0undef19_arg4 () Int)
(declare-fun UndefDef0undef19_arg5 () Int)
(declare-fun UndefDef0undef19_arg6 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam9n3 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n3 () Int)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam11n2 () Int)
(declare-fun lam11n3 () Int)
(declare-fun FV_arg1_2 () Int)
(declare-fun FV_arg2_2 () Int)
(declare-fun FV_arg4_2 () Int)
(declare-fun FV_arg5_2 () Int)
(declare-fun FV_arg6_2 () Int)
(declare-fun FV_undef19_2 () Int)
(assert ( and ( <= ( - 1 ) Nl3arg11 ) ( <= Nl3arg11 1 ) ( <= ( - 1 ) Nl3arg21 ) ( <= Nl3arg21 1 ) ( <= ( - 1 ) Nl3arg41 ) ( <= Nl3arg41 1 ) ( <= ( - 1 ) Nl3arg51 ) ( <= Nl3arg51 1 ) ( <= ( - 1 ) Nl3arg61 ) ( <= Nl3arg61 1 ) ( <= ( - 1 ) Nl3arg12 ) ( <= Nl3arg12 1 ) ( <= ( - 1 ) Nl3arg22 ) ( <= Nl3arg22 1 ) ( <= ( - 1 ) Nl3arg42 ) ( <= Nl3arg42 1 ) ( <= ( - 1 ) Nl3arg52 ) ( <= Nl3arg52 1 ) ( <= ( - 1 ) Nl3arg62 ) ( <= Nl3arg62 1 ) ( <= ( - 1 ) Nl3arg13 ) ( <= Nl3arg13 1 ) ( <= ( - 1 ) Nl3arg23 ) ( <= Nl3arg23 1 ) ( <= ( - 1 ) Nl3arg43 ) ( <= Nl3arg43 1 ) ( <= ( - 1 ) Nl3arg53 ) ( <= Nl3arg53 1 ) ( <= ( - 1 ) Nl3arg63 ) ( <= Nl3arg63 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( > ( + ( * 1 lam0n0 ) ( * 1 lam0n1 ) ( * UndefCntr0_CT lam0n3 ) ( * Nl3CT1 lam0n4 ) ( * Nl3CT2 lam0n5 ) ( * Nl3CT3 lam0n6 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_arg1 lam0n3 ) ( * Nl3arg11 lam0n4 ) ( * Nl3arg12 lam0n5 ) ( * Nl3arg13 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg2 lam0n3 ) ( * Nl3arg21 lam0n4 ) ( * Nl3arg22 lam0n5 ) ( * Nl3arg23 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg4 lam0n3 ) ( * Nl3arg41 lam0n4 ) ( * Nl3arg42 lam0n5 ) ( * Nl3arg43 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg5 lam0n3 ) ( * Nl3arg51 lam0n4 ) ( * Nl3arg52 lam0n5 ) ( * Nl3arg53 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg6 lam0n3 ) ( * Nl3arg61 lam0n4 ) ( * Nl3arg62 lam0n5 ) ( * Nl3arg63 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_undef19 lam0n3 ) ) 0 ) ( = ( * UndefCntr0_undef22 lam0n3 ) 0 ) ( = ( * UndefCntr0_undef23 lam0n3 ) 0 ) ( = ( * UndefCntr0_undef24 lam0n3 ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( >= lam1n4 0 ) ( >= lam1n5 0 ) ( >= lam1n6 0 ) ( > ( + ( * 1 lam1n0 ) ( * 1 lam1n1 ) ( * UndefCntr0_CT lam1n3 ) ( * Nl3CT1 lam1n4 ) ( * Nl3CT2 lam1n5 ) ( * Nl3CT3 lam1n6 ) ( - 1 ( + ( + ( + ( + ( + Nl3CT1 ( * Nl3arg11 0 ) ) ( * Nl3arg21 1 ) ) ( * Nl3arg41 0 ) ) ( * Nl3arg51 0 ) ) ( * Nl3arg61 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * ( - 1 ) lam1n2 ) ( * UndefCntr0_arg1 lam1n3 ) ( * Nl3arg11 lam1n4 ) ( * Nl3arg12 lam1n5 ) ( * Nl3arg13 lam1n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg2 lam1n3 ) ( * Nl3arg21 lam1n4 ) ( * Nl3arg22 lam1n5 ) ( * Nl3arg23 lam1n6 ) ( - ( + 0 ( * Nl3arg21 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_arg4 lam1n3 ) ( * Nl3arg41 lam1n4 ) ( * Nl3arg42 lam1n5 ) ( * Nl3arg43 lam1n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg5 lam1n3 ) ( * Nl3arg51 lam1n4 ) ( * Nl3arg52 lam1n5 ) ( * Nl3arg53 lam1n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg6 lam1n3 ) ( * Nl3arg61 lam1n4 ) ( * Nl3arg62 lam1n5 ) ( * Nl3arg63 lam1n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n1 ) ( * 1 lam1n2 ) ( * UndefCntr0_undef19 lam1n3 ) ( - ( + 0 ( * Nl3arg11 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef22 lam1n3 ) ( - ( + 0 ( * Nl3arg41 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef23 lam1n3 ) ( - ( + 0 ( * Nl3arg51 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef24 lam1n3 ) ( - ( + 0 ( * Nl3arg61 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( > ( + ( * 1 lam0n0 ) ( * 1 lam0n1 ) ( * UndefCntr0_CT lam0n3 ) ( * Nl3CT1 lam0n4 ) ( * Nl3CT2 lam0n5 ) ( * Nl3CT3 lam0n6 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_arg1 lam0n3 ) ( * Nl3arg11 lam0n4 ) ( * Nl3arg12 lam0n5 ) ( * Nl3arg13 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg2 lam0n3 ) ( * Nl3arg21 lam0n4 ) ( * Nl3arg22 lam0n5 ) ( * Nl3arg23 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg4 lam0n3 ) ( * Nl3arg41 lam0n4 ) ( * Nl3arg42 lam0n5 ) ( * Nl3arg43 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg5 lam0n3 ) ( * Nl3arg51 lam0n4 ) ( * Nl3arg52 lam0n5 ) ( * Nl3arg53 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg6 lam0n3 ) ( * Nl3arg61 lam0n4 ) ( * Nl3arg62 lam0n5 ) ( * Nl3arg63 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_undef19 lam0n3 ) ) 0 ) ( = ( * UndefCntr0_undef22 lam0n3 ) 0 ) ( = ( * UndefCntr0_undef23 lam0n3 ) 0 ) ( = ( * UndefCntr0_undef24 lam0n3 ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( >= lam2n4 0 ) ( >= lam2n5 0 ) ( >= lam2n6 0 ) ( > ( + ( * 1 lam2n0 ) ( * 1 lam2n1 ) ( * UndefCntr0_CT lam2n3 ) ( * Nl3CT1 lam2n4 ) ( * Nl3CT2 lam2n5 ) ( * Nl3CT3 lam2n6 ) ( - 1 ( + ( + ( + ( + ( + Nl3CT2 ( * Nl3arg12 0 ) ) ( * Nl3arg22 1 ) ) ( * Nl3arg42 0 ) ) ( * Nl3arg52 0 ) ) ( * Nl3arg62 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * ( - 1 ) lam2n2 ) ( * UndefCntr0_arg1 lam2n3 ) ( * Nl3arg11 lam2n4 ) ( * Nl3arg12 lam2n5 ) ( * Nl3arg13 lam2n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg2 lam2n3 ) ( * Nl3arg21 lam2n4 ) ( * Nl3arg22 lam2n5 ) ( * Nl3arg23 lam2n6 ) ( - ( + 0 ( * Nl3arg22 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_arg4 lam2n3 ) ( * Nl3arg41 lam2n4 ) ( * Nl3arg42 lam2n5 ) ( * Nl3arg43 lam2n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg5 lam2n3 ) ( * Nl3arg51 lam2n4 ) ( * Nl3arg52 lam2n5 ) ( * Nl3arg53 lam2n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg6 lam2n3 ) ( * Nl3arg61 lam2n4 ) ( * Nl3arg62 lam2n5 ) ( * Nl3arg63 lam2n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n1 ) ( * 1 lam2n2 ) ( * UndefCntr0_undef19 lam2n3 ) ( - ( + 0 ( * Nl3arg12 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef22 lam2n3 ) ( - ( + 0 ( * Nl3arg42 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef23 lam2n3 ) ( - ( + 0 ( * Nl3arg52 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef24 lam2n3 ) ( - ( + 0 ( * Nl3arg62 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( >= lam0n6 0 ) ( > ( + ( * 1 lam0n0 ) ( * 1 lam0n1 ) ( * UndefCntr0_CT lam0n3 ) ( * Nl3CT1 lam0n4 ) ( * Nl3CT2 lam0n5 ) ( * Nl3CT3 lam0n6 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * UndefCntr0_arg1 lam0n3 ) ( * Nl3arg11 lam0n4 ) ( * Nl3arg12 lam0n5 ) ( * Nl3arg13 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg2 lam0n3 ) ( * Nl3arg21 lam0n4 ) ( * Nl3arg22 lam0n5 ) ( * Nl3arg23 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg4 lam0n3 ) ( * Nl3arg41 lam0n4 ) ( * Nl3arg42 lam0n5 ) ( * Nl3arg43 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg5 lam0n3 ) ( * Nl3arg51 lam0n4 ) ( * Nl3arg52 lam0n5 ) ( * Nl3arg53 lam0n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg6 lam0n3 ) ( * Nl3arg61 lam0n4 ) ( * Nl3arg62 lam0n5 ) ( * Nl3arg63 lam0n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * 1 lam0n2 ) ( * UndefCntr0_undef19 lam0n3 ) ) 0 ) ( = ( * UndefCntr0_undef22 lam0n3 ) 0 ) ( = ( * UndefCntr0_undef23 lam0n3 ) 0 ) ( = ( * UndefCntr0_undef24 lam0n3 ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( >= lam3n4 0 ) ( >= lam3n5 0 ) ( >= lam3n6 0 ) ( > ( + ( * 1 lam3n0 ) ( * 1 lam3n1 ) ( * UndefCntr0_CT lam3n3 ) ( * Nl3CT1 lam3n4 ) ( * Nl3CT2 lam3n5 ) ( * Nl3CT3 lam3n6 ) ( - 1 ( + ( + ( + ( + ( + Nl3CT3 ( * Nl3arg13 0 ) ) ( * Nl3arg23 1 ) ) ( * Nl3arg43 0 ) ) ( * Nl3arg53 0 ) ) ( * Nl3arg63 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * ( - 1 ) lam3n2 ) ( * UndefCntr0_arg1 lam3n3 ) ( * Nl3arg11 lam3n4 ) ( * Nl3arg12 lam3n5 ) ( * Nl3arg13 lam3n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg2 lam3n3 ) ( * Nl3arg21 lam3n4 ) ( * Nl3arg22 lam3n5 ) ( * Nl3arg23 lam3n6 ) ( - ( + 0 ( * Nl3arg23 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_arg4 lam3n3 ) ( * Nl3arg41 lam3n4 ) ( * Nl3arg42 lam3n5 ) ( * Nl3arg43 lam3n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg5 lam3n3 ) ( * Nl3arg51 lam3n4 ) ( * Nl3arg52 lam3n5 ) ( * Nl3arg53 lam3n6 ) ) 0 ) ( = ( + ( * UndefCntr0_arg6 lam3n3 ) ( * Nl3arg61 lam3n4 ) ( * Nl3arg62 lam3n5 ) ( * Nl3arg63 lam3n6 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n1 ) ( * 1 lam3n2 ) ( * UndefCntr0_undef19 lam3n3 ) ( - ( + 0 ( * Nl3arg13 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef22 lam3n3 ) ( - ( + 0 ( * Nl3arg43 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef23 lam3n3 ) ( - ( + 0 ( * Nl3arg53 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_undef24 lam3n3 ) ( - ( + 0 ( * Nl3arg63 1 ) ) ) ) 0 ) ) ))
(assert ( and ( <= ( + Nl3CT1 ( * Nl3arg11 FV_arg1_1 ) ( * Nl3arg21 FV_arg2_1 ) ( * Nl3arg41 FV_arg4_1 ) ( * Nl3arg51 FV_arg5_1 ) ( * Nl3arg61 FV_arg6_1 ) ) 0 ) ( <= ( + Nl3CT2 ( * Nl3arg12 FV_arg1_1 ) ( * Nl3arg22 FV_arg2_1 ) ( * Nl3arg42 FV_arg4_1 ) ( * Nl3arg52 FV_arg5_1 ) ( * Nl3arg62 FV_arg6_1 ) ) 0 ) ( <= ( + Nl3CT3 ( * Nl3arg13 FV_arg1_1 ) ( * Nl3arg23 FV_arg2_1 ) ( * Nl3arg43 FV_arg4_1 ) ( * Nl3arg53 FV_arg5_1 ) ( * Nl3arg63 FV_arg6_1 ) ) 0 ) ))
(assert ( or ( not ( = UndefCntr0_arg1 0 ) ) ( not ( = UndefCntr0_arg2 0 ) ) ( not ( = UndefCntr0_arg4 0 ) ) ( not ( = UndefCntr0_arg5 0 ) ) ( not ( = UndefCntr0_arg6 0 ) ) ( not ( = UndefCntr0_undef19 0 ) ) ( not ( = UndefCntr0_undef22 0 ) ) ( not ( = UndefCntr0_undef23 0 ) ) ( not ( = UndefCntr0_undef24 0 ) ) ( = UndefCntr0_CT 0 ) ))
(assert ( or ( and ( = UndefCntr0_arg1 0 ) ( = UndefCntr0_arg2 0 ) ( = UndefCntr0_arg4 0 ) ( = UndefCntr0_arg5 0 ) ( = UndefCntr0_arg6 0 ) ) ( or ( not ( = UndefCntr0_undef19 0 ) ) ( not ( = UndefCntr0_undef22 0 ) ) ( not ( = UndefCntr0_undef23 0 ) ) ( not ( = UndefCntr0_undef24 0 ) ) ) ))
(assert ( or ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( > ( + ( * 1 lam7n0 ) ( * Nl3CT1 lam7n1 ) ( * Nl3CT2 lam7n2 ) ( * Nl3CT3 lam7n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * Nl3arg11 lam7n1 ) ( * Nl3arg12 lam7n2 ) ( * Nl3arg13 lam7n3 ) ) 0 ) ( = ( + ( * Nl3arg21 lam7n1 ) ( * Nl3arg22 lam7n2 ) ( * Nl3arg23 lam7n3 ) ) 0 ) ( = ( + ( * Nl3arg41 lam7n1 ) ( * Nl3arg42 lam7n2 ) ( * Nl3arg43 lam7n3 ) ) 0 ) ( = ( + ( * Nl3arg51 lam7n1 ) ( * Nl3arg52 lam7n2 ) ( * Nl3arg53 lam7n3 ) ) 0 ) ( = ( + ( * Nl3arg61 lam7n1 ) ( * Nl3arg62 lam7n2 ) ( * Nl3arg63 lam7n3 ) ) 0 ) ) ( and ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( > ( + ( * 1 lam8n0 ) ( * Nl3CT1 lam8n1 ) ( * Nl3CT2 lam8n2 ) ( * Nl3CT3 lam8n3 ) ( - 1 ( + 1 ( * ( - 1 ) UndefDef0undef19_CT ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * Nl3arg11 lam8n1 ) ( * Nl3arg12 lam8n2 ) ( * Nl3arg13 lam8n3 ) ( - ( * UndefDef0undef19_arg1 ( - 1 ) ) ) ) 0 ) ( = ( + ( * Nl3arg21 lam8n1 ) ( * Nl3arg22 lam8n2 ) ( * Nl3arg23 lam8n3 ) ( - ( * UndefDef0undef19_arg2 ( - 1 ) ) ) ) 0 ) ( = ( + ( * Nl3arg41 lam8n1 ) ( * Nl3arg42 lam8n2 ) ( * Nl3arg43 lam8n3 ) ( - ( * UndefDef0undef19_arg4 ( - 1 ) ) ) ) 0 ) ( = ( + ( * Nl3arg51 lam8n1 ) ( * Nl3arg52 lam8n2 ) ( * Nl3arg53 lam8n3 ) ( - ( * UndefDef0undef19_arg5 ( - 1 ) ) ) ) 0 ) ( = ( + ( * Nl3arg61 lam8n1 ) ( * Nl3arg62 lam8n2 ) ( * Nl3arg63 lam8n3 ) ( - ( * UndefDef0undef19_arg6 ( - 1 ) ) ) ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( >= lam9n3 0 ) ( > ( + ( * 1 lam9n0 ) ( * Nl3CT1 lam9n1 ) ( * Nl3CT2 lam9n2 ) ( * Nl3CT3 lam9n3 ) ( - 1 ( + ( + 0 0 ) ( * 1 UndefDef0undef19_CT ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * Nl3arg11 lam9n1 ) ( * Nl3arg12 lam9n2 ) ( * Nl3arg13 lam9n3 ) ( - ( + ( - 1 ) ( * UndefDef0undef19_arg1 1 ) ) ) ) 0 ) ( = ( + ( * Nl3arg21 lam9n1 ) ( * Nl3arg22 lam9n2 ) ( * Nl3arg23 lam9n3 ) ( - ( * UndefDef0undef19_arg2 1 ) ) ) 0 ) ( = ( + ( * Nl3arg41 lam9n1 ) ( * Nl3arg42 lam9n2 ) ( * Nl3arg43 lam9n3 ) ( - ( * UndefDef0undef19_arg4 1 ) ) ) 0 ) ( = ( + ( * Nl3arg51 lam9n1 ) ( * Nl3arg52 lam9n2 ) ( * Nl3arg53 lam9n3 ) ( - ( * UndefDef0undef19_arg5 1 ) ) ) 0 ) ( = ( + ( * Nl3arg61 lam9n1 ) ( * Nl3arg62 lam9n2 ) ( * Nl3arg63 lam9n3 ) ( - ( * UndefDef0undef19_arg6 1 ) ) ) 0 ) ) ( or ( = UndefCntr0_undef19 0 ) ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( >= lam10n3 0 ) ( > ( + ( * 1 lam10n0 ) ( * Nl3CT1 lam10n1 ) ( * Nl3CT2 lam10n2 ) ( * Nl3CT3 lam10n3 ) ( - 1 ( + ( + ( + ( + ( + ( + ( + ( + ( + UndefCntr0_CT 0 ) 0 ) 0 ) 0 ) 0 ) ( * UndefCntr0_undef19 UndefDef0undef19_CT ) ) 0 ) 0 ) 0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n0 ) ( * Nl3arg11 lam10n1 ) ( * Nl3arg12 lam10n2 ) ( * Nl3arg13 lam10n3 ) ( - ( + UndefCntr0_arg1 ( * UndefDef0undef19_arg1 UndefCntr0_undef19 ) ) ) ) 0 ) ( = ( + ( * Nl3arg21 lam10n1 ) ( * Nl3arg22 lam10n2 ) ( * Nl3arg23 lam10n3 ) ( - ( + UndefCntr0_arg2 ( * UndefDef0undef19_arg2 UndefCntr0_undef19 ) ) ) ) 0 ) ( = ( + ( * Nl3arg41 lam10n1 ) ( * Nl3arg42 lam10n2 ) ( * Nl3arg43 lam10n3 ) ( - ( + UndefCntr0_arg4 ( * UndefDef0undef19_arg4 UndefCntr0_undef19 ) ) ) ) 0 ) ( = ( + ( * Nl3arg51 lam10n1 ) ( * Nl3arg52 lam10n2 ) ( * Nl3arg53 lam10n3 ) ( - ( + UndefCntr0_arg5 ( * UndefDef0undef19_arg5 UndefCntr0_undef19 ) ) ) ) 0 ) ( = ( + ( * Nl3arg61 lam10n1 ) ( * Nl3arg62 lam10n2 ) ( * Nl3arg63 lam10n3 ) ( - ( + UndefCntr0_arg6 ( * UndefDef0undef19_arg6 UndefCntr0_undef19 ) ) ) ) 0 ) ( = ( - UndefCntr0_undef22 ) 0 ) ( = ( - UndefCntr0_undef23 ) 0 ) ( = ( - UndefCntr0_undef24 ) 0 ) ) ) ) ))
(assert ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( >= lam11n3 0 ) ( > ( + ( * Nl3CT1 lam11n1 ) ( * Nl3CT2 lam11n2 ) ( * Nl3CT3 lam11n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam11n0 ) ( * Nl3arg11 lam11n1 ) ( * Nl3arg12 lam11n2 ) ( * Nl3arg13 lam11n3 ) ) 0 ) ( = ( + ( * Nl3arg21 lam11n1 ) ( * Nl3arg22 lam11n2 ) ( * Nl3arg23 lam11n3 ) ) 0 ) ( = ( + ( * Nl3arg41 lam11n1 ) ( * Nl3arg42 lam11n2 ) ( * Nl3arg43 lam11n3 ) ) 0 ) ( = ( + ( * Nl3arg51 lam11n1 ) ( * Nl3arg52 lam11n2 ) ( * Nl3arg53 lam11n3 ) ) 0 ) ( = ( + ( * Nl3arg61 lam11n1 ) ( * Nl3arg62 lam11n2 ) ( * Nl3arg63 lam11n3 ) ) 0 ) ))
(assert ( and ( and ( <= ( + Nl3CT1 ( * Nl3arg11 FV_arg1_2 ) ( * Nl3arg21 FV_arg2_2 ) ( * Nl3arg41 FV_arg4_2 ) ( * Nl3arg51 FV_arg5_2 ) ( * Nl3arg61 FV_arg6_2 ) ) 0 ) ( <= ( + Nl3CT2 ( * Nl3arg12 FV_arg1_2 ) ( * Nl3arg22 FV_arg2_2 ) ( * Nl3arg42 FV_arg4_2 ) ( * Nl3arg52 FV_arg5_2 ) ( * Nl3arg62 FV_arg6_2 ) ) 0 ) ( <= ( + Nl3CT3 ( * Nl3arg13 FV_arg1_2 ) ( * Nl3arg23 FV_arg2_2 ) ( * Nl3arg43 FV_arg4_2 ) ( * Nl3arg53 FV_arg5_2 ) ( * Nl3arg63 FV_arg6_2 ) ) 0 ) ) ( and ( <= ( + 1 ( * ( - 1 ) FV_arg1_2 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) FV_undef19_2 ) ) 0 ) ( <= ( + ( * ( - 1 ) FV_arg1_2 ) FV_undef19_2 ) 0 ) ) ))
(check-sat)
(exit)