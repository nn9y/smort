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
(declare-fun global_invc1_0 () Int)
(declare-fun global_invc1_1 () Int)
(declare-fun global_invc1_3 () Int)
(declare-fun global_invc1_4 () Int)
(declare-fun global_invc1_2 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n5 () Int)
(declare-fun lam0n2 () Int)
(declare-fun global_invc1_5 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n9 () Int)
(declare-fun lam1n10 () Int)
(declare-fun lam1n11 () Int)
(declare-fun lam1n12 () Int)
(declare-fun lam1n13 () Int)
(declare-fun lam1n14 () Int)
(declare-fun lam1n15 () Int)
(declare-fun lam1n16 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n6 () Int)
(declare-fun lam1n7 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam1n8 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n9 () Int)
(declare-fun lam2n10 () Int)
(declare-fun lam2n11 () Int)
(declare-fun lam2n12 () Int)
(declare-fun lam2n13 () Int)
(declare-fun lam2n14 () Int)
(declare-fun lam2n15 () Int)
(declare-fun lam2n16 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n6 () Int)
(declare-fun lam2n7 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam2n8 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n8 () Int)
(declare-fun lam3n9 () Int)
(declare-fun lam3n10 () Int)
(declare-fun lam3n11 () Int)
(declare-fun lam3n12 () Int)
(declare-fun lam3n13 () Int)
(declare-fun lam3n14 () Int)
(declare-fun lam3n15 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam3n5 () Int)
(declare-fun lam3n4 () Int)
(declare-fun lam3n6 () Int)
(declare-fun lam3n7 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam4n8 () Int)
(declare-fun lam4n9 () Int)
(declare-fun lam4n10 () Int)
(declare-fun lam4n11 () Int)
(declare-fun lam4n12 () Int)
(declare-fun lam4n13 () Int)
(declare-fun lam4n14 () Int)
(declare-fun lam4n15 () Int)
(declare-fun lam4n3 () Int)
(declare-fun lam4n5 () Int)
(declare-fun lam4n4 () Int)
(declare-fun lam4n6 () Int)
(declare-fun lam4n7 () Int)
(declare-fun term_invc1_0 () Int)
(declare-fun term_invc1_1 () Int)
(declare-fun term_invc1_3 () Int)
(declare-fun term_invc1_4 () Int)
(declare-fun term_invc1_2 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam5n8 () Int)
(declare-fun lam5n9 () Int)
(declare-fun lam5n10 () Int)
(declare-fun lam5n11 () Int)
(declare-fun lam5n12 () Int)
(declare-fun lam5n13 () Int)
(declare-fun lam5n14 () Int)
(declare-fun lam5n15 () Int)
(declare-fun lam5n16 () Int)
(declare-fun lam5n3 () Int)
(declare-fun lam5n5 () Int)
(declare-fun term_invc1_5 () Int)
(declare-fun lam5n4 () Int)
(declare-fun lam5n6 () Int)
(declare-fun lam5n7 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam6n2 () Int)
(declare-fun lam6n8 () Int)
(declare-fun lam6n9 () Int)
(declare-fun lam6n10 () Int)
(declare-fun lam6n11 () Int)
(declare-fun lam6n12 () Int)
(declare-fun lam6n13 () Int)
(declare-fun lam6n14 () Int)
(declare-fun lam6n15 () Int)
(declare-fun lam6n16 () Int)
(declare-fun lam6n3 () Int)
(declare-fun lam6n5 () Int)
(declare-fun lam6n4 () Int)
(declare-fun lam6n6 () Int)
(declare-fun lam6n7 () Int)
(declare-fun non_inc3 () Bool)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n8 () Int)
(declare-fun lam7n9 () Int)
(declare-fun lam7n10 () Int)
(declare-fun lam7n11 () Int)
(declare-fun lam7n12 () Int)
(declare-fun lam7n13 () Int)
(declare-fun lam7n14 () Int)
(declare-fun lam7n15 () Int)
(declare-fun lam7n16 () Int)
(declare-fun lam7n18 () Int)
(declare-fun lam7n17 () Int)
(declare-fun lam7n3 () Int)
(declare-fun lam7n5 () Int)
(declare-fun rfc0 () Int)
(declare-fun lam7n4 () Int)
(declare-fun rfc1 () Int)
(declare-fun rfc2 () Int)
(declare-fun lam7n6 () Int)
(declare-fun rfc3 () Int)
(declare-fun lam7n7 () Int)
(declare-fun rfc4 () Int)
(declare-fun disabled3 () Bool)
(declare-fun bounded3 () Bool)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n8 () Int)
(declare-fun lam8n9 () Int)
(declare-fun lam8n10 () Int)
(declare-fun lam8n11 () Int)
(declare-fun lam8n12 () Int)
(declare-fun lam8n13 () Int)
(declare-fun lam8n14 () Int)
(declare-fun lam8n15 () Int)
(declare-fun lam8n16 () Int)
(declare-fun lam8n17 () Int)
(declare-fun lam8n3 () Int)
(declare-fun lam8n5 () Int)
(declare-fun rfc5 () Int)
(declare-fun lam8n4 () Int)
(declare-fun lam8n6 () Int)
(declare-fun lam8n7 () Int)
(declare-fun dec3 () Bool)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam9n8 () Int)
(declare-fun lam9n9 () Int)
(declare-fun lam9n10 () Int)
(declare-fun lam9n11 () Int)
(declare-fun lam9n12 () Int)
(declare-fun lam9n13 () Int)
(declare-fun lam9n14 () Int)
(declare-fun lam9n15 () Int)
(declare-fun lam9n16 () Int)
(declare-fun lam9n17 () Int)
(declare-fun lam9n3 () Int)
(declare-fun lam9n5 () Int)
(declare-fun lam9n4 () Int)
(declare-fun lam9n6 () Int)
(declare-fun lam9n7 () Int)
(declare-fun bnd_and_dec3 () Bool)
(declare-fun non_inc4 () Bool)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n8 () Int)
(declare-fun lam10n9 () Int)
(declare-fun lam10n10 () Int)
(declare-fun lam10n11 () Int)
(declare-fun lam10n12 () Int)
(declare-fun lam10n13 () Int)
(declare-fun lam10n14 () Int)
(declare-fun lam10n15 () Int)
(declare-fun lam10n16 () Int)
(declare-fun lam10n18 () Int)
(declare-fun lam10n17 () Int)
(declare-fun lam10n3 () Int)
(declare-fun lam10n5 () Int)
(declare-fun lam10n4 () Int)
(declare-fun lam10n6 () Int)
(declare-fun lam10n7 () Int)
(declare-fun disabled4 () Bool)
(declare-fun bounded4 () Bool)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam11n2 () Int)
(declare-fun lam11n8 () Int)
(declare-fun lam11n9 () Int)
(declare-fun lam11n10 () Int)
(declare-fun lam11n11 () Int)
(declare-fun lam11n12 () Int)
(declare-fun lam11n13 () Int)
(declare-fun lam11n14 () Int)
(declare-fun lam11n15 () Int)
(declare-fun lam11n16 () Int)
(declare-fun lam11n17 () Int)
(declare-fun lam11n3 () Int)
(declare-fun lam11n5 () Int)
(declare-fun lam11n4 () Int)
(declare-fun lam11n6 () Int)
(declare-fun lam11n7 () Int)
(declare-fun dec4 () Bool)
(declare-fun lam12n0 () Int)
(declare-fun lam12n1 () Int)
(declare-fun lam12n2 () Int)
(declare-fun lam12n8 () Int)
(declare-fun lam12n9 () Int)
(declare-fun lam12n10 () Int)
(declare-fun lam12n11 () Int)
(declare-fun lam12n12 () Int)
(declare-fun lam12n13 () Int)
(declare-fun lam12n14 () Int)
(declare-fun lam12n15 () Int)
(declare-fun lam12n16 () Int)
(declare-fun lam12n17 () Int)
(declare-fun lam12n3 () Int)
(declare-fun lam12n5 () Int)
(declare-fun lam12n4 () Int)
(declare-fun lam12n6 () Int)
(declare-fun lam12n7 () Int)
(declare-fun bnd_and_dec4 () Bool)
(declare-fun GLOBAL_NT_1 () Bool)
(declare-fun global_V0_1 () Int)
(declare-fun global_V1_1 () Int)
(declare-fun global_V2_1 () Int)
(declare-fun global_V3_1 () Int)
(declare-fun global_V4_1 () Int)
(declare-fun TERM_NT_1 () Bool)
(declare-fun term_V0_1 () Int)
(declare-fun term_V1_1 () Int)
(declare-fun term_V2_1 () Int)
(declare-fun term_V3_1 () Int)
(declare-fun term_V4_1 () Int)
(declare-fun ALL_NON_INC_0 () Bool)
(declare-fun DIS_OR_ALL_NON_INC_0 () Bool)
(declare-fun SOME_BND_AND_DEC_0 () Bool)
(declare-fun V2_NIV () Int)
(declare-fun V3_NIV () Int)
(declare-fun V4_NIV () Int)
(declare-fun V1_NIV () Int)
(declare-fun V0_NIV () Int)
(declare-fun V7_NIV () Int)
(declare-fun V8_NIV () Int)
(declare-fun V9_NIV () Int)
(declare-fun V6_NIV () Int)
(declare-fun V5_NIV () Int)
(assert ( and ( >= global_invc1_0 ( - 1 ) ) ( <= global_invc1_0 1 ) ( >= global_invc1_1 ( - 1 ) ) ( <= global_invc1_1 1 ) ( >= global_invc1_3 ( - 1 ) ) ( <= global_invc1_3 1 ) ( >= global_invc1_4 ( - 1 ) ) ( <= global_invc1_4 1 ) ( >= global_invc1_2 ( - 1 ) ) ( <= global_invc1_2 1 ) ( and ( >= lam0n0 0 ) ( <= 0 lam0n5 ) ( < lam0n5 1 ) ( and ( = ( + ( * ( - 1 ) lam0n0 ) ( * lam0n2 1 ) ) ( + global_invc1_5 ( * ( - 1 ) lam0n5 ) ) ) ( = ( * lam0n1 1 ) 0 ) ( = ( * lam0n4 1 ) 0 ) ( = ( * lam0n1 ( - 1 ) ) global_invc1_1 ) ( = ( * lam0n2 ( - 1 ) ) global_invc1_2 ) ( = ( * lam0n3 ( - 1 ) ) global_invc1_3 ) ( = ( * lam0n4 ( - 1 ) ) global_invc1_4 ) ( = 0 global_invc1_0 ) ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( >= lam1n9 0 ) ( >= lam1n10 0 ) ( >= lam1n11 0 ) ( >= lam1n12 0 ) ( >= lam1n13 0 ) ( >= lam1n14 0 ) ( >= lam1n15 0 ) ( <= 0 lam1n16 ) ( < lam1n16 1 ) ( and ( = ( + ( * ( - 1 ) lam1n0 ) ( * lam1n2 1 ) ( * lam1n3 ( - 100 ) ) ( * lam1n4 11 ) ( * lam1n6 1 ) ( * lam1n7 1 ) ( * lam1n9 ( - 1 ) ) ( * lam1n10 ( - 1 ) ) ( * lam1n11 ( - 1 ) ) ( * lam1n12 ( - 1 ) ) ( * lam1n15 global_invc1_5 ) ) ( + global_invc1_5 ( * ( - 1 ) lam1n16 ) ) ) ( = ( + ( * lam1n3 1 ) ( * lam1n4 1 ) ( * lam1n5 1 ) ( * lam1n15 global_invc1_0 ) ) 0 ) ( = ( * lam1n15 global_invc1_1 ) 0 ) ( = ( + ( * lam1n2 ( - 1 ) ) ( * lam1n6 1 ) ( * lam1n8 1 ) ( * lam1n10 ( - 1 ) ) ( * lam1n12 ( - 1 ) ) ( * lam1n13 ( - 1 ) ) ( * lam1n15 global_invc1_2 ) ) 0 ) ( = ( + ( * lam1n1 1 ) ( * lam1n9 ( - 1 ) ) ( * lam1n11 1 ) ( * lam1n12 1 ) ( * lam1n14 ( - 1 ) ) ( * lam1n15 global_invc1_3 ) ) 0 ) ( = ( * lam1n15 global_invc1_4 ) 0 ) ( = ( * lam1n4 ( - 1 ) ) global_invc1_0 ) ( = ( * lam1n5 ( - 1 ) ) global_invc1_1 ) ( = ( * lam1n6 ( - 1 ) ) global_invc1_2 ) ( = ( * lam1n7 ( - 1 ) ) global_invc1_3 ) ( = ( * lam1n8 ( - 1 ) ) global_invc1_4 ) ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( >= lam2n9 0 ) ( >= lam2n10 0 ) ( >= lam2n11 0 ) ( >= lam2n12 0 ) ( >= lam2n13 0 ) ( >= lam2n14 0 ) ( >= lam2n15 0 ) ( <= 0 lam2n16 ) ( < lam2n16 1 ) ( and ( = ( + ( * ( - 1 ) lam2n0 ) ( * lam2n2 1 ) ( * lam2n3 101 ) ( * lam2n4 ( - 10 ) ) ( * lam2n6 ( - 1 ) ) ( * lam2n7 1 ) ( * lam2n9 ( - 1 ) ) ( * lam2n10 ( - 1 ) ) ( * lam2n11 ( - 1 ) ) ( * lam2n12 ( - 1 ) ) ( * lam2n15 global_invc1_5 ) ) ( + global_invc1_5 ( * ( - 1 ) lam2n16 ) ) ) ( = ( + ( * lam2n3 ( - 1 ) ) ( * lam2n4 1 ) ( * lam2n5 1 ) ( * lam2n15 global_invc1_0 ) ) 0 ) ( = ( * lam2n15 global_invc1_1 ) 0 ) ( = ( + ( * lam2n2 ( - 1 ) ) ( * lam2n6 1 ) ( * lam2n8 1 ) ( * lam2n10 ( - 1 ) ) ( * lam2n12 ( - 1 ) ) ( * lam2n13 ( - 1 ) ) ( * lam2n15 global_invc1_2 ) ) 0 ) ( = ( + ( * lam2n1 1 ) ( * lam2n9 ( - 1 ) ) ( * lam2n11 1 ) ( * lam2n12 1 ) ( * lam2n14 ( - 1 ) ) ( * lam2n15 global_invc1_3 ) ) 0 ) ( = ( * lam2n15 global_invc1_4 ) 0 ) ( = ( * lam2n4 ( - 1 ) ) global_invc1_0 ) ( = ( * lam2n5 ( - 1 ) ) global_invc1_1 ) ( = ( * lam2n6 ( - 1 ) ) global_invc1_2 ) ( = ( * lam2n7 ( - 1 ) ) global_invc1_3 ) ( = ( * lam2n8 ( - 1 ) ) global_invc1_4 ) ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n8 0 ) ( >= lam3n9 0 ) ( >= lam3n10 0 ) ( >= lam3n11 0 ) ( >= lam3n12 0 ) ( >= lam3n13 0 ) ( >= lam3n14 0 ) ( <= 0 lam3n15 ) ( < lam3n15 1 ) ( and ( = ( + ( * ( - 1 ) lam3n0 ) ( * lam3n1 1 ) ( * lam3n2 ( - 100 ) ) ( * lam3n3 11 ) ( * lam3n5 1 ) ( * lam3n8 ( - 1 ) ) ( * lam3n9 ( - 1 ) ) ( * lam3n10 ( - 1 ) ) ( * lam3n11 ( - 1 ) ) ( * lam3n14 global_invc1_5 ) ) ( + global_invc1_5 ( * ( - 1 ) lam3n15 ) ) ) ( = ( + ( * lam3n2 1 ) ( * lam3n3 1 ) ( * lam3n14 global_invc1_0 ) ) 0 ) ( = ( + ( * lam3n4 1 ) ( * lam3n14 global_invc1_1 ) ) 0 ) ( = ( + ( * lam3n1 ( - 1 ) ) ( * lam3n5 1 ) ( * lam3n9 ( - 1 ) ) ( * lam3n11 ( - 1 ) ) ( * lam3n12 ( - 1 ) ) ( * lam3n14 global_invc1_2 ) ) 0 ) ( = ( + ( * lam3n6 1 ) ( * lam3n8 ( - 1 ) ) ( * lam3n10 1 ) ( * lam3n11 1 ) ( * lam3n13 ( - 1 ) ) ( * lam3n14 global_invc1_3 ) ) 0 ) ( = ( + ( * lam3n7 1 ) ( * lam3n14 global_invc1_4 ) ) 0 ) ( = ( * lam3n3 ( - 1 ) ) global_invc1_0 ) ( = ( * lam3n4 ( - 1 ) ) global_invc1_1 ) ( = ( * lam3n5 ( - 1 ) ) global_invc1_2 ) ( = ( * lam3n6 ( - 1 ) ) global_invc1_3 ) ( = ( * lam3n7 ( - 1 ) ) global_invc1_4 ) ) ) ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n8 0 ) ( >= lam4n9 0 ) ( >= lam4n10 0 ) ( >= lam4n11 0 ) ( >= lam4n12 0 ) ( >= lam4n13 0 ) ( >= lam4n14 0 ) ( <= 0 lam4n15 ) ( < lam4n15 1 ) ( and ( = ( + ( * ( - 1 ) lam4n0 ) ( * lam4n1 1 ) ( * lam4n2 101 ) ( * lam4n3 ( - 10 ) ) ( * lam4n5 ( - 1 ) ) ( * lam4n8 ( - 1 ) ) ( * lam4n9 ( - 1 ) ) ( * lam4n10 ( - 1 ) ) ( * lam4n11 ( - 1 ) ) ( * lam4n14 global_invc1_5 ) ) ( + global_invc1_5 ( * ( - 1 ) lam4n15 ) ) ) ( = ( + ( * lam4n2 ( - 1 ) ) ( * lam4n3 1 ) ( * lam4n14 global_invc1_0 ) ) 0 ) ( = ( + ( * lam4n4 1 ) ( * lam4n14 global_invc1_1 ) ) 0 ) ( = ( + ( * lam4n1 ( - 1 ) ) ( * lam4n5 1 ) ( * lam4n9 ( - 1 ) ) ( * lam4n11 ( - 1 ) ) ( * lam4n12 ( - 1 ) ) ( * lam4n14 global_invc1_2 ) ) 0 ) ( = ( + ( * lam4n6 1 ) ( * lam4n8 ( - 1 ) ) ( * lam4n10 1 ) ( * lam4n11 1 ) ( * lam4n13 ( - 1 ) ) ( * lam4n14 global_invc1_3 ) ) 0 ) ( = ( + ( * lam4n7 1 ) ( * lam4n14 global_invc1_4 ) ) 0 ) ( = ( * lam4n3 ( - 1 ) ) global_invc1_0 ) ( = ( * lam4n4 ( - 1 ) ) global_invc1_1 ) ( = ( * lam4n5 ( - 1 ) ) global_invc1_2 ) ( = ( * lam4n6 ( - 1 ) ) global_invc1_3 ) ( = ( * lam4n7 ( - 1 ) ) global_invc1_4 ) ) ) ( >= term_invc1_0 ( - 1 ) ) ( <= term_invc1_0 1 ) ( >= term_invc1_1 ( - 1 ) ) ( <= term_invc1_1 1 ) ( >= term_invc1_3 ( - 1 ) ) ( <= term_invc1_3 1 ) ( >= term_invc1_4 ( - 1 ) ) ( <= term_invc1_4 1 ) ( >= term_invc1_2 ( - 1 ) ) ( <= term_invc1_2 1 ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n8 0 ) ( >= lam5n9 0 ) ( >= lam5n10 0 ) ( >= lam5n11 0 ) ( >= lam5n12 0 ) ( >= lam5n13 0 ) ( >= lam5n14 0 ) ( >= lam5n15 0 ) ( <= 0 lam5n16 ) ( < lam5n16 1 ) ( and ( = ( + ( * ( - 1 ) lam5n0 ) ( * lam5n1 1 ) ( * lam5n2 ( - 100 ) ) ( * lam5n3 11 ) ( * lam5n5 1 ) ( * lam5n8 ( - 1 ) ) ( * lam5n9 ( - 1 ) ) ( * lam5n10 ( - 1 ) ) ( * lam5n11 ( - 1 ) ) ( * lam5n14 ( - 1 ) ) ( * lam5n15 global_invc1_5 ) ) ( + term_invc1_5 ( * ( - 1 ) lam5n16 ) ) ) ( = ( + ( * lam5n2 1 ) ( * lam5n3 1 ) ( * lam5n15 global_invc1_0 ) ) 0 ) ( = ( + ( * lam5n4 1 ) ( * lam5n15 global_invc1_1 ) ) 0 ) ( = ( + ( * lam5n1 ( - 1 ) ) ( * lam5n5 1 ) ( * lam5n9 ( - 1 ) ) ( * lam5n11 ( - 1 ) ) ( * lam5n12 ( - 1 ) ) ( * lam5n14 ( - 1 ) ) ( * lam5n15 global_invc1_2 ) ) 0 ) ( = ( + ( * lam5n6 1 ) ( * lam5n8 ( - 1 ) ) ( * lam5n10 1 ) ( * lam5n11 1 ) ( * lam5n13 ( - 1 ) ) ( * lam5n14 ( - 1 ) ) ( * lam5n15 global_invc1_3 ) ) 0 ) ( = ( + ( * lam5n7 1 ) ( * lam5n15 global_invc1_4 ) ) 0 ) ( = ( * lam5n3 ( - 1 ) ) term_invc1_0 ) ( = ( * lam5n4 ( - 1 ) ) term_invc1_1 ) ( = ( * lam5n5 ( - 1 ) ) term_invc1_2 ) ( = ( * lam5n6 ( - 1 ) ) term_invc1_3 ) ( = ( * lam5n7 ( - 1 ) ) term_invc1_4 ) ) ) ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( >= lam6n8 0 ) ( >= lam6n9 0 ) ( >= lam6n10 0 ) ( >= lam6n11 0 ) ( >= lam6n12 0 ) ( >= lam6n13 0 ) ( >= lam6n14 0 ) ( >= lam6n15 0 ) ( <= 0 lam6n16 ) ( < lam6n16 1 ) ( and ( = ( + ( * ( - 1 ) lam6n0 ) ( * lam6n1 1 ) ( * lam6n2 101 ) ( * lam6n3 ( - 10 ) ) ( * lam6n5 ( - 1 ) ) ( * lam6n8 ( - 1 ) ) ( * lam6n9 ( - 1 ) ) ( * lam6n10 ( - 1 ) ) ( * lam6n11 ( - 1 ) ) ( * lam6n14 ( - 1 ) ) ( * lam6n15 global_invc1_5 ) ) ( + term_invc1_5 ( * ( - 1 ) lam6n16 ) ) ) ( = ( + ( * lam6n2 ( - 1 ) ) ( * lam6n3 1 ) ( * lam6n15 global_invc1_0 ) ) 0 ) ( = ( + ( * lam6n4 1 ) ( * lam6n15 global_invc1_1 ) ) 0 ) ( = ( + ( * lam6n1 ( - 1 ) ) ( * lam6n5 1 ) ( * lam6n9 ( - 1 ) ) ( * lam6n11 ( - 1 ) ) ( * lam6n12 ( - 1 ) ) ( * lam6n14 ( - 1 ) ) ( * lam6n15 global_invc1_2 ) ) 0 ) ( = ( + ( * lam6n6 1 ) ( * lam6n8 ( - 1 ) ) ( * lam6n10 1 ) ( * lam6n11 1 ) ( * lam6n13 ( - 1 ) ) ( * lam6n14 ( - 1 ) ) ( * lam6n15 global_invc1_3 ) ) 0 ) ( = ( + ( * lam6n7 1 ) ( * lam6n15 global_invc1_4 ) ) 0 ) ( = ( * lam6n3 ( - 1 ) ) term_invc1_0 ) ( = ( * lam6n4 ( - 1 ) ) term_invc1_1 ) ( = ( * lam6n5 ( - 1 ) ) term_invc1_2 ) ( = ( * lam6n6 ( - 1 ) ) term_invc1_3 ) ( = ( * lam6n7 ( - 1 ) ) term_invc1_4 ) ) ) ( = non_inc3 ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n8 0 ) ( >= lam7n9 0 ) ( >= lam7n10 0 ) ( >= lam7n11 0 ) ( >= lam7n12 0 ) ( >= lam7n13 0 ) ( >= lam7n14 0 ) ( >= lam7n15 0 ) ( >= lam7n16 0 ) ( <= 0 lam7n18 ) ( < lam7n18 1 ) ( <= lam7n17 1 ) ( >= lam7n17 0 ) ( and ( > ( + ( * ( - 1 ) lam7n0 ) ( * lam7n1 1 ) ( * lam7n2 ( - 100 ) ) ( * lam7n3 11 ) ( * lam7n5 1 ) ( * lam7n8 ( - 1 ) ) ( * lam7n9 ( - 1 ) ) ( * lam7n10 ( - 1 ) ) ( * lam7n11 ( - 1 ) ) ( * lam7n14 ( - 1 ) ) ( * lam7n15 global_invc1_5 ) ( * lam7n16 term_invc1_5 ) ( * lam7n17 ( + 1 ( * ( - 1 ) lam7n18 ) ) ) ) 0 ) ( = ( + ( * lam7n2 1 ) ( * lam7n3 1 ) ( * lam7n15 global_invc1_0 ) ( * lam7n16 term_invc1_0 ) ( * lam7n17 rfc0 ) ) 0 ) ( = ( + ( * lam7n4 1 ) ( * lam7n15 global_invc1_1 ) ( * lam7n16 term_invc1_1 ) ( * lam7n17 rfc1 ) ) 0 ) ( = ( + ( * lam7n1 ( - 1 ) ) ( * lam7n5 1 ) ( * lam7n9 ( - 1 ) ) ( * lam7n11 ( - 1 ) ) ( * lam7n12 ( - 1 ) ) ( * lam7n14 ( - 1 ) ) ( * lam7n15 global_invc1_2 ) ( * lam7n16 term_invc1_2 ) ( * lam7n17 rfc2 ) ) 0 ) ( = ( + ( * lam7n6 1 ) ( * lam7n8 ( - 1 ) ) ( * lam7n10 1 ) ( * lam7n11 1 ) ( * lam7n13 ( - 1 ) ) ( * lam7n14 ( - 1 ) ) ( * lam7n15 global_invc1_3 ) ( * lam7n16 term_invc1_3 ) ( * lam7n17 rfc3 ) ) 0 ) ( = ( + ( * lam7n7 1 ) ( * lam7n15 global_invc1_4 ) ( * lam7n16 term_invc1_4 ) ( * lam7n17 rfc4 ) ) 0 ) ( = ( + ( * lam7n3 ( - 1 ) ) ( * lam7n17 ( * ( - 1 ) rfc0 ) ) ) 0 ) ( = ( + ( * lam7n4 ( - 1 ) ) ( * lam7n17 ( * ( - 1 ) rfc1 ) ) ) 0 ) ( = ( + ( * lam7n5 ( - 1 ) ) ( * lam7n17 ( * ( - 1 ) rfc2 ) ) ) 0 ) ( = ( + ( * lam7n6 ( - 1 ) ) ( * lam7n17 ( * ( - 1 ) rfc3 ) ) ) 0 ) ( = ( + ( * lam7n7 ( - 1 ) ) ( * lam7n17 ( * ( - 1 ) rfc4 ) ) ) 0 ) ) ) ) ( = disabled3 ( and ( = lam7n17 0 ) non_inc3 ) ) ( = bounded3 ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n8 0 ) ( >= lam8n9 0 ) ( >= lam8n10 0 ) ( >= lam8n11 0 ) ( >= lam8n12 0 ) ( >= lam8n13 0 ) ( >= lam8n14 0 ) ( >= lam8n15 0 ) ( >= lam8n16 0 ) ( <= 0 lam8n17 ) ( < lam8n17 1 ) ( and ( = ( + ( * ( - 1 ) lam8n0 ) ( * lam8n1 1 ) ( * lam8n2 ( - 100 ) ) ( * lam8n3 11 ) ( * lam8n5 1 ) ( * lam8n8 ( - 1 ) ) ( * lam8n9 ( - 1 ) ) ( * lam8n10 ( - 1 ) ) ( * lam8n11 ( - 1 ) ) ( * lam8n14 ( - 1 ) ) ( * lam8n15 global_invc1_5 ) ( * lam8n16 term_invc1_5 ) ) ( + ( * ( - 1 ) rfc5 ) ( * ( - 1 ) lam8n17 ) ) ) ( = ( + ( * lam8n2 1 ) ( * lam8n3 1 ) ( * lam8n15 global_invc1_0 ) ( * lam8n16 term_invc1_0 ) ) ( * ( - 1 ) rfc0 ) ) ( = ( + ( * lam8n4 1 ) ( * lam8n15 global_invc1_1 ) ( * lam8n16 term_invc1_1 ) ) ( * ( - 1 ) rfc1 ) ) ( = ( + ( * lam8n1 ( - 1 ) ) ( * lam8n5 1 ) ( * lam8n9 ( - 1 ) ) ( * lam8n11 ( - 1 ) ) ( * lam8n12 ( - 1 ) ) ( * lam8n14 ( - 1 ) ) ( * lam8n15 global_invc1_2 ) ( * lam8n16 term_invc1_2 ) ) ( * ( - 1 ) rfc2 ) ) ( = ( + ( * lam8n6 1 ) ( * lam8n8 ( - 1 ) ) ( * lam8n10 1 ) ( * lam8n11 1 ) ( * lam8n13 ( - 1 ) ) ( * lam8n14 ( - 1 ) ) ( * lam8n15 global_invc1_3 ) ( * lam8n16 term_invc1_3 ) ) ( * ( - 1 ) rfc3 ) ) ( = ( + ( * lam8n7 1 ) ( * lam8n15 global_invc1_4 ) ( * lam8n16 term_invc1_4 ) ) ( * ( - 1 ) rfc4 ) ) ( = ( * lam8n3 ( - 1 ) ) 0 ) ( = ( * lam8n4 ( - 1 ) ) 0 ) ( = ( * lam8n5 ( - 1 ) ) 0 ) ( = ( * lam8n6 ( - 1 ) ) 0 ) ( = ( * lam8n7 ( - 1 ) ) 0 ) ) ) ) ( = dec3 ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( >= lam9n8 0 ) ( >= lam9n9 0 ) ( >= lam9n10 0 ) ( >= lam9n11 0 ) ( >= lam9n12 0 ) ( >= lam9n13 0 ) ( >= lam9n14 0 ) ( >= lam9n15 0 ) ( >= lam9n16 0 ) ( <= 0 lam9n17 ) ( < lam9n17 1 ) ( and ( = ( + ( * ( - 1 ) lam9n0 ) ( * lam9n1 1 ) ( * lam9n2 ( - 100 ) ) ( * lam9n3 11 ) ( * lam9n5 1 ) ( * lam9n8 ( - 1 ) ) ( * lam9n9 ( - 1 ) ) ( * lam9n10 ( - 1 ) ) ( * lam9n11 ( - 1 ) ) ( * lam9n14 ( - 1 ) ) ( * lam9n15 global_invc1_5 ) ( * lam9n16 term_invc1_5 ) ) ( + 1 ( * ( - 1 ) lam9n17 ) ) ) ( = ( + ( * lam9n2 1 ) ( * lam9n3 1 ) ( * lam9n15 global_invc1_0 ) ( * lam9n16 term_invc1_0 ) ) ( * ( - 1 ) rfc0 ) ) ( = ( + ( * lam9n4 1 ) ( * lam9n15 global_invc1_1 ) ( * lam9n16 term_invc1_1 ) ) ( * ( - 1 ) rfc1 ) ) ( = ( + ( * lam9n1 ( - 1 ) ) ( * lam9n5 1 ) ( * lam9n9 ( - 1 ) ) ( * lam9n11 ( - 1 ) ) ( * lam9n12 ( - 1 ) ) ( * lam9n14 ( - 1 ) ) ( * lam9n15 global_invc1_2 ) ( * lam9n16 term_invc1_2 ) ) ( * ( - 1 ) rfc2 ) ) ( = ( + ( * lam9n6 1 ) ( * lam9n8 ( - 1 ) ) ( * lam9n10 1 ) ( * lam9n11 1 ) ( * lam9n13 ( - 1 ) ) ( * lam9n14 ( - 1 ) ) ( * lam9n15 global_invc1_3 ) ( * lam9n16 term_invc1_3 ) ) ( * ( - 1 ) rfc3 ) ) ( = ( + ( * lam9n7 1 ) ( * lam9n15 global_invc1_4 ) ( * lam9n16 term_invc1_4 ) ) ( * ( - 1 ) rfc4 ) ) ( = ( * lam9n3 ( - 1 ) ) rfc0 ) ( = ( * lam9n4 ( - 1 ) ) rfc1 ) ( = ( * lam9n5 ( - 1 ) ) rfc2 ) ( = ( * lam9n6 ( - 1 ) ) rfc3 ) ( = ( * lam9n7 ( - 1 ) ) rfc4 ) ) ) ) ( = bnd_and_dec3 ( and bounded3 dec3 ) ) ( = non_inc4 ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( >= lam10n8 0 ) ( >= lam10n9 0 ) ( >= lam10n10 0 ) ( >= lam10n11 0 ) ( >= lam10n12 0 ) ( >= lam10n13 0 ) ( >= lam10n14 0 ) ( >= lam10n15 0 ) ( >= lam10n16 0 ) ( <= 0 lam10n18 ) ( < lam10n18 1 ) ( <= lam10n17 1 ) ( >= lam10n17 0 ) ( and ( > ( + ( * ( - 1 ) lam10n0 ) ( * lam10n1 1 ) ( * lam10n2 101 ) ( * lam10n3 ( - 10 ) ) ( * lam10n5 ( - 1 ) ) ( * lam10n8 ( - 1 ) ) ( * lam10n9 ( - 1 ) ) ( * lam10n10 ( - 1 ) ) ( * lam10n11 ( - 1 ) ) ( * lam10n14 ( - 1 ) ) ( * lam10n15 global_invc1_5 ) ( * lam10n16 term_invc1_5 ) ( * lam10n17 ( + 1 ( * ( - 1 ) lam10n18 ) ) ) ) 0 ) ( = ( + ( * lam10n2 ( - 1 ) ) ( * lam10n3 1 ) ( * lam10n15 global_invc1_0 ) ( * lam10n16 term_invc1_0 ) ( * lam10n17 rfc0 ) ) 0 ) ( = ( + ( * lam10n4 1 ) ( * lam10n15 global_invc1_1 ) ( * lam10n16 term_invc1_1 ) ( * lam10n17 rfc1 ) ) 0 ) ( = ( + ( * lam10n1 ( - 1 ) ) ( * lam10n5 1 ) ( * lam10n9 ( - 1 ) ) ( * lam10n11 ( - 1 ) ) ( * lam10n12 ( - 1 ) ) ( * lam10n14 ( - 1 ) ) ( * lam10n15 global_invc1_2 ) ( * lam10n16 term_invc1_2 ) ( * lam10n17 rfc2 ) ) 0 ) ( = ( + ( * lam10n6 1 ) ( * lam10n8 ( - 1 ) ) ( * lam10n10 1 ) ( * lam10n11 1 ) ( * lam10n13 ( - 1 ) ) ( * lam10n14 ( - 1 ) ) ( * lam10n15 global_invc1_3 ) ( * lam10n16 term_invc1_3 ) ( * lam10n17 rfc3 ) ) 0 ) ( = ( + ( * lam10n7 1 ) ( * lam10n15 global_invc1_4 ) ( * lam10n16 term_invc1_4 ) ( * lam10n17 rfc4 ) ) 0 ) ( = ( + ( * lam10n3 ( - 1 ) ) ( * lam10n17 ( * ( - 1 ) rfc0 ) ) ) 0 ) ( = ( + ( * lam10n4 ( - 1 ) ) ( * lam10n17 ( * ( - 1 ) rfc1 ) ) ) 0 ) ( = ( + ( * lam10n5 ( - 1 ) ) ( * lam10n17 ( * ( - 1 ) rfc2 ) ) ) 0 ) ( = ( + ( * lam10n6 ( - 1 ) ) ( * lam10n17 ( * ( - 1 ) rfc3 ) ) ) 0 ) ( = ( + ( * lam10n7 ( - 1 ) ) ( * lam10n17 ( * ( - 1 ) rfc4 ) ) ) 0 ) ) ) ) ( = disabled4 ( and ( = lam10n17 0 ) non_inc4 ) ) ( = bounded4 ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( >= lam11n8 0 ) ( >= lam11n9 0 ) ( >= lam11n10 0 ) ( >= lam11n11 0 ) ( >= lam11n12 0 ) ( >= lam11n13 0 ) ( >= lam11n14 0 ) ( >= lam11n15 0 ) ( >= lam11n16 0 ) ( <= 0 lam11n17 ) ( < lam11n17 1 ) ( and ( = ( + ( * ( - 1 ) lam11n0 ) ( * lam11n1 1 ) ( * lam11n2 101 ) ( * lam11n3 ( - 10 ) ) ( * lam11n5 ( - 1 ) ) ( * lam11n8 ( - 1 ) ) ( * lam11n9 ( - 1 ) ) ( * lam11n10 ( - 1 ) ) ( * lam11n11 ( - 1 ) ) ( * lam11n14 ( - 1 ) ) ( * lam11n15 global_invc1_5 ) ( * lam11n16 term_invc1_5 ) ) ( + ( * ( - 1 ) rfc5 ) ( * ( - 1 ) lam11n17 ) ) ) ( = ( + ( * lam11n2 ( - 1 ) ) ( * lam11n3 1 ) ( * lam11n15 global_invc1_0 ) ( * lam11n16 term_invc1_0 ) ) ( * ( - 1 ) rfc0 ) ) ( = ( + ( * lam11n4 1 ) ( * lam11n15 global_invc1_1 ) ( * lam11n16 term_invc1_1 ) ) ( * ( - 1 ) rfc1 ) ) ( = ( + ( * lam11n1 ( - 1 ) ) ( * lam11n5 1 ) ( * lam11n9 ( - 1 ) ) ( * lam11n11 ( - 1 ) ) ( * lam11n12 ( - 1 ) ) ( * lam11n14 ( - 1 ) ) ( * lam11n15 global_invc1_2 ) ( * lam11n16 term_invc1_2 ) ) ( * ( - 1 ) rfc2 ) ) ( = ( + ( * lam11n6 1 ) ( * lam11n8 ( - 1 ) ) ( * lam11n10 1 ) ( * lam11n11 1 ) ( * lam11n13 ( - 1 ) ) ( * lam11n14 ( - 1 ) ) ( * lam11n15 global_invc1_3 ) ( * lam11n16 term_invc1_3 ) ) ( * ( - 1 ) rfc3 ) ) ( = ( + ( * lam11n7 1 ) ( * lam11n15 global_invc1_4 ) ( * lam11n16 term_invc1_4 ) ) ( * ( - 1 ) rfc4 ) ) ( = ( * lam11n3 ( - 1 ) ) 0 ) ( = ( * lam11n4 ( - 1 ) ) 0 ) ( = ( * lam11n5 ( - 1 ) ) 0 ) ( = ( * lam11n6 ( - 1 ) ) 0 ) ( = ( * lam11n7 ( - 1 ) ) 0 ) ) ) ) ( = dec4 ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( >= lam12n2 0 ) ( >= lam12n8 0 ) ( >= lam12n9 0 ) ( >= lam12n10 0 ) ( >= lam12n11 0 ) ( >= lam12n12 0 ) ( >= lam12n13 0 ) ( >= lam12n14 0 ) ( >= lam12n15 0 ) ( >= lam12n16 0 ) ( <= 0 lam12n17 ) ( < lam12n17 1 ) ( and ( = ( + ( * ( - 1 ) lam12n0 ) ( * lam12n1 1 ) ( * lam12n2 101 ) ( * lam12n3 ( - 10 ) ) ( * lam12n5 ( - 1 ) ) ( * lam12n8 ( - 1 ) ) ( * lam12n9 ( - 1 ) ) ( * lam12n10 ( - 1 ) ) ( * lam12n11 ( - 1 ) ) ( * lam12n14 ( - 1 ) ) ( * lam12n15 global_invc1_5 ) ( * lam12n16 term_invc1_5 ) ) ( + 1 ( * ( - 1 ) lam12n17 ) ) ) ( = ( + ( * lam12n2 ( - 1 ) ) ( * lam12n3 1 ) ( * lam12n15 global_invc1_0 ) ( * lam12n16 term_invc1_0 ) ) ( * ( - 1 ) rfc0 ) ) ( = ( + ( * lam12n4 1 ) ( * lam12n15 global_invc1_1 ) ( * lam12n16 term_invc1_1 ) ) ( * ( - 1 ) rfc1 ) ) ( = ( + ( * lam12n1 ( - 1 ) ) ( * lam12n5 1 ) ( * lam12n9 ( - 1 ) ) ( * lam12n11 ( - 1 ) ) ( * lam12n12 ( - 1 ) ) ( * lam12n14 ( - 1 ) ) ( * lam12n15 global_invc1_2 ) ( * lam12n16 term_invc1_2 ) ) ( * ( - 1 ) rfc2 ) ) ( = ( + ( * lam12n6 1 ) ( * lam12n8 ( - 1 ) ) ( * lam12n10 1 ) ( * lam12n11 1 ) ( * lam12n13 ( - 1 ) ) ( * lam12n14 ( - 1 ) ) ( * lam12n15 global_invc1_3 ) ( * lam12n16 term_invc1_3 ) ) ( * ( - 1 ) rfc3 ) ) ( = ( + ( * lam12n7 1 ) ( * lam12n15 global_invc1_4 ) ( * lam12n16 term_invc1_4 ) ) ( * ( - 1 ) rfc4 ) ) ( = ( * lam12n3 ( - 1 ) ) rfc0 ) ( = ( * lam12n4 ( - 1 ) ) rfc1 ) ( = ( * lam12n5 ( - 1 ) ) rfc2 ) ( = ( * lam12n6 ( - 1 ) ) rfc3 ) ( = ( * lam12n7 ( - 1 ) ) rfc4 ) ) ) ) ( = bnd_and_dec4 ( and bounded4 dec4 ) ) ( = GLOBAL_NT_1 ( or ( not ( = global_invc1_0 0 ) ) ( not ( = global_invc1_1 0 ) ) ( not ( = global_invc1_3 0 ) ) ( not ( = global_invc1_4 0 ) ) ( not ( = global_invc1_2 0 ) ) ) ) ( or ( and ( not ( <= ( + global_invc1_5 ( * global_invc1_0 global_V0_1 ) ( * global_invc1_1 global_V1_1 ) ( * global_invc1_2 global_V2_1 ) ( * global_invc1_3 global_V3_1 ) ( * global_invc1_4 global_V4_1 ) ) 0 ) ) ( <= ( + 0 0 0 ( * ( - 1 ) global_V3_1 ) 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 ( * ( - 1 ) global_V2_1 ) 0 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 0 global_V3_1 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 ( * ( - 1 ) global_V2_1 ) global_V3_1 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 ( * ( - 1 ) global_V2_1 ) 0 0 ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) global_V3_1 ) 0 ) 0 ) ) ( and ( = global_invc1_0 0 ) ( = global_invc1_1 0 ) ( = global_invc1_3 0 ) ( = global_invc1_4 0 ) ( = global_invc1_2 0 ) ) ) ( = TERM_NT_1 ( or ( not ( = term_invc1_0 0 ) ) ( not ( = term_invc1_1 0 ) ) ( not ( = term_invc1_3 0 ) ) ( not ( = term_invc1_4 0 ) ) ( not ( = term_invc1_2 0 ) ) ) ) ( or ( and ( not ( <= ( + term_invc1_5 ( * term_invc1_0 term_V0_1 ) ( * term_invc1_1 term_V1_1 ) ( * term_invc1_2 term_V2_1 ) ( * term_invc1_3 term_V3_1 ) ( * term_invc1_4 term_V4_1 ) ) 0 ) ) ( <= ( + 0 0 0 ( * ( - 1 ) term_V3_1 ) 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 ( * ( - 1 ) term_V2_1 ) 0 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 0 term_V3_1 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 ( * ( - 1 ) term_V2_1 ) term_V3_1 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 ( * ( - 1 ) term_V2_1 ) ( * ( - 1 ) term_V3_1 ) 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 ( * ( - 1 ) term_V2_1 ) 0 0 ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) term_V3_1 ) 0 ) 0 ) ) ( and ( = term_invc1_0 0 ) ( = term_invc1_1 0 ) ( = term_invc1_3 0 ) ( = term_invc1_4 0 ) ( = term_invc1_2 0 ) ) ) ( = ALL_NON_INC_0 ( and non_inc3 non_inc4 ) ) ( = DIS_OR_ALL_NON_INC_0 ( or disabled3 disabled4 ALL_NON_INC_0 ) ) ( = SOME_BND_AND_DEC_0 ( or bnd_and_dec3 bnd_and_dec4 ) ) ( or ( not ALL_NON_INC_0 ) ( and ( or ( not ( = rfc0 0 ) ) ( not ( = rfc2 0 ) ) ) ( >= rfc5 0 ) ( or SOME_BND_AND_DEC_0 ( or ( and ( <= ( + ( * rfc2 V2_NIV ) ( * rfc3 V3_NIV ) ( * rfc4 V4_NIV ) ( * rfc1 V1_NIV ) ( * rfc0 V0_NIV ) 1 ) ( + ( * rfc2 V7_NIV ) ( * rfc3 V8_NIV ) ( * rfc4 V9_NIV ) ( * rfc1 V6_NIV ) ( * rfc0 V5_NIV ) ) ) ( >= ( + 0 ( * ( - 1 ) V3_NIV ) 0 0 0 ) ( + 0 ( * ( - 1 ) V8_NIV ) 0 0 0 ) ) ) ( = rfc3 0 ) ) ) ) ) ( or GLOBAL_NT_1 TERM_NT_1 ALL_NON_INC_0 ) ))
(check-sat)
(exit)