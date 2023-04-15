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
(declare-fun global_invc1_1 () Int)
(declare-fun global_invc1_2 () Int)
(declare-fun global_invc1_0 () Int)
(declare-fun global_invc1_10 () Int)
(declare-fun global_invc1_6 () Int)
(declare-fun global_invc1_7 () Int)
(declare-fun global_invc1_8 () Int)
(declare-fun global_invc1_9 () Int)
(declare-fun global_invc1_3 () Int)
(declare-fun global_invc1_4 () Int)
(declare-fun global_invc1_5 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n6 () Int)
(declare-fun global_invc1_11 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n10 () Int)
(declare-fun lam1n11 () Int)
(declare-fun lam1n12 () Int)
(declare-fun lam1n13 () Int)
(declare-fun lam1n14 () Int)
(declare-fun lam1n15 () Int)
(declare-fun lam1n16 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n9 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam1n6 () Int)
(declare-fun lam1n7 () Int)
(declare-fun lam1n8 () Int)
(declare-fun term_invc1_1 () Int)
(declare-fun term_invc1_2 () Int)
(declare-fun term_invc1_0 () Int)
(declare-fun term_invc1_10 () Int)
(declare-fun term_invc1_6 () Int)
(declare-fun term_invc1_7 () Int)
(declare-fun term_invc1_8 () Int)
(declare-fun term_invc1_9 () Int)
(declare-fun term_invc1_3 () Int)
(declare-fun term_invc1_4 () Int)
(declare-fun term_invc1_5 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n10 () Int)
(declare-fun lam2n11 () Int)
(declare-fun lam2n12 () Int)
(declare-fun lam2n13 () Int)
(declare-fun lam2n14 () Int)
(declare-fun lam2n16 () Int)
(declare-fun lam2n17 () Int)
(declare-fun lam2n18 () Int)
(declare-fun lam2n19 () Int)
(declare-fun lam2n20 () Int)
(declare-fun term_invc1_11 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n9 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n15 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam2n6 () Int)
(declare-fun lam2n7 () Int)
(declare-fun lam2n8 () Int)
(declare-fun non_inc1_E () Bool)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n10 () Int)
(declare-fun lam3n11 () Int)
(declare-fun lam3n12 () Int)
(declare-fun lam3n13 () Int)
(declare-fun lam3n14 () Int)
(declare-fun lam3n16 () Int)
(declare-fun lam3n17 () Int)
(declare-fun lam3n18 () Int)
(declare-fun lam3n19 () Int)
(declare-fun lam3n20 () Int)
(declare-fun lam3n22 () Int)
(declare-fun lam3n21 () Int)
(declare-fun lam3n2 () Int)
(declare-fun rfc0 () Int)
(declare-fun rfc1 () Int)
(declare-fun lam3n9 () Int)
(declare-fun rfc2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam3n15 () Int)
(declare-fun rfc3 () Int)
(declare-fun lam3n4 () Int)
(declare-fun rfc4 () Int)
(declare-fun rfc5 () Int)
(declare-fun lam3n5 () Int)
(declare-fun rfc6 () Int)
(declare-fun rfc7 () Int)
(declare-fun lam3n6 () Int)
(declare-fun rfc8 () Int)
(declare-fun lam3n7 () Int)
(declare-fun rfc9 () Int)
(declare-fun lam3n8 () Int)
(declare-fun rfc10 () Int)
(declare-fun disabled1_E () Bool)
(declare-fun bounded1_E () Bool)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n10 () Int)
(declare-fun lam4n11 () Int)
(declare-fun lam4n12 () Int)
(declare-fun lam4n13 () Int)
(declare-fun lam4n14 () Int)
(declare-fun lam4n16 () Int)
(declare-fun lam4n17 () Int)
(declare-fun lam4n18 () Int)
(declare-fun lam4n19 () Int)
(declare-fun lam4n20 () Int)
(declare-fun lam4n21 () Int)
(declare-fun rfc11 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam4n9 () Int)
(declare-fun lam4n3 () Int)
(declare-fun lam4n15 () Int)
(declare-fun lam4n4 () Int)
(declare-fun lam4n5 () Int)
(declare-fun lam4n6 () Int)
(declare-fun lam4n7 () Int)
(declare-fun lam4n8 () Int)
(declare-fun dec1_E () Bool)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n10 () Int)
(declare-fun lam5n11 () Int)
(declare-fun lam5n12 () Int)
(declare-fun lam5n13 () Int)
(declare-fun lam5n14 () Int)
(declare-fun lam5n16 () Int)
(declare-fun lam5n17 () Int)
(declare-fun lam5n18 () Int)
(declare-fun lam5n19 () Int)
(declare-fun lam5n20 () Int)
(declare-fun lam5n21 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam5n9 () Int)
(declare-fun lam5n3 () Int)
(declare-fun lam5n15 () Int)
(declare-fun lam5n4 () Int)
(declare-fun lam5n5 () Int)
(declare-fun lam5n6 () Int)
(declare-fun lam5n7 () Int)
(declare-fun lam5n8 () Int)
(declare-fun bnd_and_dec1_E () Bool)
(declare-fun GLOBAL_NT_1 () Bool)
(declare-fun global_V0_1 () Int)
(declare-fun global_V1_1 () Int)
(declare-fun global_V10_1 () Int)
(declare-fun global_V2_1 () Int)
(declare-fun global_V3_1 () Int)
(declare-fun global_V4_1 () Int)
(declare-fun global_V5_1 () Int)
(declare-fun global_V6_1 () Int)
(declare-fun global_V7_1 () Int)
(declare-fun global_V8_1 () Int)
(declare-fun global_V9_1 () Int)
(declare-fun TERM_NT_1 () Bool)
(declare-fun term_V0_1 () Int)
(declare-fun term_V1_1 () Int)
(declare-fun term_V10_1 () Int)
(declare-fun term_V2_1 () Int)
(declare-fun term_V3_1 () Int)
(declare-fun term_V4_1 () Int)
(declare-fun term_V5_1 () Int)
(declare-fun term_V6_1 () Int)
(declare-fun term_V7_1 () Int)
(declare-fun term_V8_1 () Int)
(declare-fun term_V9_1 () Int)
(declare-fun ALL_NON_INC_0 () Bool)
(declare-fun DIS_OR_ALL_NON_INC_0 () Bool)
(declare-fun SOME_BND_AND_DEC_0 () Bool)
(declare-fun V8_NIV () Int)
(declare-fun V7_NIV () Int)
(declare-fun V0_NIV () Int)
(declare-fun V1_NIV () Int)
(declare-fun V4_NIV () Int)
(declare-fun V3_NIV () Int)
(declare-fun V6_NIV () Int)
(declare-fun V5_NIV () Int)
(declare-fun V2_NIV () Int)
(declare-fun V10_NIV () Int)
(declare-fun V9_NIV () Int)
(declare-fun V19_NIV () Int)
(declare-fun V18_NIV () Int)
(declare-fun V11_NIV () Int)
(declare-fun V12_NIV () Int)
(declare-fun V15_NIV () Int)
(declare-fun V14_NIV () Int)
(declare-fun V17_NIV () Int)
(declare-fun V16_NIV () Int)
(declare-fun V13_NIV () Int)
(declare-fun V21_NIV () Int)
(declare-fun V20_NIV () Int)
(assert ( and ( >= global_invc1_1 ( - 1 ) ) ( <= global_invc1_1 1 ) ( >= global_invc1_2 ( - 1 ) ) ( <= global_invc1_2 1 ) ( >= global_invc1_0 ( - 1 ) ) ( <= global_invc1_0 1 ) ( >= global_invc1_10 ( - 1 ) ) ( <= global_invc1_10 1 ) ( >= global_invc1_6 ( - 1 ) ) ( <= global_invc1_6 1 ) ( >= global_invc1_7 ( - 1 ) ) ( <= global_invc1_7 1 ) ( >= global_invc1_8 ( - 1 ) ) ( <= global_invc1_8 1 ) ( >= global_invc1_9 ( - 1 ) ) ( <= global_invc1_9 1 ) ( >= global_invc1_3 ( - 1 ) ) ( <= global_invc1_3 1 ) ( >= global_invc1_4 ( - 1 ) ) ( <= global_invc1_4 1 ) ( >= global_invc1_5 ( - 1 ) ) ( <= global_invc1_5 1 ) ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( <= 0 lam0n6 ) ( < lam0n6 1 ) ( and ( = ( + ( * ( - 1 ) lam0n0 ) ( * lam0n1 1 ) ) ( + global_invc1_11 ( * ( - 1 ) lam0n6 ) ) ) ( = ( * lam0n2 1 ) global_invc1_3 ) ( = ( * lam0n2 ( - 1 ) ) global_invc1_4 ) ( = ( * lam0n3 ( - 1 ) ) global_invc1_6 ) ( = ( * lam0n4 ( - 1 ) ) global_invc1_8 ) ( = ( * lam0n5 ( - 1 ) ) global_invc1_9 ) ( = ( + ( * lam0n1 ( - 1 ) ) ( * lam0n3 1 ) ) 0 ) ( = ( * lam0n4 1 ) 0 ) ( = ( * lam0n5 1 ) 0 ) ( = 0 global_invc1_1 ) ( = 0 global_invc1_2 ) ( = 0 global_invc1_0 ) ( = 0 global_invc1_10 ) ( = 0 global_invc1_7 ) ( = 0 global_invc1_5 ) ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n10 0 ) ( >= lam1n11 0 ) ( >= lam1n12 0 ) ( >= lam1n13 0 ) ( >= lam1n14 0 ) ( >= lam1n15 0 ) ( <= 0 lam1n16 ) ( < lam1n16 1 ) ( and ( = ( + ( * ( - 1 ) lam1n0 ) ( * lam1n1 2 ) ( * lam1n10 1 ) ( * lam1n12 ( - 1 ) ) ( * lam1n13 1 ) ( * lam1n15 global_invc1_11 ) ) ( + global_invc1_11 ( * ( - 1 ) lam1n16 ) ) ) ( = ( + ( * lam1n2 1 ) ( * lam1n15 global_invc1_0 ) ) 0 ) ( = ( * lam1n15 global_invc1_1 ) 0 ) ( = ( + ( * lam1n9 1 ) ( * lam1n15 global_invc1_2 ) ) 0 ) ( = ( * lam1n2 ( - 1 ) ) global_invc1_0 ) ( = ( * lam1n3 ( - 1 ) ) global_invc1_3 ) ( = ( * lam1n4 ( - 1 ) ) global_invc1_4 ) ( = ( * lam1n5 ( - 1 ) ) global_invc1_6 ) ( = ( * lam1n6 ( - 1 ) ) global_invc1_8 ) ( = ( * lam1n7 ( - 1 ) ) global_invc1_9 ) ( = ( + ( * lam1n3 1 ) ( * lam1n4 1 ) ( * lam1n11 1 ) ( * lam1n12 ( - 1 ) ) ( * lam1n13 ( - 1 ) ) ( * lam1n14 ( - 1 ) ) ( * lam1n15 global_invc1_3 ) ) 0 ) ( = ( * lam1n8 ( - 1 ) ) global_invc1_10 ) ( = ( * lam1n9 ( - 1 ) ) global_invc1_2 ) ( = ( + ( * lam1n11 ( - 1 ) ) ( * lam1n12 1 ) ( * lam1n13 1 ) ( * lam1n14 1 ) ( * lam1n15 global_invc1_4 ) ) 0 ) ( = ( * lam1n15 global_invc1_5 ) 0 ) ( = ( + ( * lam1n5 1 ) ( * lam1n10 ( - 1 ) ) ( * lam1n13 ( - 1 ) ) ( * lam1n15 global_invc1_6 ) ) 0 ) ( = ( * lam1n15 global_invc1_7 ) 0 ) ( = ( + ( * lam1n1 ( - 1 ) ) ( * lam1n6 1 ) ( * lam1n15 global_invc1_8 ) ) 0 ) ( = ( + ( * lam1n7 1 ) ( * lam1n15 global_invc1_9 ) ) 0 ) ( = ( + ( * lam1n8 1 ) ( * lam1n15 global_invc1_10 ) ) 0 ) ( = 0 global_invc1_1 ) ( = 0 global_invc1_7 ) ( = 0 global_invc1_5 ) ) ) ( >= term_invc1_1 ( - 1 ) ) ( <= term_invc1_1 1 ) ( >= term_invc1_2 ( - 1 ) ) ( <= term_invc1_2 1 ) ( >= term_invc1_0 ( - 1 ) ) ( <= term_invc1_0 1 ) ( >= term_invc1_10 ( - 1 ) ) ( <= term_invc1_10 1 ) ( >= term_invc1_6 ( - 1 ) ) ( <= term_invc1_6 1 ) ( >= term_invc1_7 ( - 1 ) ) ( <= term_invc1_7 1 ) ( >= term_invc1_8 ( - 1 ) ) ( <= term_invc1_8 1 ) ( >= term_invc1_9 ( - 1 ) ) ( <= term_invc1_9 1 ) ( >= term_invc1_3 ( - 1 ) ) ( <= term_invc1_3 1 ) ( >= term_invc1_4 ( - 1 ) ) ( <= term_invc1_4 1 ) ( >= term_invc1_5 ( - 1 ) ) ( <= term_invc1_5 1 ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n10 0 ) ( >= lam2n11 0 ) ( >= lam2n12 0 ) ( >= lam2n13 0 ) ( >= lam2n14 0 ) ( >= lam2n16 0 ) ( >= lam2n17 0 ) ( >= lam2n18 0 ) ( >= lam2n19 0 ) ( <= 0 lam2n20 ) ( < lam2n20 1 ) ( and ( = ( + ( * ( - 1 ) lam2n0 ) ( * lam2n1 2 ) ( * lam2n10 1 ) ( * lam2n12 ( - 1 ) ) ( * lam2n13 1 ) ( * lam2n16 ( - 1 ) ) ( * lam2n18 1 ) ( * lam2n19 global_invc1_11 ) ) ( + term_invc1_11 ( * ( - 1 ) lam2n20 ) ) ) ( = ( + ( * lam2n2 1 ) ( * lam2n19 global_invc1_0 ) ) 0 ) ( = ( * lam2n19 global_invc1_1 ) 0 ) ( = ( + ( * lam2n9 1 ) ( * lam2n19 global_invc1_2 ) ) 0 ) ( = ( * lam2n2 ( - 1 ) ) term_invc1_0 ) ( = ( + ( * lam2n3 ( - 1 ) ) ( * lam2n15 1 ) ) term_invc1_3 ) ( = ( + ( * lam2n4 ( - 1 ) ) ( * lam2n15 ( - 1 ) ) ) term_invc1_4 ) ( = ( + ( * lam2n5 ( - 1 ) ) ( * lam2n15 ( - 1 ) ) ) term_invc1_6 ) ( = ( * lam2n6 ( - 1 ) ) term_invc1_8 ) ( = ( * lam2n7 ( - 1 ) ) term_invc1_9 ) ( = ( + ( * lam2n3 1 ) ( * lam2n4 1 ) ( * lam2n11 1 ) ( * lam2n12 ( - 1 ) ) ( * lam2n13 ( - 1 ) ) ( * lam2n14 ( - 1 ) ) ( * lam2n15 ( - 1 ) ) ( * lam2n16 ( - 1 ) ) ( * lam2n17 ( - 1 ) ) ( * lam2n18 1 ) ( * lam2n19 global_invc1_3 ) ) 0 ) ( = ( * lam2n8 ( - 1 ) ) term_invc1_10 ) ( = ( * lam2n9 ( - 1 ) ) term_invc1_2 ) ( = ( + ( * lam2n11 ( - 1 ) ) ( * lam2n12 1 ) ( * lam2n13 1 ) ( * lam2n14 1 ) ( * lam2n15 1 ) ( * lam2n16 1 ) ( * lam2n17 1 ) ( * lam2n18 ( - 1 ) ) ( * lam2n19 global_invc1_4 ) ) 0 ) ( = ( * lam2n19 global_invc1_5 ) 0 ) ( = ( + ( * lam2n5 1 ) ( * lam2n10 ( - 1 ) ) ( * lam2n13 ( - 1 ) ) ( * lam2n15 1 ) ( * lam2n19 global_invc1_6 ) ) 0 ) ( = ( * lam2n19 global_invc1_7 ) 0 ) ( = ( + ( * lam2n1 ( - 1 ) ) ( * lam2n6 1 ) ( * lam2n16 ( - 1 ) ) ( * lam2n17 ( - 1 ) ) ( * lam2n18 ( - 1 ) ) ( * lam2n19 global_invc1_8 ) ) 0 ) ( = ( + ( * lam2n7 1 ) ( * lam2n19 global_invc1_9 ) ) 0 ) ( = ( + ( * lam2n8 1 ) ( * lam2n19 global_invc1_10 ) ) 0 ) ( = 0 term_invc1_1 ) ( = 0 term_invc1_7 ) ( = 0 term_invc1_5 ) ) ) ( = non_inc1_E ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n10 0 ) ( >= lam3n11 0 ) ( >= lam3n12 0 ) ( >= lam3n13 0 ) ( >= lam3n14 0 ) ( >= lam3n16 0 ) ( >= lam3n17 0 ) ( >= lam3n18 0 ) ( >= lam3n19 0 ) ( >= lam3n20 0 ) ( <= 0 lam3n22 ) ( < lam3n22 1 ) ( <= lam3n21 1 ) ( >= lam3n21 0 ) ( and ( > ( + ( * ( - 1 ) lam3n0 ) ( * lam3n1 2 ) ( * lam3n10 1 ) ( * lam3n12 ( - 1 ) ) ( * lam3n13 1 ) ( * lam3n16 ( - 1 ) ) ( * lam3n18 1 ) ( * lam3n19 global_invc1_11 ) ( * lam3n20 term_invc1_11 ) ( * lam3n21 ( + 1 ( * ( - 1 ) lam3n22 ) ) ) ) 0 ) ( = ( + ( * lam3n2 1 ) ( * lam3n19 global_invc1_0 ) ( * lam3n20 term_invc1_0 ) ( * lam3n21 rfc0 ) ) 0 ) ( = ( + ( * lam3n19 global_invc1_1 ) ( * lam3n20 term_invc1_1 ) ( * lam3n21 rfc1 ) ) 0 ) ( = ( + ( * lam3n9 1 ) ( * lam3n19 global_invc1_2 ) ( * lam3n20 term_invc1_2 ) ( * lam3n21 rfc2 ) ) 0 ) ( = ( + ( * lam3n2 ( - 1 ) ) ( * lam3n21 ( * ( - 1 ) rfc0 ) ) ) 0 ) ( = ( * lam3n21 ( * ( - 1 ) rfc1 ) ) 0 ) ( = ( + ( * lam3n3 ( - 1 ) ) ( * lam3n15 1 ) ( * lam3n21 ( * ( - 1 ) rfc3 ) ) ) 0 ) ( = ( + ( * lam3n4 ( - 1 ) ) ( * lam3n15 ( - 1 ) ) ( * lam3n21 ( * ( - 1 ) rfc4 ) ) ) 0 ) ( = ( * lam3n21 ( * ( - 1 ) rfc5 ) ) 0 ) ( = ( + ( * lam3n5 ( - 1 ) ) ( * lam3n15 ( - 1 ) ) ( * lam3n21 ( * ( - 1 ) rfc6 ) ) ) 0 ) ( = ( * lam3n21 ( * ( - 1 ) rfc7 ) ) 0 ) ( = ( + ( * lam3n6 ( - 1 ) ) ( * lam3n21 ( * ( - 1 ) rfc8 ) ) ) 0 ) ( = ( + ( * lam3n7 ( - 1 ) ) ( * lam3n21 ( * ( - 1 ) rfc9 ) ) ) 0 ) ( = ( + ( * lam3n3 1 ) ( * lam3n4 1 ) ( * lam3n11 1 ) ( * lam3n12 ( - 1 ) ) ( * lam3n13 ( - 1 ) ) ( * lam3n14 ( - 1 ) ) ( * lam3n15 ( - 1 ) ) ( * lam3n16 ( - 1 ) ) ( * lam3n17 ( - 1 ) ) ( * lam3n18 1 ) ( * lam3n19 global_invc1_3 ) ( * lam3n20 term_invc1_3 ) ( * lam3n21 rfc3 ) ) 0 ) ( = ( + ( * lam3n8 ( - 1 ) ) ( * lam3n21 ( * ( - 1 ) rfc10 ) ) ) 0 ) ( = ( + ( * lam3n9 ( - 1 ) ) ( * lam3n21 ( * ( - 1 ) rfc2 ) ) ) 0 ) ( = ( + ( * lam3n11 ( - 1 ) ) ( * lam3n12 1 ) ( * lam3n13 1 ) ( * lam3n14 1 ) ( * lam3n15 1 ) ( * lam3n16 1 ) ( * lam3n17 1 ) ( * lam3n18 ( - 1 ) ) ( * lam3n19 global_invc1_4 ) ( * lam3n20 term_invc1_4 ) ( * lam3n21 rfc4 ) ) 0 ) ( = ( + ( * lam3n19 global_invc1_5 ) ( * lam3n20 term_invc1_5 ) ( * lam3n21 rfc5 ) ) 0 ) ( = ( + ( * lam3n5 1 ) ( * lam3n10 ( - 1 ) ) ( * lam3n13 ( - 1 ) ) ( * lam3n15 1 ) ( * lam3n19 global_invc1_6 ) ( * lam3n20 term_invc1_6 ) ( * lam3n21 rfc6 ) ) 0 ) ( = ( + ( * lam3n19 global_invc1_7 ) ( * lam3n20 term_invc1_7 ) ( * lam3n21 rfc7 ) ) 0 ) ( = ( + ( * lam3n1 ( - 1 ) ) ( * lam3n6 1 ) ( * lam3n16 ( - 1 ) ) ( * lam3n17 ( - 1 ) ) ( * lam3n18 ( - 1 ) ) ( * lam3n19 global_invc1_8 ) ( * lam3n20 term_invc1_8 ) ( * lam3n21 rfc8 ) ) 0 ) ( = ( + ( * lam3n7 1 ) ( * lam3n19 global_invc1_9 ) ( * lam3n20 term_invc1_9 ) ( * lam3n21 rfc9 ) ) 0 ) ( = ( + ( * lam3n8 1 ) ( * lam3n19 global_invc1_10 ) ( * lam3n20 term_invc1_10 ) ( * lam3n21 rfc10 ) ) 0 ) ) ) ) ( = disabled1_E ( and ( = lam3n21 0 ) non_inc1_E ) ) ( = bounded1_E ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n10 0 ) ( >= lam4n11 0 ) ( >= lam4n12 0 ) ( >= lam4n13 0 ) ( >= lam4n14 0 ) ( >= lam4n16 0 ) ( >= lam4n17 0 ) ( >= lam4n18 0 ) ( >= lam4n19 0 ) ( >= lam4n20 0 ) ( <= 0 lam4n21 ) ( < lam4n21 1 ) ( and ( = ( + ( * ( - 1 ) lam4n0 ) ( * lam4n1 2 ) ( * lam4n10 1 ) ( * lam4n12 ( - 1 ) ) ( * lam4n13 1 ) ( * lam4n16 ( - 1 ) ) ( * lam4n18 1 ) ( * lam4n19 global_invc1_11 ) ( * lam4n20 term_invc1_11 ) ) ( + ( * ( - 1 ) rfc11 ) ( * ( - 1 ) lam4n21 ) ) ) ( = ( + ( * lam4n2 1 ) ( * lam4n19 global_invc1_0 ) ( * lam4n20 term_invc1_0 ) ) ( * ( - 1 ) rfc0 ) ) ( = ( + ( * lam4n19 global_invc1_1 ) ( * lam4n20 term_invc1_1 ) ) ( * ( - 1 ) rfc1 ) ) ( = ( + ( * lam4n9 1 ) ( * lam4n19 global_invc1_2 ) ( * lam4n20 term_invc1_2 ) ) ( * ( - 1 ) rfc2 ) ) ( = ( * lam4n2 ( - 1 ) ) 0 ) ( = ( + ( * lam4n3 ( - 1 ) ) ( * lam4n15 1 ) ) 0 ) ( = ( + ( * lam4n4 ( - 1 ) ) ( * lam4n15 ( - 1 ) ) ) 0 ) ( = ( + ( * lam4n5 ( - 1 ) ) ( * lam4n15 ( - 1 ) ) ) 0 ) ( = ( * lam4n6 ( - 1 ) ) 0 ) ( = ( * lam4n7 ( - 1 ) ) 0 ) ( = ( + ( * lam4n3 1 ) ( * lam4n4 1 ) ( * lam4n11 1 ) ( * lam4n12 ( - 1 ) ) ( * lam4n13 ( - 1 ) ) ( * lam4n14 ( - 1 ) ) ( * lam4n15 ( - 1 ) ) ( * lam4n16 ( - 1 ) ) ( * lam4n17 ( - 1 ) ) ( * lam4n18 1 ) ( * lam4n19 global_invc1_3 ) ( * lam4n20 term_invc1_3 ) ) ( * ( - 1 ) rfc3 ) ) ( = ( * lam4n8 ( - 1 ) ) 0 ) ( = ( * lam4n9 ( - 1 ) ) 0 ) ( = ( + ( * lam4n11 ( - 1 ) ) ( * lam4n12 1 ) ( * lam4n13 1 ) ( * lam4n14 1 ) ( * lam4n15 1 ) ( * lam4n16 1 ) ( * lam4n17 1 ) ( * lam4n18 ( - 1 ) ) ( * lam4n19 global_invc1_4 ) ( * lam4n20 term_invc1_4 ) ) ( * ( - 1 ) rfc4 ) ) ( = ( + ( * lam4n19 global_invc1_5 ) ( * lam4n20 term_invc1_5 ) ) ( * ( - 1 ) rfc5 ) ) ( = ( + ( * lam4n5 1 ) ( * lam4n10 ( - 1 ) ) ( * lam4n13 ( - 1 ) ) ( * lam4n15 1 ) ( * lam4n19 global_invc1_6 ) ( * lam4n20 term_invc1_6 ) ) ( * ( - 1 ) rfc6 ) ) ( = ( + ( * lam4n19 global_invc1_7 ) ( * lam4n20 term_invc1_7 ) ) ( * ( - 1 ) rfc7 ) ) ( = ( + ( * lam4n1 ( - 1 ) ) ( * lam4n6 1 ) ( * lam4n16 ( - 1 ) ) ( * lam4n17 ( - 1 ) ) ( * lam4n18 ( - 1 ) ) ( * lam4n19 global_invc1_8 ) ( * lam4n20 term_invc1_8 ) ) ( * ( - 1 ) rfc8 ) ) ( = ( + ( * lam4n7 1 ) ( * lam4n19 global_invc1_9 ) ( * lam4n20 term_invc1_9 ) ) ( * ( - 1 ) rfc9 ) ) ( = ( + ( * lam4n8 1 ) ( * lam4n19 global_invc1_10 ) ( * lam4n20 term_invc1_10 ) ) ( * ( - 1 ) rfc10 ) ) ) ) ) ( = dec1_E ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n10 0 ) ( >= lam5n11 0 ) ( >= lam5n12 0 ) ( >= lam5n13 0 ) ( >= lam5n14 0 ) ( >= lam5n16 0 ) ( >= lam5n17 0 ) ( >= lam5n18 0 ) ( >= lam5n19 0 ) ( >= lam5n20 0 ) ( <= 0 lam5n21 ) ( < lam5n21 1 ) ( and ( = ( + ( * ( - 1 ) lam5n0 ) ( * lam5n1 2 ) ( * lam5n10 1 ) ( * lam5n12 ( - 1 ) ) ( * lam5n13 1 ) ( * lam5n16 ( - 1 ) ) ( * lam5n18 1 ) ( * lam5n19 global_invc1_11 ) ( * lam5n20 term_invc1_11 ) ) ( + 1 ( * ( - 1 ) lam5n21 ) ) ) ( = ( + ( * lam5n2 1 ) ( * lam5n19 global_invc1_0 ) ( * lam5n20 term_invc1_0 ) ) ( * ( - 1 ) rfc0 ) ) ( = ( + ( * lam5n19 global_invc1_1 ) ( * lam5n20 term_invc1_1 ) ) ( * ( - 1 ) rfc1 ) ) ( = ( + ( * lam5n9 1 ) ( * lam5n19 global_invc1_2 ) ( * lam5n20 term_invc1_2 ) ) ( * ( - 1 ) rfc2 ) ) ( = ( * lam5n2 ( - 1 ) ) rfc0 ) ( = ( + ( * lam5n3 ( - 1 ) ) ( * lam5n15 1 ) ) rfc3 ) ( = ( + ( * lam5n4 ( - 1 ) ) ( * lam5n15 ( - 1 ) ) ) rfc4 ) ( = ( + ( * lam5n5 ( - 1 ) ) ( * lam5n15 ( - 1 ) ) ) rfc6 ) ( = ( * lam5n6 ( - 1 ) ) rfc8 ) ( = ( * lam5n7 ( - 1 ) ) rfc9 ) ( = ( + ( * lam5n3 1 ) ( * lam5n4 1 ) ( * lam5n11 1 ) ( * lam5n12 ( - 1 ) ) ( * lam5n13 ( - 1 ) ) ( * lam5n14 ( - 1 ) ) ( * lam5n15 ( - 1 ) ) ( * lam5n16 ( - 1 ) ) ( * lam5n17 ( - 1 ) ) ( * lam5n18 1 ) ( * lam5n19 global_invc1_3 ) ( * lam5n20 term_invc1_3 ) ) ( * ( - 1 ) rfc3 ) ) ( = ( * lam5n8 ( - 1 ) ) rfc10 ) ( = ( * lam5n9 ( - 1 ) ) rfc2 ) ( = ( + ( * lam5n11 ( - 1 ) ) ( * lam5n12 1 ) ( * lam5n13 1 ) ( * lam5n14 1 ) ( * lam5n15 1 ) ( * lam5n16 1 ) ( * lam5n17 1 ) ( * lam5n18 ( - 1 ) ) ( * lam5n19 global_invc1_4 ) ( * lam5n20 term_invc1_4 ) ) ( * ( - 1 ) rfc4 ) ) ( = ( + ( * lam5n19 global_invc1_5 ) ( * lam5n20 term_invc1_5 ) ) ( * ( - 1 ) rfc5 ) ) ( = ( + ( * lam5n5 1 ) ( * lam5n10 ( - 1 ) ) ( * lam5n13 ( - 1 ) ) ( * lam5n15 1 ) ( * lam5n19 global_invc1_6 ) ( * lam5n20 term_invc1_6 ) ) ( * ( - 1 ) rfc6 ) ) ( = ( + ( * lam5n19 global_invc1_7 ) ( * lam5n20 term_invc1_7 ) ) ( * ( - 1 ) rfc7 ) ) ( = ( + ( * lam5n1 ( - 1 ) ) ( * lam5n6 1 ) ( * lam5n16 ( - 1 ) ) ( * lam5n17 ( - 1 ) ) ( * lam5n18 ( - 1 ) ) ( * lam5n19 global_invc1_8 ) ( * lam5n20 term_invc1_8 ) ) ( * ( - 1 ) rfc8 ) ) ( = ( + ( * lam5n7 1 ) ( * lam5n19 global_invc1_9 ) ( * lam5n20 term_invc1_9 ) ) ( * ( - 1 ) rfc9 ) ) ( = ( + ( * lam5n8 1 ) ( * lam5n19 global_invc1_10 ) ( * lam5n20 term_invc1_10 ) ) ( * ( - 1 ) rfc10 ) ) ( = 0 rfc1 ) ( = 0 rfc7 ) ( = 0 rfc5 ) ) ) ) ( = bnd_and_dec1_E ( and bounded1_E dec1_E ) ) ( = GLOBAL_NT_1 ( or ( not ( = global_invc1_1 0 ) ) ( not ( = global_invc1_2 0 ) ) ( not ( = global_invc1_0 0 ) ) ( not ( = global_invc1_10 0 ) ) ( not ( = global_invc1_6 0 ) ) ( not ( = global_invc1_7 0 ) ) ( not ( = global_invc1_8 0 ) ) ( not ( = global_invc1_9 0 ) ) ( not ( = global_invc1_3 0 ) ) ( not ( = global_invc1_4 0 ) ) ( not ( = global_invc1_5 0 ) ) ) ) ( or ( and ( not ( <= ( + global_invc1_11 ( * global_invc1_0 global_V0_1 ) ( * global_invc1_1 global_V1_1 ) ( * global_invc1_2 global_V10_1 ) ( * global_invc1_3 global_V2_1 ) ( * global_invc1_4 global_V3_1 ) ( * global_invc1_5 global_V4_1 ) ( * global_invc1_6 global_V5_1 ) ( * global_invc1_7 global_V6_1 ) ( * global_invc1_8 global_V7_1 ) ( * global_invc1_9 global_V8_1 ) ( * global_invc1_10 global_V9_1 ) ) 0 ) ) ( <= ( + 0 0 0 0 0 0 ( * ( - 1 ) global_V5_1 ) 0 0 0 0 1 ) 0 ) ( <= ( + 0 0 0 global_V2_1 ( * ( - 1 ) global_V3_1 ) 0 0 0 0 0 0 ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) global_V2_1 ) global_V3_1 0 0 0 0 0 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) global_V2_1 ) global_V3_1 0 ( * ( - 1 ) global_V5_1 ) 0 0 0 0 1 ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) global_V2_1 ) global_V3_1 0 0 0 0 0 0 ) 0 ) ) ( and ( = global_invc1_1 0 ) ( = global_invc1_2 0 ) ( = global_invc1_0 0 ) ( = global_invc1_10 0 ) ( = global_invc1_6 0 ) ( = global_invc1_7 0 ) ( = global_invc1_8 0 ) ( = global_invc1_9 0 ) ( = global_invc1_3 0 ) ( = global_invc1_4 0 ) ( = global_invc1_5 0 ) ) ) ( = TERM_NT_1 ( or ( not ( = term_invc1_1 0 ) ) ( not ( = term_invc1_2 0 ) ) ( not ( = term_invc1_0 0 ) ) ( not ( = term_invc1_10 0 ) ) ( not ( = term_invc1_6 0 ) ) ( not ( = term_invc1_7 0 ) ) ( not ( = term_invc1_8 0 ) ) ( not ( = term_invc1_9 0 ) ) ( not ( = term_invc1_3 0 ) ) ( not ( = term_invc1_4 0 ) ) ( not ( = term_invc1_5 0 ) ) ) ) ( or ( and ( not ( <= ( + term_invc1_11 ( * term_invc1_0 term_V0_1 ) ( * term_invc1_1 term_V1_1 ) ( * term_invc1_2 term_V10_1 ) ( * term_invc1_3 term_V2_1 ) ( * term_invc1_4 term_V3_1 ) ( * term_invc1_5 term_V4_1 ) ( * term_invc1_6 term_V5_1 ) ( * term_invc1_7 term_V6_1 ) ( * term_invc1_8 term_V7_1 ) ( * term_invc1_9 term_V8_1 ) ( * term_invc1_10 term_V9_1 ) ) 0 ) ) ( <= ( + 0 0 0 0 0 0 ( * ( - 1 ) term_V5_1 ) 0 0 0 0 1 ) 0 ) ( <= ( + 0 0 0 term_V2_1 ( * ( - 1 ) term_V3_1 ) 0 0 0 0 0 0 ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) term_V2_1 ) term_V3_1 0 0 0 ( * ( - 1 ) term_V7_1 ) 0 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) term_V2_1 ) term_V3_1 0 0 0 0 0 0 ( - 1 ) ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) term_V2_1 ) term_V3_1 0 ( * ( - 1 ) term_V5_1 ) 0 0 0 0 1 ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) term_V2_1 ) term_V3_1 0 0 0 ( * ( - 1 ) term_V7_1 ) 0 0 ) 0 ) ( <= ( + 0 0 0 ( * ( - 1 ) term_V2_1 ) term_V3_1 0 0 0 0 0 0 ) 0 ) ( <= ( + 0 0 0 term_V2_1 ( * ( - 1 ) term_V3_1 ) 0 0 0 ( * ( - 1 ) term_V7_1 ) 0 0 1 ) 0 ) ) ( and ( = term_invc1_1 0 ) ( = term_invc1_2 0 ) ( = term_invc1_0 0 ) ( = term_invc1_10 0 ) ( = term_invc1_6 0 ) ( = term_invc1_7 0 ) ( = term_invc1_8 0 ) ( = term_invc1_9 0 ) ( = term_invc1_3 0 ) ( = term_invc1_4 0 ) ( = term_invc1_5 0 ) ) ) ( = ALL_NON_INC_0 non_inc1_E ) ( = DIS_OR_ALL_NON_INC_0 ( or disabled1_E ALL_NON_INC_0 ) ) ( = SOME_BND_AND_DEC_0 bnd_and_dec1_E ) ( or ( not ALL_NON_INC_0 ) ( and ( >= rfc1 ( - 2 ) ) ( <= rfc1 2 ) ( >= rfc2 ( - 2 ) ) ( <= rfc2 2 ) ( >= rfc0 ( - 2 ) ) ( <= rfc0 2 ) ( >= rfc10 ( - 2 ) ) ( <= rfc10 2 ) ( >= rfc6 ( - 2 ) ) ( <= rfc6 2 ) ( >= rfc7 ( - 2 ) ) ( <= rfc7 2 ) ( >= rfc8 ( - 2 ) ) ( <= rfc8 2 ) ( >= rfc9 ( - 2 ) ) ( <= rfc9 2 ) ( >= rfc3 ( - 2 ) ) ( <= rfc3 2 ) ( >= rfc4 ( - 2 ) ) ( <= rfc4 2 ) ( >= rfc5 ( - 2 ) ) ( <= rfc5 2 ) ( or ( not ( = rfc1 0 ) ) ( not ( = rfc7 0 ) ) ( not ( = rfc4 0 ) ) ( not ( = rfc5 0 ) ) ) ( >= rfc11 0 ) ( or SOME_BND_AND_DEC_0 ( or ( and ( <= ( + ( * rfc9 V8_NIV ) ( * rfc8 V7_NIV ) ( * rfc0 V0_NIV ) ( * rfc1 V1_NIV ) ( * rfc5 V4_NIV ) ( * rfc4 V3_NIV ) ( * rfc7 V6_NIV ) ( * rfc6 V5_NIV ) ( * rfc3 V2_NIV ) ( * rfc2 V10_NIV ) ( * rfc10 V9_NIV ) 1 ) ( + ( * rfc9 V19_NIV ) ( * rfc8 V18_NIV ) ( * rfc0 V11_NIV ) ( * rfc1 V12_NIV ) ( * rfc5 V15_NIV ) ( * rfc4 V14_NIV ) ( * rfc7 V17_NIV ) ( * rfc6 V16_NIV ) ( * rfc3 V13_NIV ) ( * rfc2 V21_NIV ) ( * rfc10 V20_NIV ) ) ) ( >= ( + 0 0 0 0 0 V3_NIV 0 V5_NIV ( * ( - 1 ) V2_NIV ) 0 0 ) ( + 0 0 0 0 0 V14_NIV 0 V16_NIV ( * ( - 1 ) V13_NIV ) 0 0 ) ) ( >= ( + 0 V7_NIV 0 0 0 V3_NIV 0 V5_NIV ( * ( - 1 ) V2_NIV ) 0 0 ) ( + 0 V18_NIV 0 0 0 V14_NIV 0 V16_NIV ( * ( - 1 ) V13_NIV ) 0 0 ) ) ( >= ( + 0 V7_NIV 0 0 0 V3_NIV 0 0 ( * ( - 1 ) V2_NIV ) 0 0 ) ( + 0 V18_NIV 0 0 0 V14_NIV 0 0 ( * ( - 1 ) V13_NIV ) 0 0 ) ) ( >= ( + 0 0 0 0 0 V3_NIV 0 0 ( * ( - 1 ) V2_NIV ) 0 0 ) ( + 0 0 0 0 0 V14_NIV 0 0 ( * ( - 1 ) V13_NIV ) 0 0 ) ) ( >= ( + 0 V7_NIV 0 0 0 ( * ( - 1 ) V3_NIV ) 0 0 V2_NIV 0 0 ) ( + 0 V18_NIV 0 0 0 ( * ( - 1 ) V14_NIV ) 0 0 V13_NIV 0 0 ) ) ( >= ( + 0 0 0 0 0 ( * ( - 1 ) V3_NIV ) 0 V5_NIV V2_NIV 0 0 ) ( + 0 0 0 0 0 ( * ( - 1 ) V14_NIV ) 0 V16_NIV V13_NIV 0 0 ) ) ( >= ( + 0 0 0 0 0 ( * ( - 1 ) V3_NIV ) 0 0 V2_NIV 0 0 ) ( + 0 0 0 0 0 ( * ( - 1 ) V14_NIV ) 0 0 V13_NIV 0 0 ) ) ( >= ( + 0 0 0 0 0 V3_NIV 0 ( * ( - 1 ) V5_NIV ) ( * ( - 1 ) V2_NIV ) 0 0 ) ( + 0 0 0 0 0 V14_NIV 0 ( * ( - 1 ) V16_NIV ) ( * ( - 1 ) V13_NIV ) 0 0 ) ) ( >= ( + 0 ( * ( - 1 ) V7_NIV ) 0 0 0 ( * ( - 1 ) V3_NIV ) 0 0 V2_NIV 0 0 ) ( + 0 ( * ( - 1 ) V18_NIV ) 0 0 0 ( * ( - 1 ) V14_NIV ) 0 0 V13_NIV 0 0 ) ) ( >= ( + 0 V7_NIV 0 0 0 ( * ( - 1 ) V3_NIV ) 0 ( * ( - 1 ) V5_NIV ) ( * ( - 1 ) V2_NIV ) 0 0 ) ( + 0 V18_NIV 0 0 0 ( * ( - 1 ) V14_NIV ) 0 ( * ( - 1 ) V16_NIV ) ( * ( - 1 ) V13_NIV ) 0 0 ) ) ( >= ( + 0 ( * ( - 1 ) V7_NIV ) 0 0 0 V3_NIV 0 ( * ( - 1 ) V5_NIV ) 0 0 0 ) ( + 0 ( * ( - 1 ) V18_NIV ) 0 0 0 V14_NIV 0 ( * ( - 1 ) V16_NIV ) 0 0 0 ) ) ( >= ( + 0 ( * ( - 1 ) V7_NIV ) 0 0 0 ( * ( - 1 ) V3_NIV ) 0 0 0 0 0 ) ( + 0 ( * ( - 1 ) V18_NIV ) 0 0 0 ( * ( - 1 ) V14_NIV ) 0 0 0 0 0 ) ) ( >= ( + 0 0 0 0 0 V3_NIV 0 ( * ( - 1 ) V5_NIV ) 0 0 0 ) ( + 0 0 0 0 0 V14_NIV 0 ( * ( - 1 ) V16_NIV ) 0 0 0 ) ) ( >= ( + 0 0 0 0 0 ( * ( - 1 ) V3_NIV ) 0 0 0 0 0 ) ( + 0 0 0 0 0 ( * ( - 1 ) V14_NIV ) 0 0 0 0 0 ) ) ( >= ( + 0 0 0 0 0 V3_NIV 0 ( * ( - 1 ) V5_NIV ) ( * ( - 1 ) V2_NIV ) 0 V9_NIV ) ( + 0 0 0 0 0 V14_NIV 0 ( * ( - 1 ) V16_NIV ) ( * ( - 1 ) V13_NIV ) 0 V20_NIV ) ) ( >= ( + 0 ( * ( - 1 ) V7_NIV ) 0 0 0 ( * ( - 1 ) V3_NIV ) 0 0 ( * ( - 1 ) V2_NIV ) 0 ( * ( - 1 ) V9_NIV ) ) ( + 0 ( * ( - 1 ) V18_NIV ) 0 0 0 ( * ( - 1 ) V14_NIV ) 0 0 ( * ( - 1 ) V13_NIV ) 0 ( * ( - 1 ) V20_NIV ) ) ) ( >= ( + V8_NIV 0 0 0 0 V3_NIV 0 ( * ( - 1 ) V5_NIV ) ( * ( - 1 ) V2_NIV ) 0 V9_NIV ) ( + V19_NIV 0 0 0 0 V14_NIV 0 ( * ( - 1 ) V16_NIV ) ( * ( - 1 ) V13_NIV ) 0 V20_NIV ) ) ( >= ( + ( * ( - 1 ) V8_NIV ) V7_NIV 0 0 0 ( * ( - 1 ) V3_NIV ) 0 V5_NIV 0 0 ( * ( - 1 ) V9_NIV ) ) ( + ( * ( - 1 ) V19_NIV ) V18_NIV 0 0 0 ( * ( - 1 ) V14_NIV ) 0 V16_NIV 0 0 ( * ( - 1 ) V20_NIV ) ) ) ( >= ( + ( * ( - 1 ) V8_NIV ) 0 V0_NIV 0 0 ( * ( - 1 ) V3_NIV ) 0 ( * ( - 1 ) V5_NIV ) V2_NIV 0 ( * ( - 1 ) V9_NIV ) ) ( + ( * ( - 1 ) V19_NIV ) 0 V11_NIV 0 0 ( * ( - 1 ) V14_NIV ) 0 ( * ( - 1 ) V16_NIV ) V13_NIV 0 ( * ( - 1 ) V20_NIV ) ) ) ( >= ( + V8_NIV ( * ( - 1 ) V7_NIV ) ( * ( - 1 ) V0_NIV ) 0 0 V3_NIV 0 ( * ( - 1 ) V5_NIV ) V2_NIV 0 ( * ( - 1 ) V9_NIV ) ) ( + V19_NIV ( * ( - 1 ) V18_NIV ) ( * ( - 1 ) V11_NIV ) 0 0 V14_NIV 0 ( * ( - 1 ) V16_NIV ) V13_NIV 0 ( * ( - 1 ) V20_NIV ) ) ) ( >= ( + ( * ( - 1 ) V8_NIV ) ( * ( - 1 ) V7_NIV ) ( * ( - 1 ) V0_NIV ) 0 0 ( * ( - 1 ) V3_NIV ) 0 0 V2_NIV V10_NIV V9_NIV ) ( + ( * ( - 1 ) V19_NIV ) ( * ( - 1 ) V18_NIV ) ( * ( - 1 ) V11_NIV ) 0 0 ( * ( - 1 ) V14_NIV ) 0 0 V13_NIV V21_NIV V20_NIV ) ) ( >= ( + ( * ( - 1 ) V8_NIV ) ( * ( - 1 ) V7_NIV ) V0_NIV 0 0 V3_NIV 0 V5_NIV V2_NIV ( * ( - 1 ) V10_NIV ) 0 ) ( + ( * ( - 1 ) V19_NIV ) ( * ( - 1 ) V18_NIV ) V11_NIV 0 0 V14_NIV 0 V16_NIV V13_NIV ( * ( - 1 ) V21_NIV ) 0 ) ) ) ( and ( or ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ) ( or ( = rfc8 0 ) ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ) ( or ( = rfc8 0 ) ( = rfc4 0 ) ( = rfc3 0 ) ) ( or ( = rfc4 0 ) ( = rfc3 0 ) ) ( or ( = rfc8 0 ) ( = rfc4 0 ) ( = rfc3 0 ) ) ( or ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ) ( or ( = rfc4 0 ) ( = rfc3 0 ) ) ( or ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ) ( or ( = rfc8 0 ) ( = rfc4 0 ) ( = rfc3 0 ) ) ( or ( = rfc8 0 ) ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ) ( or ( = rfc8 0 ) ( = rfc4 0 ) ( = rfc6 0 ) ) ( or ( = rfc8 0 ) ( = rfc4 0 ) ) ( or ( = rfc4 0 ) ( = rfc6 0 ) ) ( = rfc4 0 ) ( or ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ( = rfc10 0 ) ) ( or ( = rfc8 0 ) ( = rfc4 0 ) ( = rfc3 0 ) ( = rfc10 0 ) ) ( or ( = rfc9 0 ) ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ( = rfc10 0 ) ) ( or ( = rfc9 0 ) ( = rfc8 0 ) ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc10 0 ) ) ( or ( = rfc9 0 ) ( = rfc0 0 ) ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ( = rfc10 0 ) ) ( or ( = rfc9 0 ) ( = rfc8 0 ) ( = rfc0 0 ) ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ( = rfc10 0 ) ) ( or ( = rfc9 0 ) ( = rfc8 0 ) ( = rfc0 0 ) ( = rfc4 0 ) ( = rfc3 0 ) ( = rfc2 0 ) ( = rfc10 0 ) ) ( or ( = rfc9 0 ) ( = rfc8 0 ) ( = rfc0 0 ) ( = rfc4 0 ) ( = rfc6 0 ) ( = rfc3 0 ) ( = rfc2 0 ) ) ) ) ) ) ) ( or GLOBAL_NT_1 TERM_NT_1 ALL_NON_INC_0 ) ))
(check-sat)
(exit)