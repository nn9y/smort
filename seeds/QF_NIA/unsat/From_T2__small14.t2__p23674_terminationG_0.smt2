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
(set-info :status unsat)
(declare-fun Nl5ox^01 () Int)
(declare-fun Nl5sx^01 () Int)
(declare-fun Nl5x^01 () Int)
(declare-fun Nl5y^01 () Int)
(declare-fun Nl5z^01 () Int)
(declare-fun lam0n0 () Int)
(declare-fun Nl5CT1 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam12n0 () Int)
(declare-fun c^0 () Int)
(declare-fun ox^0 () Int)
(declare-fun sx^0 () Int)
(declare-fun x^0 () Int)
(declare-fun y^0 () Int)
(declare-fun z^0 () Int)
(declare-fun lam16n0 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_ox^0 () Int)
(declare-fun RFN1_sx^0 () Int)
(declare-fun RFN1_x^0 () Int)
(declare-fun RFN1_y^0 () Int)
(declare-fun RFN1_z^0 () Int)
(declare-fun lam20n0 () Int)
(declare-fun lam24n0 () Int)
(declare-fun lam24n1 () Int)
(declare-fun lam28n0 () Int)
(declare-fun lam28n1 () Int)
(declare-fun lam32n0 () Int)
(declare-fun lam32n1 () Int)
(declare-fun lam36n0 () Int)
(declare-fun lam36n1 () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam15n0 () Int)
(declare-fun lam18n0 () Int)
(declare-fun lam19n0 () Int)
(declare-fun lam22n0 () Int)
(declare-fun lam22n1 () Int)
(declare-fun lam23n0 () Int)
(declare-fun lam23n1 () Int)
(declare-fun lam26n0 () Int)
(declare-fun lam26n1 () Int)
(declare-fun lam27n0 () Int)
(declare-fun lam27n1 () Int)
(declare-fun lam30n0 () Int)
(declare-fun lam30n1 () Int)
(declare-fun lam31n0 () Int)
(declare-fun lam31n1 () Int)
(declare-fun lam34n0 () Int)
(declare-fun lam34n1 () Int)
(declare-fun lam35n0 () Int)
(declare-fun lam35n1 () Int)
(declare-fun lam13n0 () Int)
(declare-fun lam17n0 () Int)
(declare-fun lam21n0 () Int)
(declare-fun lam21n1 () Int)
(declare-fun lam25n0 () Int)
(declare-fun lam25n1 () Int)
(declare-fun lam29n0 () Int)
(declare-fun lam29n1 () Int)
(declare-fun lam33n0 () Int)
(declare-fun lam33n1 () Int)
(assert ( and ( <= ( - 1 ) Nl5ox^01 ) ( <= Nl5ox^01 1 ) ( <= ( - 1 ) Nl5sx^01 ) ( <= Nl5sx^01 1 ) ( <= ( - 1 ) Nl5x^01 ) ( <= Nl5x^01 1 ) ( <= ( - 1 ) Nl5y^01 ) ( <= Nl5y^01 1 ) ( <= ( - 1 ) Nl5z^01 ) ( <= Nl5z^01 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( > ( + ( * Nl5CT1 lam0n0 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam0n0 ) 0 ) ( = ( * Nl5sx^01 lam0n0 ) 0 ) ( = ( * Nl5x^01 lam0n0 ) 0 ) ( = ( * Nl5y^01 lam0n0 ) 0 ) ( = ( * Nl5z^01 lam0n0 ) 0 ) ) ( and ( >= lam1n0 0 ) ( > ( + ( * Nl5CT1 lam1n0 ) ( - 1 ( + ( + ( + ( + Nl5CT1 ( * Nl5ox^01 0 ) ) ( * Nl5sx^01 0 ) ) ( * Nl5x^01 0 ) ) ( * Nl5y^01 ( - 1 ) ) ) ) ) 0 ) ( = ( * Nl5ox^01 lam1n0 ) 0 ) ( = ( * Nl5sx^01 lam1n0 ) 0 ) ( = ( + ( * Nl5x^01 lam1n0 ) ( - ( + ( + 0 ( * Nl5ox^01 1 ) ) ( * Nl5sx^01 1 ) ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam1n0 ) ( - ( + 0 ( * Nl5y^01 1 ) ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam1n0 ) ( - ( + ( + 0 ( * Nl5x^01 1 ) ) Nl5z^01 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam2n0 0 ) ( > ( + ( * Nl5CT1 lam2n0 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam2n0 ) 0 ) ( = ( * Nl5sx^01 lam2n0 ) 0 ) ( = ( * Nl5x^01 lam2n0 ) 0 ) ( = ( * Nl5y^01 lam2n0 ) 0 ) ( = ( * Nl5z^01 lam2n0 ) 0 ) ) ( and ( >= lam3n0 0 ) ( > ( + ( * Nl5CT1 lam3n0 ) ( - 1 ( + ( + ( + Nl5CT1 ( * Nl5ox^01 0 ) ) ( * Nl5sx^01 0 ) ) ( * Nl5x^01 ( - 1 ) ) ) ) ) 0 ) ( = ( * Nl5ox^01 lam3n0 ) 0 ) ( = ( * Nl5sx^01 lam3n0 ) 0 ) ( = ( + ( * Nl5x^01 lam3n0 ) ( - ( + ( + ( + 0 ( * Nl5ox^01 1 ) ) ( * Nl5sx^01 1 ) ) ( * Nl5x^01 1 ) ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam3n0 ) ( - ( + 0 Nl5y^01 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam3n0 ) ( - ( + 0 Nl5z^01 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( > ( + ( * 1 lam4n0 ) ( * Nl5CT1 lam4n1 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam4n1 ) 0 ) ( = ( * Nl5sx^01 lam4n1 ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl5x^01 lam4n1 ) ) 0 ) ( = ( * Nl5y^01 lam4n1 ) 0 ) ( = ( * Nl5z^01 lam4n1 ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( > ( + ( * 1 lam5n0 ) ( * Nl5CT1 lam5n1 ) ( - 1 ( + ( + Nl5CT1 ( * Nl5x^01 0 ) ) ( * Nl5y^01 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam5n1 ) ( - ( + 0 Nl5ox^01 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam5n1 ) ( - ( + 0 Nl5sx^01 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl5x^01 lam5n1 ) ) 0 ) ( = ( + ( * Nl5y^01 lam5n1 ) ( - ( + 0 ( * Nl5y^01 1 ) ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam5n1 ) ( - ( + ( + 0 ( * Nl5x^01 1 ) ) Nl5z^01 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( > ( + ( * 1 lam6n0 ) ( * Nl5CT1 lam6n1 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam6n1 ) 0 ) ( = ( * Nl5sx^01 lam6n1 ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * Nl5x^01 lam6n1 ) ) 0 ) ( = ( * Nl5y^01 lam6n1 ) 0 ) ( = ( * Nl5z^01 lam6n1 ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( > ( + ( * 1 lam7n0 ) ( * Nl5CT1 lam7n1 ) ( - 1 ( + Nl5CT1 ( * Nl5x^01 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam7n1 ) ( - ( + 0 Nl5ox^01 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam7n1 ) ( - ( + 0 Nl5sx^01 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * Nl5x^01 lam7n1 ) ( - ( + 0 ( * Nl5x^01 1 ) ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam7n1 ) ( - ( + 0 Nl5y^01 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam7n1 ) ( - ( + 0 Nl5z^01 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( > ( + ( * 1 lam8n0 ) ( * Nl5CT1 lam8n1 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam8n1 ) 0 ) ( = ( * Nl5sx^01 lam8n1 ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * Nl5x^01 lam8n1 ) ) 0 ) ( = ( * Nl5y^01 lam8n1 ) 0 ) ( = ( * Nl5z^01 lam8n1 ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( > ( + ( * 1 lam9n0 ) ( * Nl5CT1 lam9n1 ) ( - 1 ( + ( + ( + Nl5CT1 ( * Nl5sx^01 0 ) ) ( * Nl5x^01 0 ) ) ( * Nl5y^01 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam9n1 ) ( - ( + 0 Nl5ox^01 ) ) ) 0 ) ( = ( * Nl5sx^01 lam9n1 ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * Nl5x^01 lam9n1 ) ( - ( + 0 ( * Nl5sx^01 1 ) ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam9n1 ) ( - ( + 0 ( * Nl5y^01 1 ) ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam9n1 ) ( - ( + ( + 0 ( * Nl5x^01 1 ) ) Nl5z^01 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( > ( + ( * 1 lam10n0 ) ( * Nl5CT1 lam10n1 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam10n1 ) 0 ) ( = ( * Nl5sx^01 lam10n1 ) 0 ) ( = ( + ( * ( - 1 ) lam10n0 ) ( * Nl5x^01 lam10n1 ) ) 0 ) ( = ( * Nl5y^01 lam10n1 ) 0 ) ( = ( * Nl5z^01 lam10n1 ) 0 ) ) ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( > ( + ( * 1 lam11n0 ) ( * Nl5CT1 lam11n1 ) ( - 1 ( + ( + Nl5CT1 ( * Nl5sx^01 0 ) ) ( * Nl5x^01 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam11n1 ) ( - ( + 0 Nl5ox^01 ) ) ) 0 ) ( = ( * Nl5sx^01 lam11n1 ) 0 ) ( = ( + ( * ( - 1 ) lam11n0 ) ( * Nl5x^01 lam11n1 ) ( - ( + ( + 0 ( * Nl5sx^01 1 ) ) ( * Nl5x^01 1 ) ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam11n1 ) ( - ( + 0 Nl5y^01 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam11n1 ) ( - ( + 0 Nl5z^01 ) ) ) 0 ) ) ))
(assert ( and ( = c^0 0 ) ( <= ( + Nl5CT1 ( * ( + 0 Nl5ox^01 ) ox^0 ) ( * ( + 0 Nl5sx^01 ) sx^0 ) ( * ( + 0 Nl5x^01 ) x^0 ) ( * ( + 0 Nl5y^01 ) y^0 ) ( * ( + 0 Nl5z^01 ) z^0 ) ) 0 ) ))
(assert ( or ( and ( and ( and ( >= lam16n0 0 ) ( > ( + ( * Nl5CT1 lam16n0 ) ( - 1 ( - ( + ( + ( + ( + RFN1_CT ( * RFN1_ox^0 0 ) ) ( * RFN1_sx^0 0 ) ) ( * RFN1_x^0 0 ) ) ( * RFN1_y^0 ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam16n0 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam16n0 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * Nl5x^01 lam16n0 ) ( - ( - ( + ( + 0 ( * RFN1_ox^0 1 ) ) ( * RFN1_sx^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam16n0 ) ( - ( - ( + 0 ( * RFN1_y^0 1 ) ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam16n0 ) ( - ( - ( + ( + 0 ( * RFN1_x^0 1 ) ) RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam20n0 0 ) ( > ( + ( * Nl5CT1 lam20n0 ) ( - 1 ( - ( + ( + ( + RFN1_CT ( * RFN1_ox^0 0 ) ) ( * RFN1_sx^0 0 ) ) ( * RFN1_x^0 ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam20n0 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam20n0 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * Nl5x^01 lam20n0 ) ( - ( - ( + ( + ( + 0 ( * RFN1_ox^0 1 ) ) ( * RFN1_sx^0 1 ) ) ( * RFN1_x^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam20n0 ) ( - ( - ( + 0 RFN1_y^0 ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam20n0 ) ( - ( - ( + 0 RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam24n0 0 ) ( >= lam24n1 0 ) ( > ( + ( * 1 lam24n0 ) ( * Nl5CT1 lam24n1 ) ( - 1 ( - ( + ( + RFN1_CT ( * RFN1_x^0 0 ) ) ( * RFN1_y^0 ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam24n1 ) ( - ( - ( + 0 RFN1_ox^0 ) RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam24n1 ) ( - ( - ( + 0 RFN1_sx^0 ) RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam24n0 ) ( * Nl5x^01 lam24n1 ) ( - ( - RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam24n1 ) ( - ( - ( + 0 ( * RFN1_y^0 1 ) ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam24n1 ) ( - ( - ( + ( + 0 ( * RFN1_x^0 1 ) ) RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam28n0 0 ) ( >= lam28n1 0 ) ( > ( + ( * 1 lam28n0 ) ( * Nl5CT1 lam28n1 ) ( - 1 ( - ( + RFN1_CT ( * RFN1_x^0 ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam28n1 ) ( - ( - ( + 0 RFN1_ox^0 ) RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam28n1 ) ( - ( - ( + 0 RFN1_sx^0 ) RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam28n0 ) ( * Nl5x^01 lam28n1 ) ( - ( - ( + 0 ( * RFN1_x^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam28n1 ) ( - ( - ( + 0 RFN1_y^0 ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam28n1 ) ( - ( - ( + 0 RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam32n0 0 ) ( >= lam32n1 0 ) ( > ( + ( * 1 lam32n0 ) ( * Nl5CT1 lam32n1 ) ( - 1 ( - ( + ( + ( + RFN1_CT ( * RFN1_sx^0 0 ) ) ( * RFN1_x^0 0 ) ) ( * RFN1_y^0 ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam32n1 ) ( - ( - ( + 0 RFN1_ox^0 ) RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam32n1 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam32n0 ) ( * Nl5x^01 lam32n1 ) ( - ( - ( + 0 ( * RFN1_sx^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam32n1 ) ( - ( - ( + 0 ( * RFN1_y^0 1 ) ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam32n1 ) ( - ( - ( + ( + 0 ( * RFN1_x^0 1 ) ) RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam36n0 0 ) ( >= lam36n1 0 ) ( > ( + ( * 1 lam36n0 ) ( * Nl5CT1 lam36n1 ) ( - 1 ( - ( + ( + RFN1_CT ( * RFN1_sx^0 0 ) ) ( * RFN1_x^0 ( - 1 ) ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam36n1 ) ( - ( - ( + 0 RFN1_ox^0 ) RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam36n1 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam36n0 ) ( * Nl5x^01 lam36n1 ) ( - ( - ( + ( + 0 ( * RFN1_sx^0 1 ) ) ( * RFN1_x^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam36n1 ) ( - ( - ( + 0 RFN1_y^0 ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam36n1 ) ( - ( - ( + 0 RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ) ( or ( and ( and ( >= lam14n0 0 ) ( > ( + ( * Nl5CT1 lam14n0 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam14n0 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam14n0 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * Nl5x^01 lam14n0 ) ( - ( - RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam14n0 ) ( - ( - RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam14n0 ) ( - ( - RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam15n0 0 ) ( > ( + ( * Nl5CT1 lam15n0 ) ( - 1 ( + ( - ( + ( + ( + ( + RFN1_CT ( * RFN1_ox^0 0 ) ) ( * RFN1_sx^0 0 ) ) ( * RFN1_x^0 0 ) ) ( * RFN1_y^0 ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam15n0 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam15n0 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * Nl5x^01 lam15n0 ) ( - ( - ( + ( + 0 ( * RFN1_ox^0 1 ) ) ( * RFN1_sx^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam15n0 ) ( - ( - ( + 0 ( * RFN1_y^0 1 ) ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam15n0 ) ( - ( - ( + ( + 0 ( * RFN1_x^0 1 ) ) RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ) ( and ( and ( >= lam18n0 0 ) ( > ( + ( * Nl5CT1 lam18n0 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam18n0 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam18n0 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * Nl5x^01 lam18n0 ) ( - ( - RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam18n0 ) ( - ( - RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam18n0 ) ( - ( - RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam19n0 0 ) ( > ( + ( * Nl5CT1 lam19n0 ) ( - 1 ( + ( - ( + ( + ( + RFN1_CT ( * RFN1_ox^0 0 ) ) ( * RFN1_sx^0 0 ) ) ( * RFN1_x^0 ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam19n0 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam19n0 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * Nl5x^01 lam19n0 ) ( - ( - ( + ( + ( + 0 ( * RFN1_ox^0 1 ) ) ( * RFN1_sx^0 1 ) ) ( * RFN1_x^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam19n0 ) ( - ( - ( + 0 RFN1_y^0 ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam19n0 ) ( - ( - ( + 0 RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ) ( and ( and ( >= lam22n0 0 ) ( >= lam22n1 0 ) ( > ( + ( * 1 lam22n0 ) ( * Nl5CT1 lam22n1 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam22n1 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam22n1 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam22n0 ) ( * Nl5x^01 lam22n1 ) ( - ( - RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam22n1 ) ( - ( - RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam22n1 ) ( - ( - RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam23n0 0 ) ( >= lam23n1 0 ) ( > ( + ( * 1 lam23n0 ) ( * Nl5CT1 lam23n1 ) ( - 1 ( + ( - ( + ( + RFN1_CT ( * RFN1_x^0 0 ) ) ( * RFN1_y^0 ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam23n1 ) ( - ( - ( + 0 RFN1_ox^0 ) RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam23n1 ) ( - ( - ( + 0 RFN1_sx^0 ) RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam23n0 ) ( * Nl5x^01 lam23n1 ) ( - ( - RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam23n1 ) ( - ( - ( + 0 ( * RFN1_y^0 1 ) ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam23n1 ) ( - ( - ( + ( + 0 ( * RFN1_x^0 1 ) ) RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ) ( and ( and ( >= lam26n0 0 ) ( >= lam26n1 0 ) ( > ( + ( * 1 lam26n0 ) ( * Nl5CT1 lam26n1 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam26n1 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam26n1 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam26n0 ) ( * Nl5x^01 lam26n1 ) ( - ( - RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam26n1 ) ( - ( - RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam26n1 ) ( - ( - RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam27n0 0 ) ( >= lam27n1 0 ) ( > ( + ( * 1 lam27n0 ) ( * Nl5CT1 lam27n1 ) ( - 1 ( + ( - ( + RFN1_CT ( * RFN1_x^0 ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam27n1 ) ( - ( - ( + 0 RFN1_ox^0 ) RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam27n1 ) ( - ( - ( + 0 RFN1_sx^0 ) RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam27n0 ) ( * Nl5x^01 lam27n1 ) ( - ( - ( + 0 ( * RFN1_x^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam27n1 ) ( - ( - ( + 0 RFN1_y^0 ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam27n1 ) ( - ( - ( + 0 RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ) ( and ( and ( >= lam30n0 0 ) ( >= lam30n1 0 ) ( > ( + ( * 1 lam30n0 ) ( * Nl5CT1 lam30n1 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam30n1 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam30n1 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam30n0 ) ( * Nl5x^01 lam30n1 ) ( - ( - RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam30n1 ) ( - ( - RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam30n1 ) ( - ( - RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam31n0 0 ) ( >= lam31n1 0 ) ( > ( + ( * 1 lam31n0 ) ( * Nl5CT1 lam31n1 ) ( - 1 ( + ( - ( + ( + ( + RFN1_CT ( * RFN1_sx^0 0 ) ) ( * RFN1_x^0 0 ) ) ( * RFN1_y^0 ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam31n1 ) ( - ( - ( + 0 RFN1_ox^0 ) RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam31n1 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam31n0 ) ( * Nl5x^01 lam31n1 ) ( - ( - ( + 0 ( * RFN1_sx^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam31n1 ) ( - ( - ( + 0 ( * RFN1_y^0 1 ) ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam31n1 ) ( - ( - ( + ( + 0 ( * RFN1_x^0 1 ) ) RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ) ( and ( and ( >= lam34n0 0 ) ( >= lam34n1 0 ) ( > ( + ( * 1 lam34n0 ) ( * Nl5CT1 lam34n1 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam34n1 ) ( - ( - RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam34n1 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam34n0 ) ( * Nl5x^01 lam34n1 ) ( - ( - RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam34n1 ) ( - ( - RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam34n1 ) ( - ( - RFN1_z^0 ) ) ) 0 ) ) ( and ( >= lam35n0 0 ) ( >= lam35n1 0 ) ( > ( + ( * 1 lam35n0 ) ( * Nl5CT1 lam35n1 ) ( - 1 ( + ( - ( + ( + RFN1_CT ( * RFN1_sx^0 0 ) ) ( * RFN1_x^0 ( - 1 ) ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * Nl5ox^01 lam35n1 ) ( - ( - ( + 0 RFN1_ox^0 ) RFN1_ox^0 ) ) ) 0 ) ( = ( + ( * Nl5sx^01 lam35n1 ) ( - ( - RFN1_sx^0 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam35n0 ) ( * Nl5x^01 lam35n1 ) ( - ( - ( + ( + 0 ( * RFN1_sx^0 1 ) ) ( * RFN1_x^0 1 ) ) RFN1_x^0 ) ) ) 0 ) ( = ( + ( * Nl5y^01 lam35n1 ) ( - ( - ( + 0 RFN1_y^0 ) RFN1_y^0 ) ) ) 0 ) ( = ( + ( * Nl5z^01 lam35n1 ) ( - ( - ( + 0 RFN1_z^0 ) RFN1_z^0 ) ) ) 0 ) ) ) ) ) ( or ( and ( >= lam13n0 0 ) ( > ( + ( * Nl5CT1 lam13n0 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam13n0 ) 0 ) ( = ( * Nl5sx^01 lam13n0 ) 0 ) ( = ( * Nl5x^01 lam13n0 ) 0 ) ( = ( * Nl5y^01 lam13n0 ) 0 ) ( = ( * Nl5z^01 lam13n0 ) 0 ) ) ( and ( >= lam17n0 0 ) ( > ( + ( * Nl5CT1 lam17n0 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam17n0 ) 0 ) ( = ( * Nl5sx^01 lam17n0 ) 0 ) ( = ( * Nl5x^01 lam17n0 ) 0 ) ( = ( * Nl5y^01 lam17n0 ) 0 ) ( = ( * Nl5z^01 lam17n0 ) 0 ) ) ( and ( >= lam21n0 0 ) ( >= lam21n1 0 ) ( > ( + ( * 1 lam21n0 ) ( * Nl5CT1 lam21n1 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam21n1 ) 0 ) ( = ( * Nl5sx^01 lam21n1 ) 0 ) ( = ( + ( * ( - 1 ) lam21n0 ) ( * Nl5x^01 lam21n1 ) ) 0 ) ( = ( * Nl5y^01 lam21n1 ) 0 ) ( = ( * Nl5z^01 lam21n1 ) 0 ) ) ( and ( >= lam25n0 0 ) ( >= lam25n1 0 ) ( > ( + ( * 1 lam25n0 ) ( * Nl5CT1 lam25n1 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam25n1 ) 0 ) ( = ( * Nl5sx^01 lam25n1 ) 0 ) ( = ( + ( * ( - 1 ) lam25n0 ) ( * Nl5x^01 lam25n1 ) ) 0 ) ( = ( * Nl5y^01 lam25n1 ) 0 ) ( = ( * Nl5z^01 lam25n1 ) 0 ) ) ( and ( >= lam29n0 0 ) ( >= lam29n1 0 ) ( > ( + ( * 1 lam29n0 ) ( * Nl5CT1 lam29n1 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam29n1 ) 0 ) ( = ( * Nl5sx^01 lam29n1 ) 0 ) ( = ( + ( * ( - 1 ) lam29n0 ) ( * Nl5x^01 lam29n1 ) ) 0 ) ( = ( * Nl5y^01 lam29n1 ) 0 ) ( = ( * Nl5z^01 lam29n1 ) 0 ) ) ( and ( >= lam33n0 0 ) ( >= lam33n1 0 ) ( > ( + ( * 1 lam33n0 ) ( * Nl5CT1 lam33n1 ) ( - 1 ) ) 0 ) ( = ( * Nl5ox^01 lam33n1 ) 0 ) ( = ( * Nl5sx^01 lam33n1 ) 0 ) ( = ( + ( * ( - 1 ) lam33n0 ) ( * Nl5x^01 lam33n1 ) ) 0 ) ( = ( * Nl5y^01 lam33n1 ) 0 ) ( = ( * Nl5z^01 lam33n1 ) 0 ) ) ) ))
(check-sat)
(exit)