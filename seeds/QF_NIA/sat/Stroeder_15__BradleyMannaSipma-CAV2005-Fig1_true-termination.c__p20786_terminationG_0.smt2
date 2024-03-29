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
(declare-fun Nl4main_y11 () Int)
(declare-fun Nl4main_y21 () Int)
(declare-fun Nl4main_y12 () Int)
(declare-fun Nl4main_y22 () Int)
(declare-fun Nl4main_y13 () Int)
(declare-fun Nl4main_y23 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun Nl4CT1 () Int)
(declare-fun Nl4CT2 () Int)
(declare-fun Nl4CT3 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
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
(declare-fun undef3 () Int)
(declare-fun undef4 () Int)
(declare-fun main_y1 () Int)
(declare-fun main_y2 () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam14n1 () Int)
(declare-fun lam14n2 () Int)
(declare-fun lam14n3 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_main_y2 () Int)
(declare-fun RFN1_main_y1 () Int)
(declare-fun lam18n0 () Int)
(declare-fun lam18n1 () Int)
(declare-fun lam18n2 () Int)
(declare-fun lam18n3 () Int)
(declare-fun lam12n0 () Int)
(declare-fun lam12n1 () Int)
(declare-fun lam12n2 () Int)
(declare-fun lam12n3 () Int)
(declare-fun lam13n0 () Int)
(declare-fun lam13n1 () Int)
(declare-fun lam13n2 () Int)
(declare-fun lam13n3 () Int)
(declare-fun lam16n0 () Int)
(declare-fun lam16n1 () Int)
(declare-fun lam16n2 () Int)
(declare-fun lam16n3 () Int)
(declare-fun lam17n0 () Int)
(declare-fun lam17n1 () Int)
(declare-fun lam17n2 () Int)
(declare-fun lam17n3 () Int)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam11n2 () Int)
(declare-fun lam11n3 () Int)
(declare-fun lam15n0 () Int)
(declare-fun lam15n1 () Int)
(declare-fun lam15n2 () Int)
(declare-fun lam15n3 () Int)
(assert ( and ( <= ( - 1 ) Nl4main_y11 ) ( <= Nl4main_y11 1 ) ( <= ( - 1 ) Nl4main_y21 ) ( <= Nl4main_y21 1 ) ( <= ( - 1 ) Nl4main_y12 ) ( <= Nl4main_y12 1 ) ( <= ( - 1 ) Nl4main_y22 ) ( <= Nl4main_y22 1 ) ( <= ( - 1 ) Nl4main_y13 ) ( <= Nl4main_y13 1 ) ( <= ( - 1 ) Nl4main_y23 ) ( <= Nl4main_y23 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * 1 lam0n0 ) ( * Nl4CT1 lam0n1 ) ( * Nl4CT2 lam0n2 ) ( * Nl4CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl4main_y11 lam0n1 ) ( * Nl4main_y12 lam0n2 ) ( * Nl4main_y13 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl4main_y21 lam0n1 ) ( * Nl4main_y22 lam0n2 ) ( * Nl4main_y23 lam0n3 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( > ( + ( * 1 lam1n0 ) ( * Nl4CT1 lam1n1 ) ( * Nl4CT2 lam1n2 ) ( * Nl4CT3 lam1n3 ) ( - 1 ( + Nl4CT1 ( * Nl4main_y21 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * Nl4main_y11 lam1n1 ) ( * Nl4main_y12 lam1n2 ) ( * Nl4main_y13 lam1n3 ) ( - ( + ( + 0 Nl4main_y11 ) ( * Nl4main_y21 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * Nl4main_y21 lam1n1 ) ( * Nl4main_y22 lam1n2 ) ( * Nl4main_y23 lam1n3 ) ( - ( + 0 ( * Nl4main_y21 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * 1 lam0n0 ) ( * Nl4CT1 lam0n1 ) ( * Nl4CT2 lam0n2 ) ( * Nl4CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl4main_y11 lam0n1 ) ( * Nl4main_y12 lam0n2 ) ( * Nl4main_y13 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl4main_y21 lam0n1 ) ( * Nl4main_y22 lam0n2 ) ( * Nl4main_y23 lam0n3 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( > ( + ( * 1 lam2n0 ) ( * Nl4CT1 lam2n1 ) ( * Nl4CT2 lam2n2 ) ( * Nl4CT3 lam2n3 ) ( - 1 ( + Nl4CT2 ( * Nl4main_y22 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * Nl4main_y11 lam2n1 ) ( * Nl4main_y12 lam2n2 ) ( * Nl4main_y13 lam2n3 ) ( - ( + ( + 0 Nl4main_y12 ) ( * Nl4main_y22 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * Nl4main_y21 lam2n1 ) ( * Nl4main_y22 lam2n2 ) ( * Nl4main_y23 lam2n3 ) ( - ( + 0 ( * Nl4main_y22 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * 1 lam0n0 ) ( * Nl4CT1 lam0n1 ) ( * Nl4CT2 lam0n2 ) ( * Nl4CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl4main_y11 lam0n1 ) ( * Nl4main_y12 lam0n2 ) ( * Nl4main_y13 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl4main_y21 lam0n1 ) ( * Nl4main_y22 lam0n2 ) ( * Nl4main_y23 lam0n3 ) ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( > ( + ( * 1 lam3n0 ) ( * Nl4CT1 lam3n1 ) ( * Nl4CT2 lam3n2 ) ( * Nl4CT3 lam3n3 ) ( - 1 ( + Nl4CT3 ( * Nl4main_y23 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * Nl4main_y11 lam3n1 ) ( * Nl4main_y12 lam3n2 ) ( * Nl4main_y13 lam3n3 ) ( - ( + ( + 0 Nl4main_y13 ) ( * Nl4main_y23 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl4main_y21 lam3n1 ) ( * Nl4main_y22 lam3n2 ) ( * Nl4main_y23 lam3n3 ) ( - ( + 0 ( * Nl4main_y23 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( > ( + ( * 1 lam4n0 ) ( * Nl4CT1 lam4n1 ) ( * Nl4CT2 lam4n2 ) ( * Nl4CT3 lam4n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl4main_y11 lam4n1 ) ( * Nl4main_y12 lam4n2 ) ( * Nl4main_y13 lam4n3 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl4main_y21 lam4n1 ) ( * Nl4main_y22 lam4n2 ) ( * Nl4main_y23 lam4n3 ) ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n3 0 ) ( > ( + ( * 1 lam5n0 ) ( * Nl4CT1 lam5n1 ) ( * Nl4CT2 lam5n2 ) ( * Nl4CT3 lam5n3 ) ( - 1 ( + Nl4CT1 ( * Nl4main_y11 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl4main_y11 lam5n1 ) ( * Nl4main_y12 lam5n2 ) ( * Nl4main_y13 lam5n3 ) ( - ( + 0 ( * Nl4main_y11 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * Nl4main_y21 lam5n1 ) ( * Nl4main_y22 lam5n2 ) ( * Nl4main_y23 lam5n3 ) ( - ( + ( + 0 ( * Nl4main_y11 ( - 1 ) ) ) Nl4main_y21 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( > ( + ( * 1 lam4n0 ) ( * Nl4CT1 lam4n1 ) ( * Nl4CT2 lam4n2 ) ( * Nl4CT3 lam4n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl4main_y11 lam4n1 ) ( * Nl4main_y12 lam4n2 ) ( * Nl4main_y13 lam4n3 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl4main_y21 lam4n1 ) ( * Nl4main_y22 lam4n2 ) ( * Nl4main_y23 lam4n3 ) ) 0 ) ) ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( >= lam6n3 0 ) ( > ( + ( * 1 lam6n0 ) ( * Nl4CT1 lam6n1 ) ( * Nl4CT2 lam6n2 ) ( * Nl4CT3 lam6n3 ) ( - 1 ( + Nl4CT2 ( * Nl4main_y12 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * Nl4main_y11 lam6n1 ) ( * Nl4main_y12 lam6n2 ) ( * Nl4main_y13 lam6n3 ) ( - ( + 0 ( * Nl4main_y12 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * Nl4main_y21 lam6n1 ) ( * Nl4main_y22 lam6n2 ) ( * Nl4main_y23 lam6n3 ) ( - ( + ( + 0 ( * Nl4main_y12 ( - 1 ) ) ) Nl4main_y22 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( > ( + ( * 1 lam4n0 ) ( * Nl4CT1 lam4n1 ) ( * Nl4CT2 lam4n2 ) ( * Nl4CT3 lam4n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl4main_y11 lam4n1 ) ( * Nl4main_y12 lam4n2 ) ( * Nl4main_y13 lam4n3 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl4main_y21 lam4n1 ) ( * Nl4main_y22 lam4n2 ) ( * Nl4main_y23 lam4n3 ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( > ( + ( * 1 lam7n0 ) ( * Nl4CT1 lam7n1 ) ( * Nl4CT2 lam7n2 ) ( * Nl4CT3 lam7n3 ) ( - 1 ( + Nl4CT3 ( * Nl4main_y13 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * Nl4main_y11 lam7n1 ) ( * Nl4main_y12 lam7n2 ) ( * Nl4main_y13 lam7n3 ) ( - ( + 0 ( * Nl4main_y13 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * Nl4main_y21 lam7n1 ) ( * Nl4main_y22 lam7n2 ) ( * Nl4main_y23 lam7n3 ) ( - ( + ( + 0 ( * Nl4main_y13 ( - 1 ) ) ) Nl4main_y23 ) ) ) 0 ) ) ))
(assert ( and ( <= ( + 1 ( * ( - 1 ) undef3 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef4 ) ) 0 ) ( = ( + main_y1 ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_y2 ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl4CT1 ( * ( + 0 Nl4main_y11 ) main_y1 ) ( * ( + 0 Nl4main_y21 ) main_y2 ) ) 0 ) ( <= ( + Nl4CT2 ( * ( + 0 Nl4main_y12 ) main_y1 ) ( * ( + 0 Nl4main_y22 ) main_y2 ) ) 0 ) ( <= ( + Nl4CT3 ( * ( + 0 Nl4main_y13 ) main_y1 ) ( * ( + 0 Nl4main_y23 ) main_y2 ) ) 0 ) ))
(assert ( or ( and ( and ( and ( >= lam14n0 0 ) ( >= lam14n1 0 ) ( >= lam14n2 0 ) ( >= lam14n3 0 ) ( > ( + ( * 1 lam14n0 ) ( * Nl4CT1 lam14n1 ) ( * Nl4CT2 lam14n2 ) ( * Nl4CT3 lam14n3 ) ( - 1 ( - ( + RFN1_CT ( * RFN1_main_y2 0 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam14n0 ) ( * Nl4main_y11 lam14n1 ) ( * Nl4main_y12 lam14n2 ) ( * Nl4main_y13 lam14n3 ) ( - ( - ( + ( + 0 RFN1_main_y1 ) ( * RFN1_main_y2 ( - 1 ) ) ) RFN1_main_y1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam14n0 ) ( * Nl4main_y21 lam14n1 ) ( * Nl4main_y22 lam14n2 ) ( * Nl4main_y23 lam14n3 ) ( - ( - ( + 0 ( * RFN1_main_y2 1 ) ) RFN1_main_y2 ) ) ) 0 ) ) ( and ( >= lam18n0 0 ) ( >= lam18n1 0 ) ( >= lam18n2 0 ) ( >= lam18n3 0 ) ( > ( + ( * 1 lam18n0 ) ( * Nl4CT1 lam18n1 ) ( * Nl4CT2 lam18n2 ) ( * Nl4CT3 lam18n3 ) ( - 1 ( - ( + RFN1_CT ( * RFN1_main_y1 0 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam18n0 ) ( * Nl4main_y11 lam18n1 ) ( * Nl4main_y12 lam18n2 ) ( * Nl4main_y13 lam18n3 ) ( - ( - ( + 0 ( * RFN1_main_y1 1 ) ) RFN1_main_y1 ) ) ) 0 ) ( = ( + ( * 1 lam18n0 ) ( * Nl4main_y21 lam18n1 ) ( * Nl4main_y22 lam18n2 ) ( * Nl4main_y23 lam18n3 ) ( - ( - ( + ( + 0 ( * RFN1_main_y1 ( - 1 ) ) ) RFN1_main_y2 ) RFN1_main_y2 ) ) ) 0 ) ) ) ( or ( and ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( >= lam12n2 0 ) ( >= lam12n3 0 ) ( > ( + ( * 1 lam12n0 ) ( * Nl4CT1 lam12n1 ) ( * Nl4CT2 lam12n2 ) ( * Nl4CT3 lam12n3 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam12n0 ) ( * Nl4main_y11 lam12n1 ) ( * Nl4main_y12 lam12n2 ) ( * Nl4main_y13 lam12n3 ) ( - ( - RFN1_main_y1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam12n0 ) ( * Nl4main_y21 lam12n1 ) ( * Nl4main_y22 lam12n2 ) ( * Nl4main_y23 lam12n3 ) ( - ( - RFN1_main_y2 ) ) ) 0 ) ) ( and ( >= lam13n0 0 ) ( >= lam13n1 0 ) ( >= lam13n2 0 ) ( >= lam13n3 0 ) ( > ( + ( * 1 lam13n0 ) ( * Nl4CT1 lam13n1 ) ( * Nl4CT2 lam13n2 ) ( * Nl4CT3 lam13n3 ) ( - 1 ( + ( - ( + RFN1_CT ( * RFN1_main_y2 0 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * 1 lam13n0 ) ( * Nl4main_y11 lam13n1 ) ( * Nl4main_y12 lam13n2 ) ( * Nl4main_y13 lam13n3 ) ( - ( - ( + ( + 0 RFN1_main_y1 ) ( * RFN1_main_y2 ( - 1 ) ) ) RFN1_main_y1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam13n0 ) ( * Nl4main_y21 lam13n1 ) ( * Nl4main_y22 lam13n2 ) ( * Nl4main_y23 lam13n3 ) ( - ( - ( + 0 ( * RFN1_main_y2 1 ) ) RFN1_main_y2 ) ) ) 0 ) ) ) ( and ( and ( >= lam16n0 0 ) ( >= lam16n1 0 ) ( >= lam16n2 0 ) ( >= lam16n3 0 ) ( > ( + ( * 1 lam16n0 ) ( * Nl4CT1 lam16n1 ) ( * Nl4CT2 lam16n2 ) ( * Nl4CT3 lam16n3 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam16n0 ) ( * Nl4main_y11 lam16n1 ) ( * Nl4main_y12 lam16n2 ) ( * Nl4main_y13 lam16n3 ) ( - ( - RFN1_main_y1 ) ) ) 0 ) ( = ( + ( * 1 lam16n0 ) ( * Nl4main_y21 lam16n1 ) ( * Nl4main_y22 lam16n2 ) ( * Nl4main_y23 lam16n3 ) ( - ( - RFN1_main_y2 ) ) ) 0 ) ) ( and ( >= lam17n0 0 ) ( >= lam17n1 0 ) ( >= lam17n2 0 ) ( >= lam17n3 0 ) ( > ( + ( * 1 lam17n0 ) ( * Nl4CT1 lam17n1 ) ( * Nl4CT2 lam17n2 ) ( * Nl4CT3 lam17n3 ) ( - 1 ( + ( - ( + RFN1_CT ( * RFN1_main_y1 0 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam17n0 ) ( * Nl4main_y11 lam17n1 ) ( * Nl4main_y12 lam17n2 ) ( * Nl4main_y13 lam17n3 ) ( - ( - ( + 0 ( * RFN1_main_y1 1 ) ) RFN1_main_y1 ) ) ) 0 ) ( = ( + ( * 1 lam17n0 ) ( * Nl4main_y21 lam17n1 ) ( * Nl4main_y22 lam17n2 ) ( * Nl4main_y23 lam17n3 ) ( - ( - ( + ( + 0 ( * RFN1_main_y1 ( - 1 ) ) ) RFN1_main_y2 ) RFN1_main_y2 ) ) ) 0 ) ) ) ) ) ( or ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( >= lam11n3 0 ) ( > ( + ( * 1 lam11n0 ) ( * Nl4CT1 lam11n1 ) ( * Nl4CT2 lam11n2 ) ( * Nl4CT3 lam11n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam11n0 ) ( * Nl4main_y11 lam11n1 ) ( * Nl4main_y12 lam11n2 ) ( * Nl4main_y13 lam11n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam11n0 ) ( * Nl4main_y21 lam11n1 ) ( * Nl4main_y22 lam11n2 ) ( * Nl4main_y23 lam11n3 ) ) 0 ) ) ( and ( >= lam15n0 0 ) ( >= lam15n1 0 ) ( >= lam15n2 0 ) ( >= lam15n3 0 ) ( > ( + ( * 1 lam15n0 ) ( * Nl4CT1 lam15n1 ) ( * Nl4CT2 lam15n2 ) ( * Nl4CT3 lam15n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam15n0 ) ( * Nl4main_y11 lam15n1 ) ( * Nl4main_y12 lam15n2 ) ( * Nl4main_y13 lam15n3 ) ) 0 ) ( = ( + ( * 1 lam15n0 ) ( * Nl4main_y21 lam15n1 ) ( * Nl4main_y22 lam15n2 ) ( * Nl4main_y23 lam15n3 ) ) 0 ) ) ) ))
(check-sat)
(exit)
