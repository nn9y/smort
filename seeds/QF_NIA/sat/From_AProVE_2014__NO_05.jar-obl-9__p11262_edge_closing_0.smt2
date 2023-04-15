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
(declare-fun Nl2arg11 () Int)
(declare-fun Nl2arg21 () Int)
(declare-fun Nl4arg11 () Int)
(declare-fun Nl4arg21 () Int)
(declare-fun Nl2arg12 () Int)
(declare-fun Nl2arg22 () Int)
(declare-fun Nl4arg12 () Int)
(declare-fun Nl4arg22 () Int)
(declare-fun Nl2arg13 () Int)
(declare-fun Nl2arg23 () Int)
(declare-fun Nl4arg13 () Int)
(declare-fun Nl4arg23 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam0n4 () Int)
(declare-fun UndefCntr0_CT () Int)
(declare-fun Nl4CT1 () Int)
(declare-fun Nl4CT2 () Int)
(declare-fun Nl4CT3 () Int)
(declare-fun UndefCntr0_arg1 () Int)
(declare-fun UndefCntr0_arg2 () Int)
(declare-fun UndefCntr0_undef14 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n4 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n4 () Int)
(declare-fun Nl2CT2 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam3n4 () Int)
(declare-fun Nl2CT3 () Int)
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
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n3 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n3 () Int)
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
(declare-fun lam12n0 () Int)
(declare-fun lam12n1 () Int)
(declare-fun lam12n2 () Int)
(declare-fun lam12n3 () Int)
(declare-fun lam12n4 () Int)
(declare-fun lam12n5 () Int)
(declare-fun UndefCntr3_CT () Int)
(declare-fun UndefCntr3_arg1 () Int)
(declare-fun UndefCntr3_arg2 () Int)
(declare-fun UndefCntr3_undef4 () Int)
(declare-fun lam13n0 () Int)
(declare-fun lam13n1 () Int)
(declare-fun lam13n2 () Int)
(declare-fun lam13n3 () Int)
(declare-fun lam13n4 () Int)
(declare-fun lam13n5 () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam14n1 () Int)
(declare-fun lam14n2 () Int)
(declare-fun lam14n3 () Int)
(declare-fun lam14n4 () Int)
(declare-fun lam14n5 () Int)
(declare-fun lam15n0 () Int)
(declare-fun lam15n1 () Int)
(declare-fun lam15n2 () Int)
(declare-fun lam15n3 () Int)
(declare-fun lam15n4 () Int)
(declare-fun lam15n5 () Int)
(declare-fun lam16n0 () Int)
(declare-fun lam16n1 () Int)
(declare-fun lam17n0 () Int)
(declare-fun lam17n1 () Int)
(declare-fun lam18n0 () Int)
(declare-fun lam18n1 () Int)
(declare-fun arg1 () Int)
(declare-fun arg2 () Int)
(declare-fun undef2 () Int)
(declare-fun lam19n0 () Int)
(declare-fun lam19n1 () Int)
(declare-fun lam19n2 () Int)
(declare-fun lam19n3 () Int)
(declare-fun FV_arg1_5 () Int)
(declare-fun FV_arg2_5 () Int)
(declare-fun FV_arg2_4 () Int)
(declare-fun FV_arg1_4 () Int)
(assert ( and ( <= ( - 1 ) Nl2arg11 ) ( <= Nl2arg11 1 ) ( <= ( - 1 ) Nl2arg21 ) ( <= Nl2arg21 1 ) ( <= ( - 1 ) Nl4arg11 ) ( <= Nl4arg11 1 ) ( <= ( - 1 ) Nl4arg21 ) ( <= Nl4arg21 1 ) ( <= ( - 1 ) Nl2arg12 ) ( <= Nl2arg12 1 ) ( <= ( - 1 ) Nl2arg22 ) ( <= Nl2arg22 1 ) ( <= ( - 1 ) Nl4arg12 ) ( <= Nl4arg12 1 ) ( <= ( - 1 ) Nl4arg22 ) ( <= Nl4arg22 1 ) ( <= ( - 1 ) Nl2arg13 ) ( <= Nl2arg13 1 ) ( <= ( - 1 ) Nl2arg23 ) ( <= Nl2arg23 1 ) ( <= ( - 1 ) Nl4arg13 ) ( <= Nl4arg13 1 ) ( <= ( - 1 ) Nl4arg23 ) ( <= Nl4arg23 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( > ( + ( * 15 lam0n0 ) ( * UndefCntr0_CT lam0n1 ) ( * Nl4CT1 lam0n2 ) ( * Nl4CT2 lam0n3 ) ( * Nl4CT3 lam0n4 ) ( - 1 ) ) 0 ) ( = ( + ( * UndefCntr0_arg1 lam0n1 ) ( * Nl4arg11 lam0n2 ) ( * Nl4arg12 lam0n3 ) ( * Nl4arg13 lam0n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * UndefCntr0_arg2 lam0n1 ) ( * Nl4arg21 lam0n2 ) ( * Nl4arg22 lam0n3 ) ( * Nl4arg23 lam0n4 ) ) 0 ) ( = ( * UndefCntr0_undef14 lam0n1 ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( >= lam1n4 0 ) ( > ( + ( * 15 lam1n0 ) ( * UndefCntr0_CT lam1n1 ) ( * Nl4CT1 lam1n2 ) ( * Nl4CT2 lam1n3 ) ( * Nl4CT3 lam1n4 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2arg11 1 ) ) ( * Nl2arg21 0 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_arg1 lam1n1 ) ( * Nl4arg11 lam1n2 ) ( * Nl4arg12 lam1n3 ) ( * Nl4arg13 lam1n4 ) ( - ( + 0 ( * Nl2arg11 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * UndefCntr0_arg2 lam1n1 ) ( * Nl4arg21 lam1n2 ) ( * Nl4arg22 lam1n3 ) ( * Nl4arg23 lam1n4 ) ) 0 ) ( = ( + ( * UndefCntr0_undef14 lam1n1 ) ( - ( + 0 ( * Nl2arg21 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( > ( + ( * 15 lam0n0 ) ( * UndefCntr0_CT lam0n1 ) ( * Nl4CT1 lam0n2 ) ( * Nl4CT2 lam0n3 ) ( * Nl4CT3 lam0n4 ) ( - 1 ) ) 0 ) ( = ( + ( * UndefCntr0_arg1 lam0n1 ) ( * Nl4arg11 lam0n2 ) ( * Nl4arg12 lam0n3 ) ( * Nl4arg13 lam0n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * UndefCntr0_arg2 lam0n1 ) ( * Nl4arg21 lam0n2 ) ( * Nl4arg22 lam0n3 ) ( * Nl4arg23 lam0n4 ) ) 0 ) ( = ( * UndefCntr0_undef14 lam0n1 ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( >= lam2n4 0 ) ( > ( + ( * 15 lam2n0 ) ( * UndefCntr0_CT lam2n1 ) ( * Nl4CT1 lam2n2 ) ( * Nl4CT2 lam2n3 ) ( * Nl4CT3 lam2n4 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2arg12 1 ) ) ( * Nl2arg22 0 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_arg1 lam2n1 ) ( * Nl4arg11 lam2n2 ) ( * Nl4arg12 lam2n3 ) ( * Nl4arg13 lam2n4 ) ( - ( + 0 ( * Nl2arg12 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * UndefCntr0_arg2 lam2n1 ) ( * Nl4arg21 lam2n2 ) ( * Nl4arg22 lam2n3 ) ( * Nl4arg23 lam2n4 ) ) 0 ) ( = ( + ( * UndefCntr0_undef14 lam2n1 ) ( - ( + 0 ( * Nl2arg22 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( > ( + ( * 15 lam0n0 ) ( * UndefCntr0_CT lam0n1 ) ( * Nl4CT1 lam0n2 ) ( * Nl4CT2 lam0n3 ) ( * Nl4CT3 lam0n4 ) ( - 1 ) ) 0 ) ( = ( + ( * UndefCntr0_arg1 lam0n1 ) ( * Nl4arg11 lam0n2 ) ( * Nl4arg12 lam0n3 ) ( * Nl4arg13 lam0n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * UndefCntr0_arg2 lam0n1 ) ( * Nl4arg21 lam0n2 ) ( * Nl4arg22 lam0n3 ) ( * Nl4arg23 lam0n4 ) ) 0 ) ( = ( * UndefCntr0_undef14 lam0n1 ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( >= lam3n4 0 ) ( > ( + ( * 15 lam3n0 ) ( * UndefCntr0_CT lam3n1 ) ( * Nl4CT1 lam3n2 ) ( * Nl4CT2 lam3n3 ) ( * Nl4CT3 lam3n4 ) ( - 1 ( + ( + Nl2CT3 ( * Nl2arg13 1 ) ) ( * Nl2arg23 0 ) ) ) ) 0 ) ( = ( + ( * UndefCntr0_arg1 lam3n1 ) ( * Nl4arg11 lam3n2 ) ( * Nl4arg12 lam3n3 ) ( * Nl4arg13 lam3n4 ) ( - ( + 0 ( * Nl2arg13 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * UndefCntr0_arg2 lam3n1 ) ( * Nl4arg21 lam3n2 ) ( * Nl4arg22 lam3n3 ) ( * Nl4arg23 lam3n4 ) ) 0 ) ( = ( + ( * UndefCntr0_undef14 lam3n1 ) ( - ( + 0 ( * Nl2arg23 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( > ( + ( * ( - 14 ) lam4n0 ) ( * Nl4CT1 lam4n1 ) ( * Nl4CT2 lam4n2 ) ( * Nl4CT3 lam4n3 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl4arg11 lam4n1 ) ( * Nl4arg12 lam4n2 ) ( * Nl4arg13 lam4n3 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl4arg21 lam4n1 ) ( * Nl4arg22 lam4n2 ) ( * Nl4arg23 lam4n3 ) ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n3 0 ) ( > ( + ( * ( - 14 ) lam5n0 ) ( * Nl4CT1 lam5n1 ) ( * Nl4CT2 lam5n2 ) ( * Nl4CT3 lam5n3 ) ( - 1 ( + Nl4CT1 ( * Nl4arg21 1 ) ) ) ) 0 ) ( = ( + ( * Nl4arg11 lam5n1 ) ( * Nl4arg12 lam5n2 ) ( * Nl4arg13 lam5n3 ) ( - ( + 0 Nl4arg11 ) ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * Nl4arg21 lam5n1 ) ( * Nl4arg22 lam5n2 ) ( * Nl4arg23 lam5n3 ) ( - ( + 0 ( * Nl4arg21 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( > ( + ( * ( - 14 ) lam4n0 ) ( * Nl4CT1 lam4n1 ) ( * Nl4CT2 lam4n2 ) ( * Nl4CT3 lam4n3 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl4arg11 lam4n1 ) ( * Nl4arg12 lam4n2 ) ( * Nl4arg13 lam4n3 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl4arg21 lam4n1 ) ( * Nl4arg22 lam4n2 ) ( * Nl4arg23 lam4n3 ) ) 0 ) ) ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( >= lam6n3 0 ) ( > ( + ( * ( - 14 ) lam6n0 ) ( * Nl4CT1 lam6n1 ) ( * Nl4CT2 lam6n2 ) ( * Nl4CT3 lam6n3 ) ( - 1 ( + Nl4CT2 ( * Nl4arg22 1 ) ) ) ) 0 ) ( = ( + ( * Nl4arg11 lam6n1 ) ( * Nl4arg12 lam6n2 ) ( * Nl4arg13 lam6n3 ) ( - ( + 0 Nl4arg12 ) ) ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * Nl4arg21 lam6n1 ) ( * Nl4arg22 lam6n2 ) ( * Nl4arg23 lam6n3 ) ( - ( + 0 ( * Nl4arg22 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( > ( + ( * ( - 14 ) lam4n0 ) ( * Nl4CT1 lam4n1 ) ( * Nl4CT2 lam4n2 ) ( * Nl4CT3 lam4n3 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl4arg11 lam4n1 ) ( * Nl4arg12 lam4n2 ) ( * Nl4arg13 lam4n3 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl4arg21 lam4n1 ) ( * Nl4arg22 lam4n2 ) ( * Nl4arg23 lam4n3 ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( > ( + ( * ( - 14 ) lam7n0 ) ( * Nl4CT1 lam7n1 ) ( * Nl4CT2 lam7n2 ) ( * Nl4CT3 lam7n3 ) ( - 1 ( + Nl4CT3 ( * Nl4arg23 1 ) ) ) ) 0 ) ( = ( + ( * Nl4arg11 lam7n1 ) ( * Nl4arg12 lam7n2 ) ( * Nl4arg13 lam7n3 ) ( - ( + 0 Nl4arg13 ) ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * Nl4arg21 lam7n1 ) ( * Nl4arg22 lam7n2 ) ( * Nl4arg23 lam7n3 ) ( - ( + 0 ( * Nl4arg23 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( > ( + ( * ( - 9 ) lam8n0 ) ( * Nl2CT1 lam8n1 ) ( * Nl2CT2 lam8n2 ) ( * Nl2CT3 lam8n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl2arg11 lam8n1 ) ( * Nl2arg12 lam8n2 ) ( * Nl2arg13 lam8n3 ) ) 0 ) ( = ( + ( * Nl2arg21 lam8n1 ) ( * Nl2arg22 lam8n2 ) ( * Nl2arg23 lam8n3 ) ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( >= lam9n3 0 ) ( > ( + ( * ( - 9 ) lam9n0 ) ( * Nl2CT1 lam9n1 ) ( * Nl2CT2 lam9n2 ) ( * Nl2CT3 lam9n3 ) ( - 1 ( + Nl4CT1 ( * Nl4arg21 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * Nl2arg11 lam9n1 ) ( * Nl2arg12 lam9n2 ) ( * Nl2arg13 lam9n3 ) ( - ( + 0 Nl4arg11 ) ) ) 0 ) ( = ( + ( * Nl2arg21 lam9n1 ) ( * Nl2arg22 lam9n2 ) ( * Nl2arg23 lam9n3 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( > ( + ( * ( - 9 ) lam8n0 ) ( * Nl2CT1 lam8n1 ) ( * Nl2CT2 lam8n2 ) ( * Nl2CT3 lam8n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl2arg11 lam8n1 ) ( * Nl2arg12 lam8n2 ) ( * Nl2arg13 lam8n3 ) ) 0 ) ( = ( + ( * Nl2arg21 lam8n1 ) ( * Nl2arg22 lam8n2 ) ( * Nl2arg23 lam8n3 ) ) 0 ) ) ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( >= lam10n3 0 ) ( > ( + ( * ( - 9 ) lam10n0 ) ( * Nl2CT1 lam10n1 ) ( * Nl2CT2 lam10n2 ) ( * Nl2CT3 lam10n3 ) ( - 1 ( + Nl4CT2 ( * Nl4arg22 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * Nl2arg11 lam10n1 ) ( * Nl2arg12 lam10n2 ) ( * Nl2arg13 lam10n3 ) ( - ( + 0 Nl4arg12 ) ) ) 0 ) ( = ( + ( * Nl2arg21 lam10n1 ) ( * Nl2arg22 lam10n2 ) ( * Nl2arg23 lam10n3 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( > ( + ( * ( - 9 ) lam8n0 ) ( * Nl2CT1 lam8n1 ) ( * Nl2CT2 lam8n2 ) ( * Nl2CT3 lam8n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl2arg11 lam8n1 ) ( * Nl2arg12 lam8n2 ) ( * Nl2arg13 lam8n3 ) ) 0 ) ( = ( + ( * Nl2arg21 lam8n1 ) ( * Nl2arg22 lam8n2 ) ( * Nl2arg23 lam8n3 ) ) 0 ) ) ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( >= lam11n3 0 ) ( > ( + ( * ( - 9 ) lam11n0 ) ( * Nl2CT1 lam11n1 ) ( * Nl2CT2 lam11n2 ) ( * Nl2CT3 lam11n3 ) ( - 1 ( + Nl4CT3 ( * Nl4arg23 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam11n0 ) ( * Nl2arg11 lam11n1 ) ( * Nl2arg12 lam11n2 ) ( * Nl2arg13 lam11n3 ) ( - ( + 0 Nl4arg13 ) ) ) 0 ) ( = ( + ( * Nl2arg21 lam11n1 ) ( * Nl2arg22 lam11n2 ) ( * Nl2arg23 lam11n3 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( >= lam12n2 0 ) ( >= lam12n3 0 ) ( >= lam12n4 0 ) ( >= lam12n5 0 ) ( > ( + ( * 10 lam12n0 ) ( * ( - 49 ) lam12n1 ) ( * UndefCntr3_CT lam12n2 ) ( * Nl2CT1 lam12n3 ) ( * Nl2CT2 lam12n4 ) ( * Nl2CT3 lam12n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam12n0 ) ( * 1 lam12n1 ) ( * UndefCntr3_arg1 lam12n2 ) ( * Nl2arg11 lam12n3 ) ( * Nl2arg12 lam12n4 ) ( * Nl2arg13 lam12n5 ) ) 0 ) ( = ( + ( * UndefCntr3_arg2 lam12n2 ) ( * Nl2arg21 lam12n3 ) ( * Nl2arg22 lam12n4 ) ( * Nl2arg23 lam12n5 ) ) 0 ) ( = ( * UndefCntr3_undef4 lam12n2 ) 0 ) ) ( and ( >= lam13n0 0 ) ( >= lam13n1 0 ) ( >= lam13n2 0 ) ( >= lam13n3 0 ) ( >= lam13n4 0 ) ( >= lam13n5 0 ) ( > ( + ( * 10 lam13n0 ) ( * ( - 49 ) lam13n1 ) ( * UndefCntr3_CT lam13n2 ) ( * Nl2CT1 lam13n3 ) ( * Nl2CT2 lam13n4 ) ( * Nl2CT3 lam13n5 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2arg11 1 ) ) ( * Nl2arg21 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam13n0 ) ( * 1 lam13n1 ) ( * UndefCntr3_arg1 lam13n2 ) ( * Nl2arg11 lam13n3 ) ( * Nl2arg12 lam13n4 ) ( * Nl2arg13 lam13n5 ) ( - ( + 0 ( * Nl2arg11 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr3_arg2 lam13n2 ) ( * Nl2arg21 lam13n3 ) ( * Nl2arg22 lam13n4 ) ( * Nl2arg23 lam13n5 ) ) 0 ) ( = ( + ( * UndefCntr3_undef4 lam13n2 ) ( - ( + 0 ( * Nl2arg21 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( >= lam12n2 0 ) ( >= lam12n3 0 ) ( >= lam12n4 0 ) ( >= lam12n5 0 ) ( > ( + ( * 10 lam12n0 ) ( * ( - 49 ) lam12n1 ) ( * UndefCntr3_CT lam12n2 ) ( * Nl2CT1 lam12n3 ) ( * Nl2CT2 lam12n4 ) ( * Nl2CT3 lam12n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam12n0 ) ( * 1 lam12n1 ) ( * UndefCntr3_arg1 lam12n2 ) ( * Nl2arg11 lam12n3 ) ( * Nl2arg12 lam12n4 ) ( * Nl2arg13 lam12n5 ) ) 0 ) ( = ( + ( * UndefCntr3_arg2 lam12n2 ) ( * Nl2arg21 lam12n3 ) ( * Nl2arg22 lam12n4 ) ( * Nl2arg23 lam12n5 ) ) 0 ) ( = ( * UndefCntr3_undef4 lam12n2 ) 0 ) ) ( and ( >= lam14n0 0 ) ( >= lam14n1 0 ) ( >= lam14n2 0 ) ( >= lam14n3 0 ) ( >= lam14n4 0 ) ( >= lam14n5 0 ) ( > ( + ( * 10 lam14n0 ) ( * ( - 49 ) lam14n1 ) ( * UndefCntr3_CT lam14n2 ) ( * Nl2CT1 lam14n3 ) ( * Nl2CT2 lam14n4 ) ( * Nl2CT3 lam14n5 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2arg12 1 ) ) ( * Nl2arg22 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam14n0 ) ( * 1 lam14n1 ) ( * UndefCntr3_arg1 lam14n2 ) ( * Nl2arg11 lam14n3 ) ( * Nl2arg12 lam14n4 ) ( * Nl2arg13 lam14n5 ) ( - ( + 0 ( * Nl2arg12 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr3_arg2 lam14n2 ) ( * Nl2arg21 lam14n3 ) ( * Nl2arg22 lam14n4 ) ( * Nl2arg23 lam14n5 ) ) 0 ) ( = ( + ( * UndefCntr3_undef4 lam14n2 ) ( - ( + 0 ( * Nl2arg22 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( >= lam12n2 0 ) ( >= lam12n3 0 ) ( >= lam12n4 0 ) ( >= lam12n5 0 ) ( > ( + ( * 10 lam12n0 ) ( * ( - 49 ) lam12n1 ) ( * UndefCntr3_CT lam12n2 ) ( * Nl2CT1 lam12n3 ) ( * Nl2CT2 lam12n4 ) ( * Nl2CT3 lam12n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam12n0 ) ( * 1 lam12n1 ) ( * UndefCntr3_arg1 lam12n2 ) ( * Nl2arg11 lam12n3 ) ( * Nl2arg12 lam12n4 ) ( * Nl2arg13 lam12n5 ) ) 0 ) ( = ( + ( * UndefCntr3_arg2 lam12n2 ) ( * Nl2arg21 lam12n3 ) ( * Nl2arg22 lam12n4 ) ( * Nl2arg23 lam12n5 ) ) 0 ) ( = ( * UndefCntr3_undef4 lam12n2 ) 0 ) ) ( and ( >= lam15n0 0 ) ( >= lam15n1 0 ) ( >= lam15n2 0 ) ( >= lam15n3 0 ) ( >= lam15n4 0 ) ( >= lam15n5 0 ) ( > ( + ( * 10 lam15n0 ) ( * ( - 49 ) lam15n1 ) ( * UndefCntr3_CT lam15n2 ) ( * Nl2CT1 lam15n3 ) ( * Nl2CT2 lam15n4 ) ( * Nl2CT3 lam15n5 ) ( - 1 ( + ( + Nl2CT3 ( * Nl2arg13 1 ) ) ( * Nl2arg23 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam15n0 ) ( * 1 lam15n1 ) ( * UndefCntr3_arg1 lam15n2 ) ( * Nl2arg11 lam15n3 ) ( * Nl2arg12 lam15n4 ) ( * Nl2arg13 lam15n5 ) ( - ( + 0 ( * Nl2arg13 1 ) ) ) ) 0 ) ( = ( + ( * UndefCntr3_arg2 lam15n2 ) ( * Nl2arg21 lam15n3 ) ( * Nl2arg22 lam15n4 ) ( * Nl2arg23 lam15n5 ) ) 0 ) ( = ( + ( * UndefCntr3_undef4 lam15n2 ) ( - ( + 0 ( * Nl2arg23 1 ) ) ) ) 0 ) ) ))
(assert ( and ( = arg1 0 ) ( = ( + arg2 ( * ( - 1 ) undef2 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2arg11 ) arg1 ) ( * ( + 0 Nl2arg21 ) arg2 ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2arg12 ) arg1 ) ( * ( + 0 Nl2arg22 ) arg2 ) ) 0 ) ( <= ( + Nl2CT3 ( * ( + 0 Nl2arg13 ) arg1 ) ( * ( + 0 Nl2arg23 ) arg2 ) ) 0 ) ))
(assert ( or ( not ( = UndefCntr0_arg1 0 ) ) ( not ( = UndefCntr0_arg2 0 ) ) ( not ( = UndefCntr0_undef14 0 ) ) ( = UndefCntr0_CT 0 ) ))
(assert ( or ( and ( = UndefCntr0_arg1 0 ) ( = UndefCntr0_arg2 0 ) ) ( not ( = UndefCntr0_undef14 0 ) ) ))
(assert ( or ( not ( = UndefCntr3_arg1 0 ) ) ( not ( = UndefCntr3_arg2 0 ) ) ( not ( = UndefCntr3_undef4 0 ) ) ( = UndefCntr3_CT 0 ) ))
(assert ( or ( and ( = UndefCntr3_arg1 0 ) ( = UndefCntr3_arg2 0 ) ) ( not ( = UndefCntr3_undef4 0 ) ) ))
(assert ( and ( >= lam19n0 0 ) ( >= lam19n1 0 ) ( >= lam19n2 0 ) ( >= lam19n3 0 ) ( > ( + ( * 100 lam19n0 ) ( * Nl2CT1 lam19n1 ) ( * Nl2CT2 lam19n2 ) ( * Nl2CT3 lam19n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam19n0 ) ( * Nl2arg11 lam19n1 ) ( * Nl2arg12 lam19n2 ) ( * Nl2arg13 lam19n3 ) ) 0 ) ( = ( + ( * Nl2arg21 lam19n1 ) ( * Nl2arg22 lam19n2 ) ( * Nl2arg23 lam19n3 ) ) 0 ) ))
(assert ( and ( and ( <= ( + Nl2CT1 ( * Nl2arg11 FV_arg1_5 ) ( * Nl2arg21 FV_arg2_5 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2arg12 FV_arg1_5 ) ( * Nl2arg22 FV_arg2_5 ) ) 0 ) ( <= ( + Nl2CT3 ( * Nl2arg13 FV_arg1_5 ) ( * Nl2arg23 FV_arg2_5 ) ) 0 ) ) ( or ( <= ( + ( - 9 ) FV_arg1_5 ) 0 ) ( and ( <= ( + 10 ( * ( - 1 ) FV_arg1_5 ) ) 0 ) ( <= ( + ( - 49 ) FV_arg1_5 ) 0 ) ) ( and ( <= ( + 50 ( * ( - 1 ) FV_arg1_5 ) ) 0 ) ( <= ( + ( - 99 ) FV_arg1_5 ) 0 ) ) ) ))
(assert ( and ( and ( <= ( + Nl4CT1 ( * Nl4arg21 FV_arg2_4 ) ( * Nl4arg11 FV_arg1_4 ) ) 0 ) ( <= ( + Nl4CT2 ( * Nl4arg22 FV_arg2_4 ) ( * Nl4arg12 FV_arg1_4 ) ) 0 ) ( <= ( + Nl4CT3 ( * Nl4arg23 FV_arg2_4 ) ( * Nl4arg13 FV_arg1_4 ) ) 0 ) ) ( or ( <= ( + 15 ( * ( - 1 ) FV_arg2_4 ) ) 0 ) ( <= ( + ( - 14 ) FV_arg2_4 ) 0 ) ) ))
(assert ( and ( and ( <= ( + Nl2CT1 ( * Nl2arg11 FV_arg1_5 ) ( * Nl2arg21 FV_arg2_5 ) ) 0 ) ( <= ( + Nl2CT2 ( * Nl2arg12 FV_arg1_5 ) ( * Nl2arg22 FV_arg2_5 ) ) 0 ) ( <= ( + Nl2CT3 ( * Nl2arg13 FV_arg1_5 ) ( * Nl2arg23 FV_arg2_5 ) ) 0 ) ) ( and ( <= ( + 50 ( * ( - 1 ) FV_arg1_5 ) ) 0 ) ( <= ( + ( - 99 ) FV_arg1_5 ) 0 ) ) ))
(check-sat)
(exit)