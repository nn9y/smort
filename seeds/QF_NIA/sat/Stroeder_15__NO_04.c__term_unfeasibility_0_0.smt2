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
(declare-fun Nl5main_i1 () Int)
(declare-fun Nl5main_j1 () Int)
(declare-fun Nl5main_k1 () Int)
(declare-fun Nl5main_l1 () Int)
(declare-fun Nl5main_m1 () Int)
(declare-fun Nl5main_a1 () Int)
(declare-fun Nl5main_b1 () Int)
(declare-fun Nl11main_i1 () Int)
(declare-fun Nl11main_j1 () Int)
(declare-fun Nl11main_k1 () Int)
(declare-fun Nl11main_l1 () Int)
(declare-fun Nl11main_m1 () Int)
(declare-fun Nl11main_a1 () Int)
(declare-fun Nl11main_b1 () Int)
(declare-fun Nl14main_i1 () Int)
(declare-fun Nl14main_j1 () Int)
(declare-fun Nl14main_k1 () Int)
(declare-fun Nl14main_l1 () Int)
(declare-fun Nl14main_m1 () Int)
(declare-fun Nl14main_a1 () Int)
(declare-fun Nl14main_b1 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun Nl5CT1 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun Nl11CT1 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun Nl14CT1 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
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
(declare-fun lam13n0 () Int)
(declare-fun lam13n1 () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam14n1 () Int)
(declare-fun lam15n0 () Int)
(declare-fun lam15n1 () Int)
(declare-fun lam16n0 () Int)
(assert ( and ( <= ( - 1000 ) Nl5main_i1 ) ( <= Nl5main_i1 1000 ) ( <= ( - 1000 ) Nl5main_j1 ) ( <= Nl5main_j1 1000 ) ( <= ( - 1000 ) Nl5main_k1 ) ( <= Nl5main_k1 1000 ) ( <= ( - 1000 ) Nl5main_l1 ) ( <= Nl5main_l1 1000 ) ( <= ( - 1000 ) Nl5main_m1 ) ( <= Nl5main_m1 1000 ) ( <= ( - 1000 ) Nl5main_a1 ) ( <= Nl5main_a1 1000 ) ( <= ( - 1000 ) Nl5main_b1 ) ( <= Nl5main_b1 1000 ) ( <= ( - 1000 ) Nl11main_i1 ) ( <= Nl11main_i1 1000 ) ( <= ( - 1000 ) Nl11main_j1 ) ( <= Nl11main_j1 1000 ) ( <= ( - 1000 ) Nl11main_k1 ) ( <= Nl11main_k1 1000 ) ( <= ( - 1000 ) Nl11main_l1 ) ( <= Nl11main_l1 1000 ) ( <= ( - 1000 ) Nl11main_m1 ) ( <= Nl11main_m1 1000 ) ( <= ( - 1000 ) Nl11main_a1 ) ( <= Nl11main_a1 1000 ) ( <= ( - 1000 ) Nl11main_b1 ) ( <= Nl11main_b1 1000 ) ( <= ( - 1000 ) Nl14main_i1 ) ( <= Nl14main_i1 1000 ) ( <= ( - 1000 ) Nl14main_j1 ) ( <= Nl14main_j1 1000 ) ( <= ( - 1000 ) Nl14main_k1 ) ( <= Nl14main_k1 1000 ) ( <= ( - 1000 ) Nl14main_l1 ) ( <= Nl14main_l1 1000 ) ( <= ( - 1000 ) Nl14main_m1 ) ( <= Nl14main_m1 1000 ) ( <= ( - 1000 ) Nl14main_a1 ) ( <= Nl14main_a1 1000 ) ( <= ( - 1000 ) Nl14main_b1 ) ( <= Nl14main_b1 1000 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( > ( + ( * 1 lam0n0 ) ( * ( - 3 ) lam0n1 ) ( * Nl5CT1 lam0n2 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl5main_i1 lam0n2 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * Nl5main_j1 lam0n2 ) ) 0 ) ( = ( * Nl5main_k1 lam0n2 ) 0 ) ( = ( * Nl5main_l1 lam0n2 ) 0 ) ( = ( * Nl5main_m1 lam0n2 ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl5main_a1 lam0n2 ) ) 0 ) ( = ( * Nl5main_b1 lam0n2 ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( > ( + ( * 1 lam1n0 ) ( * ( - 3 ) lam1n1 ) ( * Nl5CT1 lam1n2 ) ( - 1 ( + ( + ( + Nl11CT1 ( * Nl11main_k1 3 ) ) ( * Nl11main_l1 0 ) ) ( * Nl11main_b1 7 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n1 ) ( * Nl5main_i1 lam1n2 ) ( - ( + ( + ( + 0 Nl11main_i1 ) ( * Nl11main_k1 1 ) ) ( * Nl11main_b1 2 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * ( - 1 ) lam1n1 ) ( * Nl5main_j1 lam1n2 ) ( - ( + ( + ( + 0 Nl11main_j1 ) ( * Nl11main_k1 1 ) ) ( * Nl11main_b1 2 ) ) ) ) 0 ) ( = ( * Nl5main_k1 lam1n2 ) 0 ) ( = ( * Nl5main_l1 lam1n2 ) 0 ) ( = ( + ( * Nl5main_m1 lam1n2 ) ( - ( + 0 Nl11main_m1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * Nl5main_a1 lam1n2 ) ( - ( + 0 Nl11main_a1 ) ) ) 0 ) ( = ( * Nl5main_b1 lam1n2 ) 0 ) ) ))
(assert ( or ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( > ( + ( * 4 lam2n0 ) ( * 1 lam2n1 ) ( * Nl5CT1 lam2n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * Nl5main_i1 lam2n2 ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * 1 lam2n1 ) ( * Nl5main_j1 lam2n2 ) ) 0 ) ( = ( * Nl5main_k1 lam2n2 ) 0 ) ( = ( * Nl5main_l1 lam2n2 ) 0 ) ( = ( * Nl5main_m1 lam2n2 ) 0 ) ( = ( + ( * ( - 1 ) lam2n1 ) ( * Nl5main_a1 lam2n2 ) ) 0 ) ( = ( * Nl5main_b1 lam2n2 ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( > ( + ( * 4 lam3n0 ) ( * 1 lam3n1 ) ( * Nl5CT1 lam3n2 ) ( - 1 ( + ( + Nl5CT1 ( * Nl5main_j1 1 ) ) ( * Nl5main_k1 3 ) ) ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * Nl5main_i1 lam3n2 ) ( - ( + ( + 0 Nl5main_i1 ) ( * Nl5main_k1 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * 1 lam3n1 ) ( * Nl5main_j1 lam3n2 ) ( - ( + ( + 0 ( * Nl5main_j1 1 ) ) ( * Nl5main_k1 1 ) ) ) ) 0 ) ( = ( * Nl5main_k1 lam3n2 ) 0 ) ( = ( + ( * Nl5main_l1 lam3n2 ) ( - ( + 0 Nl5main_l1 ) ) ) 0 ) ( = ( + ( * Nl5main_m1 lam3n2 ) ( - ( + 0 Nl5main_m1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n1 ) ( * Nl5main_a1 lam3n2 ) ( - ( + 0 Nl5main_a1 ) ) ) 0 ) ( = ( + ( * Nl5main_b1 lam3n2 ) ( - ( + 0 Nl5main_b1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( > ( + ( * ( - 98 ) lam4n1 ) ( * Nl5CT1 lam4n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam4n1 ) ( * Nl5main_i1 lam4n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl5main_j1 lam4n2 ) ) 0 ) ( = ( * Nl5main_k1 lam4n2 ) 0 ) ( = ( * Nl5main_l1 lam4n2 ) 0 ) ( = ( * Nl5main_m1 lam4n2 ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl5main_a1 lam4n2 ) ) 0 ) ( = ( * Nl5main_b1 lam4n2 ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( > ( + ( * ( - 98 ) lam5n1 ) ( * Nl5CT1 lam5n2 ) ( - 1 ( + ( + ( + Nl5CT1 ( * Nl5main_i1 1 ) ) ( * Nl5main_j1 0 ) ) ( * Nl5main_a1 3 ) ) ) ) 0 ) ( = ( + ( * 1 lam5n1 ) ( * Nl5main_i1 lam5n2 ) ( - ( + ( + 0 ( * Nl5main_i1 1 ) ) ( * Nl5main_a1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl5main_j1 lam5n2 ) ) 0 ) ( = ( + ( * Nl5main_k1 lam5n2 ) ( - ( + 0 Nl5main_k1 ) ) ) 0 ) ( = ( + ( * Nl5main_l1 lam5n2 ) ( - ( + 0 Nl5main_l1 ) ) ) 0 ) ( = ( + ( * Nl5main_m1 lam5n2 ) ( - ( + 0 Nl5main_m1 ) ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * Nl5main_a1 lam5n2 ) ) 0 ) ( = ( + ( * Nl5main_b1 lam5n2 ) ( - ( + 0 Nl5main_b1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( > ( + ( * 1 lam6n0 ) ( * Nl11CT1 lam6n1 ) ( - 1 ) ) 0 ) ( = ( * Nl11main_i1 lam6n1 ) 0 ) ( = ( * Nl11main_j1 lam6n1 ) 0 ) ( = ( * Nl11main_k1 lam6n1 ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * Nl11main_l1 lam6n1 ) ) 0 ) ( = ( * Nl11main_m1 lam6n1 ) 0 ) ( = ( * Nl11main_a1 lam6n1 ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * Nl11main_b1 lam6n1 ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( > ( + ( * 1 lam7n0 ) ( * Nl11CT1 lam7n1 ) ( - 1 ( + Nl14CT1 ( * Nl14main_m1 1000 ) ) ) ) 0 ) ( = ( + ( * Nl11main_i1 lam7n1 ) ( - ( + ( + 0 Nl14main_i1 ) ( * Nl14main_m1 1 ) ) ) ) 0 ) ( = ( + ( * Nl11main_j1 lam7n1 ) ( - ( + ( + 0 Nl14main_j1 ) ( * Nl14main_m1 1 ) ) ) ) 0 ) ( = ( + ( * Nl11main_k1 lam7n1 ) ( - ( + ( + 0 Nl14main_k1 ) ( * Nl14main_m1 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * Nl11main_l1 lam7n1 ) ( - ( + ( + 0 Nl14main_l1 ) ( * Nl14main_m1 1 ) ) ) ) 0 ) ( = ( * Nl11main_m1 lam7n1 ) 0 ) ( = ( + ( * Nl11main_a1 lam7n1 ) ( - ( + 0 Nl14main_a1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * Nl11main_b1 lam7n1 ) ( - ( + 0 Nl14main_b1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( > ( + ( * 1 lam8n1 ) ( * Nl11CT1 lam8n2 ) ( - 1 ) ) 0 ) ( = ( * Nl11main_i1 lam8n2 ) 0 ) ( = ( * Nl11main_j1 lam8n2 ) 0 ) ( = ( + ( * ( - 1 ) lam8n1 ) ( * Nl11main_k1 lam8n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * Nl11main_l1 lam8n2 ) ) 0 ) ( = ( * Nl11main_m1 lam8n2 ) 0 ) ( = ( * Nl11main_a1 lam8n2 ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl11main_b1 lam8n2 ) ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( > ( + ( * 1 lam9n1 ) ( * Nl11CT1 lam9n2 ) ( - 1 ( + ( + ( + Nl11CT1 ( * Nl11main_k1 ( - 1 ) ) ) ( * Nl11main_l1 0 ) ) ( * Nl11main_b1 3 ) ) ) ) 0 ) ( = ( + ( * Nl11main_i1 lam9n2 ) ( - ( + ( + 0 Nl11main_i1 ) ( * Nl11main_b1 1 ) ) ) ) 0 ) ( = ( + ( * Nl11main_j1 lam9n2 ) ( - ( + ( + 0 Nl11main_j1 ) ( * Nl11main_b1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n1 ) ( * Nl11main_k1 lam9n2 ) ( - ( + ( + 0 ( * Nl11main_k1 1 ) ) ( * Nl11main_b1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * Nl11main_l1 lam9n2 ) ) 0 ) ( = ( + ( * Nl11main_m1 lam9n2 ) ( - ( + 0 Nl11main_m1 ) ) ) 0 ) ( = ( + ( * Nl11main_a1 lam9n2 ) ( - ( + 0 Nl11main_a1 ) ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * Nl11main_b1 lam9n2 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( > ( + ( * Nl11CT1 lam10n2 ) ( - 1 ) ) 0 ) ( = ( * Nl11main_i1 lam10n2 ) 0 ) ( = ( * Nl11main_j1 lam10n2 ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * Nl11main_k1 lam10n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n1 ) ( * Nl11main_l1 lam10n2 ) ) 0 ) ( = ( * Nl11main_m1 lam10n2 ) 0 ) ( = ( * Nl11main_a1 lam10n2 ) 0 ) ( = ( + ( * 1 lam10n1 ) ( * Nl11main_b1 lam10n2 ) ) 0 ) ) ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( > ( + ( * Nl11CT1 lam11n2 ) ( - 1 ( + ( + Nl5CT1 ( * Nl5main_j1 1 ) ) ( * Nl5main_k1 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * Nl11main_i1 lam11n2 ) ( - ( + 0 Nl5main_i1 ) ) ) 0 ) ( = ( + ( * Nl11main_j1 lam11n2 ) ( - ( + 0 ( * Nl5main_j1 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam11n0 ) ( * Nl11main_k1 lam11n2 ) ( - ( + 0 ( * Nl5main_k1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam11n1 ) ( * Nl11main_l1 lam11n2 ) ( - ( + 0 Nl5main_l1 ) ) ) 0 ) ( = ( + ( * Nl11main_m1 lam11n2 ) ( - ( + 0 Nl5main_m1 ) ) ) 0 ) ( = ( + ( * Nl11main_a1 lam11n2 ) ( - ( + 0 Nl5main_a1 ) ) ) 0 ) ( = ( + ( * 1 lam11n1 ) ( * Nl11main_b1 lam11n2 ) ( - ( + 0 Nl5main_b1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( > ( + ( * Nl14CT1 lam12n1 ) ( - 1 ) ) 0 ) ( = ( * Nl14main_i1 lam12n1 ) 0 ) ( = ( * Nl14main_j1 lam12n1 ) 0 ) ( = ( * Nl14main_k1 lam12n1 ) 0 ) ( = ( * Nl14main_l1 lam12n1 ) 0 ) ( = ( + ( * ( - 1 ) lam12n0 ) ( * Nl14main_m1 lam12n1 ) ) 0 ) ( = ( * Nl14main_a1 lam12n1 ) 0 ) ( = ( * Nl14main_b1 lam12n1 ) 0 ) ) ( and ( >= lam13n0 0 ) ( >= lam13n1 0 ) ( > ( + ( * Nl14CT1 lam13n1 ) ( - 1 Nl14CT1 ) ) 0 ) ( = ( + ( * Nl14main_i1 lam13n1 ) ( - ( + 0 Nl14main_i1 ) ) ) 0 ) ( = ( + ( * Nl14main_j1 lam13n1 ) ( - ( + 0 Nl14main_j1 ) ) ) 0 ) ( = ( + ( * Nl14main_k1 lam13n1 ) ( - ( + 0 Nl14main_k1 ) ) ) 0 ) ( = ( + ( * Nl14main_l1 lam13n1 ) ( - ( + 0 Nl14main_l1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam13n0 ) ( * Nl14main_m1 lam13n1 ) ( - ( + 0 Nl14main_m1 ) ) ) 0 ) ( = ( + ( * Nl14main_a1 lam13n1 ) ( - ( + 0 Nl14main_a1 ) ) ) 0 ) ( = ( + ( * Nl14main_b1 lam13n1 ) ( - ( + 0 Nl14main_b1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam14n0 0 ) ( >= lam14n1 0 ) ( > ( + ( * 1 lam14n0 ) ( * Nl14CT1 lam14n1 ) ( - 1 ) ) 0 ) ( = ( * Nl14main_i1 lam14n1 ) 0 ) ( = ( * Nl14main_j1 lam14n1 ) 0 ) ( = ( * Nl14main_k1 lam14n1 ) 0 ) ( = ( * Nl14main_l1 lam14n1 ) 0 ) ( = ( + ( * 1 lam14n0 ) ( * Nl14main_m1 lam14n1 ) ) 0 ) ( = ( * Nl14main_a1 lam14n1 ) 0 ) ( = ( * Nl14main_b1 lam14n1 ) 0 ) ) ( and ( >= lam15n0 0 ) ( >= lam15n1 0 ) ( > ( + ( * 1 lam15n0 ) ( * Nl14CT1 lam15n1 ) ( - 1 ( + Nl11CT1 ( * Nl11main_l1 1 ) ) ) ) 0 ) ( = ( + ( * Nl14main_i1 lam15n1 ) ( - ( + 0 Nl11main_i1 ) ) ) 0 ) ( = ( + ( * Nl14main_j1 lam15n1 ) ( - ( + 0 Nl11main_j1 ) ) ) 0 ) ( = ( + ( * Nl14main_k1 lam15n1 ) ( - ( + 0 Nl11main_k1 ) ) ) 0 ) ( = ( + ( * Nl14main_l1 lam15n1 ) ( - ( + 0 ( * Nl11main_l1 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam15n0 ) ( * Nl14main_m1 lam15n1 ) ( - ( + 0 Nl11main_m1 ) ) ) 0 ) ( = ( + ( * Nl14main_a1 lam15n1 ) ( - ( + 0 Nl11main_a1 ) ) ) 0 ) ( = ( + ( * Nl14main_b1 lam15n1 ) ( - ( + 0 Nl11main_b1 ) ) ) 0 ) ) ))
(assert ( and ( > ( - 1 ( + ( + Nl5CT1 ( * Nl5main_j1 0 ) ) ( * Nl5main_a1 2 ) ) ) 0 ) ( = ( + ( * 1 lam16n0 ) ( - ( + 0 Nl5main_i1 ) ) ) 0 ) ( = ( - ( + 0 Nl5main_k1 ) ) 0 ) ( = ( - ( + 0 Nl5main_l1 ) ) 0 ) ( = ( - ( + 0 Nl5main_m1 ) ) 0 ) ( = ( - ( + 0 Nl5main_b1 ) ) 0 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( > ( + ( * 1 lam0n0 ) ( * ( - 3 ) lam0n1 ) ( * Nl5CT1 lam0n2 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl5main_i1 lam0n2 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n1 ) ( * Nl5main_j1 lam0n2 ) ) 0 ) ( = ( * Nl5main_k1 lam0n2 ) 0 ) ( = ( * Nl5main_l1 lam0n2 ) 0 ) ( = ( * Nl5main_m1 lam0n2 ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl5main_a1 lam0n2 ) ) 0 ) ( = ( * Nl5main_b1 lam0n2 ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( > ( + ( * 4 lam2n0 ) ( * 1 lam2n1 ) ( * Nl5CT1 lam2n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * Nl5main_i1 lam2n2 ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * 1 lam2n1 ) ( * Nl5main_j1 lam2n2 ) ) 0 ) ( = ( * Nl5main_k1 lam2n2 ) 0 ) ( = ( * Nl5main_l1 lam2n2 ) 0 ) ( = ( * Nl5main_m1 lam2n2 ) 0 ) ( = ( + ( * ( - 1 ) lam2n1 ) ( * Nl5main_a1 lam2n2 ) ) 0 ) ( = ( * Nl5main_b1 lam2n2 ) 0 ) ) ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( > ( + ( * ( - 98 ) lam4n1 ) ( * Nl5CT1 lam4n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam4n1 ) ( * Nl5main_i1 lam4n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl5main_j1 lam4n2 ) ) 0 ) ( = ( * Nl5main_k1 lam4n2 ) 0 ) ( = ( * Nl5main_l1 lam4n2 ) 0 ) ( = ( * Nl5main_m1 lam4n2 ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl5main_a1 lam4n2 ) ) 0 ) ( = ( * Nl5main_b1 lam4n2 ) 0 ) ) ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( > ( + ( * 1 lam6n0 ) ( * Nl11CT1 lam6n1 ) ( - 1 ) ) 0 ) ( = ( * Nl11main_i1 lam6n1 ) 0 ) ( = ( * Nl11main_j1 lam6n1 ) 0 ) ( = ( * Nl11main_k1 lam6n1 ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * Nl11main_l1 lam6n1 ) ) 0 ) ( = ( * Nl11main_m1 lam6n1 ) 0 ) ( = ( * Nl11main_a1 lam6n1 ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * Nl11main_b1 lam6n1 ) ) 0 ) ) ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( > ( + ( * 1 lam8n1 ) ( * Nl11CT1 lam8n2 ) ( - 1 ) ) 0 ) ( = ( * Nl11main_i1 lam8n2 ) 0 ) ( = ( * Nl11main_j1 lam8n2 ) 0 ) ( = ( + ( * ( - 1 ) lam8n1 ) ( * Nl11main_k1 lam8n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * Nl11main_l1 lam8n2 ) ) 0 ) ( = ( * Nl11main_m1 lam8n2 ) 0 ) ( = ( * Nl11main_a1 lam8n2 ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl11main_b1 lam8n2 ) ) 0 ) ) ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( > ( + ( * Nl11CT1 lam10n2 ) ( - 1 ) ) 0 ) ( = ( * Nl11main_i1 lam10n2 ) 0 ) ( = ( * Nl11main_j1 lam10n2 ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * Nl11main_k1 lam10n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n1 ) ( * Nl11main_l1 lam10n2 ) ) 0 ) ( = ( * Nl11main_m1 lam10n2 ) 0 ) ( = ( * Nl11main_a1 lam10n2 ) 0 ) ( = ( + ( * 1 lam10n1 ) ( * Nl11main_b1 lam10n2 ) ) 0 ) ) ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( > ( + ( * Nl14CT1 lam12n1 ) ( - 1 ) ) 0 ) ( = ( * Nl14main_i1 lam12n1 ) 0 ) ( = ( * Nl14main_j1 lam12n1 ) 0 ) ( = ( * Nl14main_k1 lam12n1 ) 0 ) ( = ( * Nl14main_l1 lam12n1 ) 0 ) ( = ( + ( * ( - 1 ) lam12n0 ) ( * Nl14main_m1 lam12n1 ) ) 0 ) ( = ( * Nl14main_a1 lam12n1 ) 0 ) ( = ( * Nl14main_b1 lam12n1 ) 0 ) ) ( and ( >= lam14n0 0 ) ( >= lam14n1 0 ) ( > ( + ( * 1 lam14n0 ) ( * Nl14CT1 lam14n1 ) ( - 1 ) ) 0 ) ( = ( * Nl14main_i1 lam14n1 ) 0 ) ( = ( * Nl14main_j1 lam14n1 ) 0 ) ( = ( * Nl14main_k1 lam14n1 ) 0 ) ( = ( * Nl14main_l1 lam14n1 ) 0 ) ( = ( + ( * 1 lam14n0 ) ( * Nl14main_m1 lam14n1 ) ) 0 ) ( = ( * Nl14main_a1 lam14n1 ) 0 ) ( = ( * Nl14main_b1 lam14n1 ) 0 ) ) ))
(check-sat)
(exit)