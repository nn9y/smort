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
(declare-fun Nl2main_x1 () Int)
(declare-fun Nl2main_y1 () Int)
(declare-fun Nl2main_x2 () Int)
(declare-fun Nl2main_y2 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun Nl2CT2 () Int)
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
(declare-fun lam6n4 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n3 () Int)
(declare-fun lam7n4 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n3 () Int)
(declare-fun lam8n4 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam11n2 () Int)
(declare-fun lam12n0 () Int)
(declare-fun lam12n1 () Int)
(declare-fun lam12n2 () Int)
(declare-fun main_x () Int)
(declare-fun main_y () Int)
(declare-fun undef3 () Int)
(declare-fun undef4 () Int)
(declare-fun lam16n0 () Int)
(declare-fun lam16n1 () Int)
(declare-fun lam16n2 () Int)
(declare-fun lam16n3 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_main_x () Int)
(declare-fun RFN1_main_y () Int)
(declare-fun lam20n0 () Int)
(declare-fun lam20n1 () Int)
(declare-fun lam20n2 () Int)
(declare-fun lam20n3 () Int)
(declare-fun lam20n4 () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam14n1 () Int)
(declare-fun lam14n2 () Int)
(declare-fun lam14n3 () Int)
(declare-fun lam15n0 () Int)
(declare-fun lam15n1 () Int)
(declare-fun lam15n2 () Int)
(declare-fun lam15n3 () Int)
(declare-fun lam18n0 () Int)
(declare-fun lam18n1 () Int)
(declare-fun lam18n2 () Int)
(declare-fun lam18n3 () Int)
(declare-fun lam18n4 () Int)
(declare-fun lam19n0 () Int)
(declare-fun lam19n1 () Int)
(declare-fun lam19n2 () Int)
(declare-fun lam19n3 () Int)
(declare-fun lam19n4 () Int)
(declare-fun lam13n0 () Int)
(declare-fun lam13n1 () Int)
(declare-fun lam13n2 () Int)
(declare-fun lam13n3 () Int)
(declare-fun lam17n0 () Int)
(declare-fun lam17n1 () Int)
(declare-fun lam17n2 () Int)
(declare-fun lam17n3 () Int)
(declare-fun lam17n4 () Int)
(assert ( and ( <= ( - 1 ) Nl2main_x1 ) ( <= Nl2main_x1 1 ) ( <= ( - 1 ) Nl2main_y1 ) ( <= Nl2main_y1 1 ) ( <= ( - 1 ) Nl2main_x2 ) ( <= Nl2main_x2 1 ) ( <= ( - 1 ) Nl2main_y2 ) ( <= Nl2main_y2 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * 6 lam0n1 ) ( * Nl2CT1 lam0n2 ) ( * Nl2CT2 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n1 ) ( * Nl2main_x1 lam0n2 ) ( * Nl2main_x2 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl2main_y1 lam0n2 ) ( * Nl2main_y2 lam0n3 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( > ( + ( * 6 lam1n1 ) ( * Nl2CT1 lam1n2 ) ( * Nl2CT2 lam1n3 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2main_x1 ( - 1 ) ) ) ( * Nl2main_y1 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * 1 lam1n1 ) ( * Nl2main_x1 lam1n2 ) ( * Nl2main_x2 lam1n3 ) ( - ( + 0 ( * Nl2main_y1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n1 ) ( * Nl2main_y1 lam1n2 ) ( * Nl2main_y2 lam1n3 ) ( - ( + 0 ( * Nl2main_x1 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * 6 lam0n1 ) ( * Nl2CT1 lam0n2 ) ( * Nl2CT2 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n1 ) ( * Nl2main_x1 lam0n2 ) ( * Nl2main_x2 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl2main_y1 lam0n2 ) ( * Nl2main_y2 lam0n3 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( > ( + ( * 6 lam2n1 ) ( * Nl2CT1 lam2n2 ) ( * Nl2CT2 lam2n3 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2main_x2 ( - 1 ) ) ) ( * Nl2main_y2 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * 1 lam2n1 ) ( * Nl2main_x1 lam2n2 ) ( * Nl2main_x2 lam2n3 ) ( - ( + 0 ( * Nl2main_y2 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n1 ) ( * Nl2main_y1 lam2n2 ) ( * Nl2main_y2 lam2n3 ) ( - ( + 0 ( * Nl2main_x2 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( > ( + ( * 6 lam3n1 ) ( * Nl2CT1 lam3n2 ) ( * Nl2CT2 lam3n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * ( - 1 ) lam3n1 ) ( * Nl2main_x1 lam3n2 ) ( * Nl2main_x2 lam3n3 ) ) 0 ) ( = ( + ( * 1 lam3n1 ) ( * Nl2main_y1 lam3n2 ) ( * Nl2main_y2 lam3n3 ) ) 0 ) ) ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( > ( + ( * 6 lam4n1 ) ( * Nl2CT1 lam4n2 ) ( * Nl2CT2 lam4n3 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2main_x1 ( - 1 ) ) ) ( * Nl2main_y1 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * ( - 1 ) lam4n1 ) ( * Nl2main_x1 lam4n2 ) ( * Nl2main_x2 lam4n3 ) ( - ( + 0 ( * Nl2main_y1 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam4n1 ) ( * Nl2main_y1 lam4n2 ) ( * Nl2main_y2 lam4n3 ) ( - ( + 0 ( * Nl2main_x1 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( > ( + ( * 6 lam3n1 ) ( * Nl2CT1 lam3n2 ) ( * Nl2CT2 lam3n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * ( - 1 ) lam3n1 ) ( * Nl2main_x1 lam3n2 ) ( * Nl2main_x2 lam3n3 ) ) 0 ) ( = ( + ( * 1 lam3n1 ) ( * Nl2main_y1 lam3n2 ) ( * Nl2main_y2 lam3n3 ) ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n3 0 ) ( > ( + ( * 6 lam5n1 ) ( * Nl2CT1 lam5n2 ) ( * Nl2CT2 lam5n3 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2main_x2 ( - 1 ) ) ) ( * Nl2main_y2 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * ( - 1 ) lam5n1 ) ( * Nl2main_x1 lam5n2 ) ( * Nl2main_x2 lam5n3 ) ( - ( + 0 ( * Nl2main_y2 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam5n1 ) ( * Nl2main_y1 lam5n2 ) ( * Nl2main_y2 lam5n3 ) ( - ( + 0 ( * Nl2main_x2 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( >= lam6n3 0 ) ( >= lam6n4 0 ) ( > ( + ( * 1 lam6n1 ) ( * 6 lam6n2 ) ( * Nl2CT1 lam6n3 ) ( * Nl2CT2 lam6n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam6n1 ) ( * 1 lam6n2 ) ( * Nl2main_x1 lam6n3 ) ( * Nl2main_x2 lam6n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * ( - 1 ) lam6n2 ) ( * Nl2main_y1 lam6n3 ) ( * Nl2main_y2 lam6n4 ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( >= lam7n4 0 ) ( > ( + ( * 1 lam7n1 ) ( * 6 lam7n2 ) ( * Nl2CT1 lam7n3 ) ( * Nl2CT2 lam7n4 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2main_x1 ( - 1 ) ) ) ( * Nl2main_y1 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * 1 lam7n1 ) ( * 1 lam7n2 ) ( * Nl2main_x1 lam7n3 ) ( * Nl2main_x2 lam7n4 ) ( - ( + 0 ( * Nl2main_y1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * ( - 1 ) lam7n2 ) ( * Nl2main_y1 lam7n3 ) ( * Nl2main_y2 lam7n4 ) ( - ( + 0 ( * Nl2main_x1 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( >= lam6n3 0 ) ( >= lam6n4 0 ) ( > ( + ( * 1 lam6n1 ) ( * 6 lam6n2 ) ( * Nl2CT1 lam6n3 ) ( * Nl2CT2 lam6n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam6n1 ) ( * 1 lam6n2 ) ( * Nl2main_x1 lam6n3 ) ( * Nl2main_x2 lam6n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * ( - 1 ) lam6n2 ) ( * Nl2main_y1 lam6n3 ) ( * Nl2main_y2 lam6n4 ) ) 0 ) ) ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( >= lam8n4 0 ) ( > ( + ( * 1 lam8n1 ) ( * 6 lam8n2 ) ( * Nl2CT1 lam8n3 ) ( * Nl2CT2 lam8n4 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2main_x2 ( - 1 ) ) ) ( * Nl2main_y2 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * 1 lam8n1 ) ( * 1 lam8n2 ) ( * Nl2main_x1 lam8n3 ) ( * Nl2main_x2 lam8n4 ) ( - ( + 0 ( * Nl2main_y2 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * ( - 1 ) lam8n2 ) ( * Nl2main_y1 lam8n3 ) ( * Nl2main_y2 lam8n4 ) ( - ( + 0 ( * Nl2main_x2 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( not ( <= ( + ( - 5 ) ( * ( - 1 ) main_x ) main_y ) 0 ) ) ( = ( + main_x ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_y ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_x1 ) main_x ) ( * ( + 0 Nl2main_y1 ) main_y ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2main_x2 ) main_x ) ( * ( + 0 Nl2main_y2 ) main_y ) ) 0 ) ) ( and ( not ( <= ( + ( - 5 ) main_x ( * ( - 1 ) main_y ) ) 0 ) ) ( = ( + main_x ( * ( - 1 ) undef3 ) ) 0 ) ( = ( + main_y ( * ( - 1 ) undef4 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_x1 ) main_x ) ( * ( + 0 Nl2main_y1 ) main_y ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2main_x2 ) main_x ) ( * ( + 0 Nl2main_y2 ) main_y ) ) 0 ) ) ))
(assert ( or ( and ( and ( and ( >= lam16n0 0 ) ( >= lam16n1 0 ) ( >= lam16n2 0 ) ( >= lam16n3 0 ) ( > ( + ( * 6 lam16n1 ) ( * Nl2CT1 lam16n2 ) ( * Nl2CT2 lam16n3 ) ( - 1 ( - ( + ( + RFN1_CT ( * RFN1_main_x ( - 1 ) ) ) ( * RFN1_main_y ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam16n0 ) ( * ( - 1 ) lam16n1 ) ( * Nl2main_x1 lam16n2 ) ( * Nl2main_x2 lam16n3 ) ( - ( - ( + 0 ( * RFN1_main_y 1 ) ) RFN1_main_x ) ) ) 0 ) ( = ( + ( * 1 lam16n1 ) ( * Nl2main_y1 lam16n2 ) ( * Nl2main_y2 lam16n3 ) ( - ( - ( + 0 ( * RFN1_main_x 1 ) ) RFN1_main_y ) ) ) 0 ) ) ( and ( >= lam20n0 0 ) ( >= lam20n1 0 ) ( >= lam20n2 0 ) ( >= lam20n3 0 ) ( >= lam20n4 0 ) ( > ( + ( * 1 lam20n1 ) ( * 6 lam20n2 ) ( * Nl2CT1 lam20n3 ) ( * Nl2CT2 lam20n4 ) ( - 1 ( - ( + ( + RFN1_CT ( * RFN1_main_x ( - 1 ) ) ) ( * RFN1_main_y ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam20n1 ) ( * 1 lam20n2 ) ( * Nl2main_x1 lam20n3 ) ( * Nl2main_x2 lam20n4 ) ( - ( - ( + 0 ( * RFN1_main_y 1 ) ) RFN1_main_x ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam20n0 ) ( * ( - 1 ) lam20n2 ) ( * Nl2main_y1 lam20n3 ) ( * Nl2main_y2 lam20n4 ) ( - ( - ( + 0 ( * RFN1_main_x 1 ) ) RFN1_main_y ) ) ) 0 ) ) ) ( or ( and ( and ( >= lam14n0 0 ) ( >= lam14n1 0 ) ( >= lam14n2 0 ) ( >= lam14n3 0 ) ( > ( + ( * 6 lam14n1 ) ( * Nl2CT1 lam14n2 ) ( * Nl2CT2 lam14n3 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam14n0 ) ( * ( - 1 ) lam14n1 ) ( * Nl2main_x1 lam14n2 ) ( * Nl2main_x2 lam14n3 ) ( - ( - RFN1_main_x ) ) ) 0 ) ( = ( + ( * 1 lam14n1 ) ( * Nl2main_y1 lam14n2 ) ( * Nl2main_y2 lam14n3 ) ( - ( - RFN1_main_y ) ) ) 0 ) ) ( and ( >= lam15n0 0 ) ( >= lam15n1 0 ) ( >= lam15n2 0 ) ( >= lam15n3 0 ) ( > ( + ( * 6 lam15n1 ) ( * Nl2CT1 lam15n2 ) ( * Nl2CT2 lam15n3 ) ( - 1 ( + ( - ( + ( + RFN1_CT ( * RFN1_main_x ( - 1 ) ) ) ( * RFN1_main_y ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam15n0 ) ( * ( - 1 ) lam15n1 ) ( * Nl2main_x1 lam15n2 ) ( * Nl2main_x2 lam15n3 ) ( - ( - ( + 0 ( * RFN1_main_y 1 ) ) RFN1_main_x ) ) ) 0 ) ( = ( + ( * 1 lam15n1 ) ( * Nl2main_y1 lam15n2 ) ( * Nl2main_y2 lam15n3 ) ( - ( - ( + 0 ( * RFN1_main_x 1 ) ) RFN1_main_y ) ) ) 0 ) ) ) ( and ( and ( >= lam18n0 0 ) ( >= lam18n1 0 ) ( >= lam18n2 0 ) ( >= lam18n3 0 ) ( >= lam18n4 0 ) ( > ( + ( * 1 lam18n1 ) ( * 6 lam18n2 ) ( * Nl2CT1 lam18n3 ) ( * Nl2CT2 lam18n4 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam18n1 ) ( * 1 lam18n2 ) ( * Nl2main_x1 lam18n3 ) ( * Nl2main_x2 lam18n4 ) ( - ( - RFN1_main_x ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam18n0 ) ( * ( - 1 ) lam18n2 ) ( * Nl2main_y1 lam18n3 ) ( * Nl2main_y2 lam18n4 ) ( - ( - RFN1_main_y ) ) ) 0 ) ) ( and ( >= lam19n0 0 ) ( >= lam19n1 0 ) ( >= lam19n2 0 ) ( >= lam19n3 0 ) ( >= lam19n4 0 ) ( > ( + ( * 1 lam19n1 ) ( * 6 lam19n2 ) ( * Nl2CT1 lam19n3 ) ( * Nl2CT2 lam19n4 ) ( - 1 ( + ( - ( + ( + RFN1_CT ( * RFN1_main_x ( - 1 ) ) ) ( * RFN1_main_y ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * 1 lam19n1 ) ( * 1 lam19n2 ) ( * Nl2main_x1 lam19n3 ) ( * Nl2main_x2 lam19n4 ) ( - ( - ( + 0 ( * RFN1_main_y 1 ) ) RFN1_main_x ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam19n0 ) ( * ( - 1 ) lam19n2 ) ( * Nl2main_y1 lam19n3 ) ( * Nl2main_y2 lam19n4 ) ( - ( - ( + 0 ( * RFN1_main_x 1 ) ) RFN1_main_y ) ) ) 0 ) ) ) ) ) ( or ( and ( >= lam13n0 0 ) ( >= lam13n1 0 ) ( >= lam13n2 0 ) ( >= lam13n3 0 ) ( > ( + ( * 6 lam13n1 ) ( * Nl2CT1 lam13n2 ) ( * Nl2CT2 lam13n3 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam13n0 ) ( * ( - 1 ) lam13n1 ) ( * Nl2main_x1 lam13n2 ) ( * Nl2main_x2 lam13n3 ) ) 0 ) ( = ( + ( * 1 lam13n1 ) ( * Nl2main_y1 lam13n2 ) ( * Nl2main_y2 lam13n3 ) ) 0 ) ) ( and ( >= lam17n0 0 ) ( >= lam17n1 0 ) ( >= lam17n2 0 ) ( >= lam17n3 0 ) ( >= lam17n4 0 ) ( > ( + ( * 1 lam17n1 ) ( * 6 lam17n2 ) ( * Nl2CT1 lam17n3 ) ( * Nl2CT2 lam17n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam17n1 ) ( * 1 lam17n2 ) ( * Nl2main_x1 lam17n3 ) ( * Nl2main_x2 lam17n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam17n0 ) ( * ( - 1 ) lam17n2 ) ( * Nl2main_y1 lam17n3 ) ( * Nl2main_y2 lam17n4 ) ) 0 ) ) ) ))
(check-sat)
(exit)