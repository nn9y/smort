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
(declare-fun Nl2main_x2 () Int)
(declare-fun Nl2main_x3 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam0n4 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun Nl2CT2 () Int)
(declare-fun Nl2CT3 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam3n4 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam4n3 () Int)
(declare-fun lam4n4 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam5n3 () Int)
(declare-fun lam5n4 () Int)
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
(declare-fun lam9n3 () Int)
(declare-fun lam9n4 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n3 () Int)
(declare-fun lam10n4 () Int)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam11n2 () Int)
(declare-fun lam11n3 () Int)
(declare-fun lam11n4 () Int)
(declare-fun lam12n0 () Int)
(declare-fun lam13n0 () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam15n0 () Int)
(declare-fun lam16n0 () Int)
(declare-fun lam17n0 () Int)
(declare-fun main_x () Int)
(declare-fun lam21n0 () Int)
(declare-fun lam21n1 () Int)
(declare-fun lam21n2 () Int)
(declare-fun lam21n3 () Int)
(declare-fun lam21n4 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_main_x () Int)
(declare-fun lam25n0 () Int)
(declare-fun lam25n1 () Int)
(declare-fun lam25n2 () Int)
(declare-fun lam25n3 () Int)
(declare-fun lam25n4 () Int)
(declare-fun lam19n0 () Int)
(declare-fun lam19n1 () Int)
(declare-fun lam19n2 () Int)
(declare-fun lam19n3 () Int)
(declare-fun lam19n4 () Int)
(declare-fun lam20n0 () Int)
(declare-fun lam20n1 () Int)
(declare-fun lam20n2 () Int)
(declare-fun lam20n3 () Int)
(declare-fun lam20n4 () Int)
(declare-fun lam23n0 () Int)
(declare-fun lam23n1 () Int)
(declare-fun lam23n2 () Int)
(declare-fun lam23n3 () Int)
(declare-fun lam23n4 () Int)
(declare-fun lam24n0 () Int)
(declare-fun lam24n1 () Int)
(declare-fun lam24n2 () Int)
(declare-fun lam24n3 () Int)
(declare-fun lam24n4 () Int)
(declare-fun lam18n0 () Int)
(declare-fun lam18n1 () Int)
(declare-fun lam18n2 () Int)
(declare-fun lam18n3 () Int)
(declare-fun lam18n4 () Int)
(declare-fun lam22n0 () Int)
(declare-fun lam22n1 () Int)
(declare-fun lam22n2 () Int)
(declare-fun lam22n3 () Int)
(declare-fun lam22n4 () Int)
(assert ( and ( <= ( - 35 ) Nl2main_x1 ) ( <= Nl2main_x1 35 ) ( <= ( - 35 ) Nl2main_x2 ) ( <= Nl2main_x2 35 ) ( <= ( - 35 ) Nl2main_x3 ) ( <= Nl2main_x3 35 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( > ( + ( * ( - 5 ) lam0n0 ) ( * 1 lam0n1 ) ( * Nl2CT1 lam0n2 ) ( * Nl2CT2 lam0n3 ) ( * Nl2CT3 lam0n4 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n1 ) ( * Nl2main_x1 lam0n2 ) ( * Nl2main_x2 lam0n3 ) ( * Nl2main_x3 lam0n4 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( >= lam1n4 0 ) ( > ( + ( * ( - 5 ) lam1n0 ) ( * 1 lam1n1 ) ( * Nl2CT1 lam1n2 ) ( * Nl2CT2 lam1n3 ) ( * Nl2CT3 lam1n4 ) ( - 1 ( + Nl2CT1 ( * Nl2main_x1 ( - 5 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * 1 lam1n1 ) ( * Nl2main_x1 lam1n2 ) ( * Nl2main_x2 lam1n3 ) ( * Nl2main_x3 lam1n4 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( > ( + ( * ( - 5 ) lam0n0 ) ( * 1 lam0n1 ) ( * Nl2CT1 lam0n2 ) ( * Nl2CT2 lam0n3 ) ( * Nl2CT3 lam0n4 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n1 ) ( * Nl2main_x1 lam0n2 ) ( * Nl2main_x2 lam0n3 ) ( * Nl2main_x3 lam0n4 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( >= lam2n4 0 ) ( > ( + ( * ( - 5 ) lam2n0 ) ( * 1 lam2n1 ) ( * Nl2CT1 lam2n2 ) ( * Nl2CT2 lam2n3 ) ( * Nl2CT3 lam2n4 ) ( - 1 ( + Nl2CT2 ( * Nl2main_x2 ( - 5 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * 1 lam2n1 ) ( * Nl2main_x1 lam2n2 ) ( * Nl2main_x2 lam2n3 ) ( * Nl2main_x3 lam2n4 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( > ( + ( * ( - 5 ) lam0n0 ) ( * 1 lam0n1 ) ( * Nl2CT1 lam0n2 ) ( * Nl2CT2 lam0n3 ) ( * Nl2CT3 lam0n4 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * 1 lam0n1 ) ( * Nl2main_x1 lam0n2 ) ( * Nl2main_x2 lam0n3 ) ( * Nl2main_x3 lam0n4 ) ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( >= lam3n4 0 ) ( > ( + ( * ( - 5 ) lam3n0 ) ( * 1 lam3n1 ) ( * Nl2CT1 lam3n2 ) ( * Nl2CT2 lam3n3 ) ( * Nl2CT3 lam3n4 ) ( - 1 ( + Nl2CT3 ( * Nl2main_x3 ( - 5 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * 1 lam3n1 ) ( * Nl2main_x1 lam3n2 ) ( * Nl2main_x2 lam3n3 ) ( * Nl2main_x3 lam3n4 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( >= lam4n4 0 ) ( > ( + ( * ( - 35 ) lam4n0 ) ( * 31 lam4n1 ) ( * Nl2CT1 lam4n2 ) ( * Nl2CT2 lam4n3 ) ( * Nl2CT3 lam4n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * ( - 1 ) lam4n1 ) ( * Nl2main_x1 lam4n2 ) ( * Nl2main_x2 lam4n3 ) ( * Nl2main_x3 lam4n4 ) ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n3 0 ) ( >= lam5n4 0 ) ( > ( + ( * ( - 35 ) lam5n0 ) ( * 31 lam5n1 ) ( * Nl2CT1 lam5n2 ) ( * Nl2CT2 lam5n3 ) ( * Nl2CT3 lam5n4 ) ( - 1 ( + Nl2CT1 ( * Nl2main_x1 35 ) ) ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * ( - 1 ) lam5n1 ) ( * Nl2main_x1 lam5n2 ) ( * Nl2main_x2 lam5n3 ) ( * Nl2main_x3 lam5n4 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( >= lam4n4 0 ) ( > ( + ( * ( - 35 ) lam4n0 ) ( * 31 lam4n1 ) ( * Nl2CT1 lam4n2 ) ( * Nl2CT2 lam4n3 ) ( * Nl2CT3 lam4n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * ( - 1 ) lam4n1 ) ( * Nl2main_x1 lam4n2 ) ( * Nl2main_x2 lam4n3 ) ( * Nl2main_x3 lam4n4 ) ) 0 ) ) ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( >= lam6n3 0 ) ( >= lam6n4 0 ) ( > ( + ( * ( - 35 ) lam6n0 ) ( * 31 lam6n1 ) ( * Nl2CT1 lam6n2 ) ( * Nl2CT2 lam6n3 ) ( * Nl2CT3 lam6n4 ) ( - 1 ( + Nl2CT2 ( * Nl2main_x2 35 ) ) ) ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * ( - 1 ) lam6n1 ) ( * Nl2main_x1 lam6n2 ) ( * Nl2main_x2 lam6n3 ) ( * Nl2main_x3 lam6n4 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( >= lam4n4 0 ) ( > ( + ( * ( - 35 ) lam4n0 ) ( * 31 lam4n1 ) ( * Nl2CT1 lam4n2 ) ( * Nl2CT2 lam4n3 ) ( * Nl2CT3 lam4n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * ( - 1 ) lam4n1 ) ( * Nl2main_x1 lam4n2 ) ( * Nl2main_x2 lam4n3 ) ( * Nl2main_x3 lam4n4 ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( >= lam7n4 0 ) ( > ( + ( * ( - 35 ) lam7n0 ) ( * 31 lam7n1 ) ( * Nl2CT1 lam7n2 ) ( * Nl2CT2 lam7n3 ) ( * Nl2CT3 lam7n4 ) ( - 1 ( + Nl2CT3 ( * Nl2main_x3 35 ) ) ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * ( - 1 ) lam7n1 ) ( * Nl2main_x1 lam7n2 ) ( * Nl2main_x2 lam7n3 ) ( * Nl2main_x3 lam7n4 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( >= lam8n4 0 ) ( > ( + ( * ( - 30 ) lam8n0 ) ( * 9 lam8n1 ) ( * Nl2CT1 lam8n2 ) ( * Nl2CT2 lam8n3 ) ( * Nl2CT3 lam8n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * ( - 1 ) lam8n1 ) ( * Nl2main_x1 lam8n2 ) ( * Nl2main_x2 lam8n3 ) ( * Nl2main_x3 lam8n4 ) ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( >= lam9n3 0 ) ( >= lam9n4 0 ) ( > ( + ( * ( - 30 ) lam9n0 ) ( * 9 lam9n1 ) ( * Nl2CT1 lam9n2 ) ( * Nl2CT2 lam9n3 ) ( * Nl2CT3 lam9n4 ) ( - 1 ( + Nl2CT1 ( * Nl2main_x1 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * ( - 1 ) lam9n1 ) ( * Nl2main_x1 lam9n2 ) ( * Nl2main_x2 lam9n3 ) ( * Nl2main_x3 lam9n4 ) ( - ( + 0 ( * Nl2main_x1 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( >= lam8n4 0 ) ( > ( + ( * ( - 30 ) lam8n0 ) ( * 9 lam8n1 ) ( * Nl2CT1 lam8n2 ) ( * Nl2CT2 lam8n3 ) ( * Nl2CT3 lam8n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * ( - 1 ) lam8n1 ) ( * Nl2main_x1 lam8n2 ) ( * Nl2main_x2 lam8n3 ) ( * Nl2main_x3 lam8n4 ) ) 0 ) ) ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( >= lam10n3 0 ) ( >= lam10n4 0 ) ( > ( + ( * ( - 30 ) lam10n0 ) ( * 9 lam10n1 ) ( * Nl2CT1 lam10n2 ) ( * Nl2CT2 lam10n3 ) ( * Nl2CT3 lam10n4 ) ( - 1 ( + Nl2CT2 ( * Nl2main_x2 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * ( - 1 ) lam10n1 ) ( * Nl2main_x1 lam10n2 ) ( * Nl2main_x2 lam10n3 ) ( * Nl2main_x3 lam10n4 ) ( - ( + 0 ( * Nl2main_x2 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( >= lam8n4 0 ) ( > ( + ( * ( - 30 ) lam8n0 ) ( * 9 lam8n1 ) ( * Nl2CT1 lam8n2 ) ( * Nl2CT2 lam8n3 ) ( * Nl2CT3 lam8n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * ( - 1 ) lam8n1 ) ( * Nl2main_x1 lam8n2 ) ( * Nl2main_x2 lam8n3 ) ( * Nl2main_x3 lam8n4 ) ) 0 ) ) ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( >= lam11n3 0 ) ( >= lam11n4 0 ) ( > ( + ( * ( - 30 ) lam11n0 ) ( * 9 lam11n1 ) ( * Nl2CT1 lam11n2 ) ( * Nl2CT2 lam11n3 ) ( * Nl2CT3 lam11n4 ) ( - 1 ( + Nl2CT3 ( * Nl2main_x3 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * 1 lam11n0 ) ( * ( - 1 ) lam11n1 ) ( * Nl2main_x1 lam11n2 ) ( * Nl2main_x2 lam11n3 ) ( * Nl2main_x3 lam11n4 ) ( - ( + 0 ( * Nl2main_x3 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( not ( <= ( + ( - 8 ) main_x ) 0 ) ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_x1 ) main_x ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2main_x2 ) main_x ) ) 0 ) ( <= ( + Nl2CT3 ( * ( + 0 Nl2main_x3 ) main_x ) ) 0 ) ) ( and ( not ( <= ( * ( - 1 ) main_x ) 0 ) ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_x1 ) main_x ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2main_x2 ) main_x ) ) 0 ) ( <= ( + Nl2CT3 ( * ( + 0 Nl2main_x3 ) main_x ) ) 0 ) ) ))
(assert ( or ( and ( and ( and ( >= lam21n0 0 ) ( >= lam21n1 0 ) ( >= lam21n2 0 ) ( >= lam21n3 0 ) ( >= lam21n4 0 ) ( > ( + ( * ( - 5 ) lam21n0 ) ( * 1 lam21n1 ) ( * Nl2CT1 lam21n2 ) ( * Nl2CT2 lam21n3 ) ( * Nl2CT3 lam21n4 ) ( - 1 ( - ( + RFN1_CT ( * RFN1_main_x ( - 5 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam21n0 ) ( * 1 lam21n1 ) ( * Nl2main_x1 lam21n2 ) ( * Nl2main_x2 lam21n3 ) ( * Nl2main_x3 lam21n4 ) ( - ( - RFN1_main_x ) ) ) 0 ) ) ( and ( >= lam25n0 0 ) ( >= lam25n1 0 ) ( >= lam25n2 0 ) ( >= lam25n3 0 ) ( >= lam25n4 0 ) ( > ( + ( * ( - 35 ) lam25n0 ) ( * 31 lam25n1 ) ( * Nl2CT1 lam25n2 ) ( * Nl2CT2 lam25n3 ) ( * Nl2CT3 lam25n4 ) ( - 1 ( - ( + RFN1_CT ( * RFN1_main_x 35 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam25n0 ) ( * ( - 1 ) lam25n1 ) ( * Nl2main_x1 lam25n2 ) ( * Nl2main_x2 lam25n3 ) ( * Nl2main_x3 lam25n4 ) ( - ( - RFN1_main_x ) ) ) 0 ) ) ) ( or ( and ( and ( >= lam19n0 0 ) ( >= lam19n1 0 ) ( >= lam19n2 0 ) ( >= lam19n3 0 ) ( >= lam19n4 0 ) ( > ( + ( * ( - 5 ) lam19n0 ) ( * 1 lam19n1 ) ( * Nl2CT1 lam19n2 ) ( * Nl2CT2 lam19n3 ) ( * Nl2CT3 lam19n4 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam19n0 ) ( * 1 lam19n1 ) ( * Nl2main_x1 lam19n2 ) ( * Nl2main_x2 lam19n3 ) ( * Nl2main_x3 lam19n4 ) ( - ( - RFN1_main_x ) ) ) 0 ) ) ( and ( >= lam20n0 0 ) ( >= lam20n1 0 ) ( >= lam20n2 0 ) ( >= lam20n3 0 ) ( >= lam20n4 0 ) ( > ( + ( * ( - 5 ) lam20n0 ) ( * 1 lam20n1 ) ( * Nl2CT1 lam20n2 ) ( * Nl2CT2 lam20n3 ) ( * Nl2CT3 lam20n4 ) ( - 1 ( + ( - ( + RFN1_CT ( * RFN1_main_x ( - 5 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam20n0 ) ( * 1 lam20n1 ) ( * Nl2main_x1 lam20n2 ) ( * Nl2main_x2 lam20n3 ) ( * Nl2main_x3 lam20n4 ) ( - ( - RFN1_main_x ) ) ) 0 ) ) ) ( and ( and ( >= lam23n0 0 ) ( >= lam23n1 0 ) ( >= lam23n2 0 ) ( >= lam23n3 0 ) ( >= lam23n4 0 ) ( > ( + ( * ( - 35 ) lam23n0 ) ( * 31 lam23n1 ) ( * Nl2CT1 lam23n2 ) ( * Nl2CT2 lam23n3 ) ( * Nl2CT3 lam23n4 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam23n0 ) ( * ( - 1 ) lam23n1 ) ( * Nl2main_x1 lam23n2 ) ( * Nl2main_x2 lam23n3 ) ( * Nl2main_x3 lam23n4 ) ( - ( - RFN1_main_x ) ) ) 0 ) ) ( and ( >= lam24n0 0 ) ( >= lam24n1 0 ) ( >= lam24n2 0 ) ( >= lam24n3 0 ) ( >= lam24n4 0 ) ( > ( + ( * ( - 35 ) lam24n0 ) ( * 31 lam24n1 ) ( * Nl2CT1 lam24n2 ) ( * Nl2CT2 lam24n3 ) ( * Nl2CT3 lam24n4 ) ( - 1 ( + ( - ( + RFN1_CT ( * RFN1_main_x 35 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * 1 lam24n0 ) ( * ( - 1 ) lam24n1 ) ( * Nl2main_x1 lam24n2 ) ( * Nl2main_x2 lam24n3 ) ( * Nl2main_x3 lam24n4 ) ( - ( - RFN1_main_x ) ) ) 0 ) ) ) ) ) ( or ( and ( >= lam18n0 0 ) ( >= lam18n1 0 ) ( >= lam18n2 0 ) ( >= lam18n3 0 ) ( >= lam18n4 0 ) ( > ( + ( * ( - 5 ) lam18n0 ) ( * 1 lam18n1 ) ( * Nl2CT1 lam18n2 ) ( * Nl2CT2 lam18n3 ) ( * Nl2CT3 lam18n4 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam18n0 ) ( * 1 lam18n1 ) ( * Nl2main_x1 lam18n2 ) ( * Nl2main_x2 lam18n3 ) ( * Nl2main_x3 lam18n4 ) ) 0 ) ) ( and ( >= lam22n0 0 ) ( >= lam22n1 0 ) ( >= lam22n2 0 ) ( >= lam22n3 0 ) ( >= lam22n4 0 ) ( > ( + ( * ( - 35 ) lam22n0 ) ( * 31 lam22n1 ) ( * Nl2CT1 lam22n2 ) ( * Nl2CT2 lam22n3 ) ( * Nl2CT3 lam22n4 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam22n0 ) ( * ( - 1 ) lam22n1 ) ( * Nl2main_x1 lam22n2 ) ( * Nl2main_x2 lam22n3 ) ( * Nl2main_x3 lam22n4 ) ) 0 ) ) ) ))
(check-sat)
(exit)