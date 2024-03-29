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
(declare-fun Nl7main_k1 () Int)
(declare-fun Nl7main_i1 () Int)
(declare-fun Nl7main_j1 () Int)
(declare-fun Nl7main_n1 () Int)
(declare-fun Nl7main_k2 () Int)
(declare-fun Nl7main_i2 () Int)
(declare-fun Nl7main_j2 () Int)
(declare-fun Nl7main_n2 () Int)
(declare-fun Nl7main_k3 () Int)
(declare-fun Nl7main_i3 () Int)
(declare-fun Nl7main_j3 () Int)
(declare-fun Nl7main_n3 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun Nl7CT1 () Int)
(declare-fun Nl7CT2 () Int)
(declare-fun Nl7CT3 () Int)
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
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam9n3 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam10n3 () Int)
(declare-fun undef5 () Int)
(declare-fun undef8 () Int)
(declare-fun main_k () Int)
(declare-fun main_n () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam14n1 () Int)
(declare-fun lam14n2 () Int)
(declare-fun lam14n3 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_main_j () Int)
(declare-fun RFN1_main_k () Int)
(declare-fun RFN1_main_i () Int)
(declare-fun lam12n0 () Int)
(declare-fun lam12n1 () Int)
(declare-fun lam12n2 () Int)
(declare-fun lam12n3 () Int)
(declare-fun lam13n0 () Int)
(declare-fun lam13n1 () Int)
(declare-fun lam13n2 () Int)
(declare-fun lam13n3 () Int)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam11n2 () Int)
(declare-fun lam11n3 () Int)
(assert ( and ( <= ( - 1 ) Nl7main_k1 ) ( <= Nl7main_k1 1 ) ( <= ( - 1 ) Nl7main_i1 ) ( <= Nl7main_i1 1 ) ( <= ( - 1 ) Nl7main_j1 ) ( <= Nl7main_j1 1 ) ( <= ( - 1 ) Nl7main_n1 ) ( <= Nl7main_n1 1 ) ( <= ( - 1 ) Nl7main_k2 ) ( <= Nl7main_k2 1 ) ( <= ( - 1 ) Nl7main_i2 ) ( <= Nl7main_i2 1 ) ( <= ( - 1 ) Nl7main_j2 ) ( <= Nl7main_j2 1 ) ( <= ( - 1 ) Nl7main_n2 ) ( <= Nl7main_n2 1 ) ( <= ( - 1 ) Nl7main_k3 ) ( <= Nl7main_k3 1 ) ( <= ( - 1 ) Nl7main_i3 ) ( <= Nl7main_i3 1 ) ( <= ( - 1 ) Nl7main_j3 ) ( <= Nl7main_j3 1 ) ( <= ( - 1 ) Nl7main_n3 ) ( <= Nl7main_n3 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * Nl7CT1 lam0n1 ) ( * Nl7CT2 lam0n2 ) ( * Nl7CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl7main_k1 lam0n1 ) ( * Nl7main_k2 lam0n2 ) ( * Nl7main_k3 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl7main_i1 lam0n1 ) ( * Nl7main_i2 lam0n2 ) ( * Nl7main_i3 lam0n3 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl7main_j1 lam0n1 ) ( * Nl7main_j2 lam0n2 ) ( * Nl7main_j3 lam0n3 ) ) 0 ) ( = ( + ( * Nl7main_n1 lam0n1 ) ( * Nl7main_n2 lam0n2 ) ( * Nl7main_n3 lam0n3 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( > ( + ( * Nl7CT1 lam1n1 ) ( * Nl7CT2 lam1n2 ) ( * Nl7CT3 lam1n3 ) ( - 1 ( + Nl7CT1 ( * Nl7main_j1 0 ) ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam1n1 ) ( * Nl7main_k2 lam1n2 ) ( * Nl7main_k3 lam1n3 ) ( - ( + ( + 0 Nl7main_k1 ) ( * Nl7main_j1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * Nl7main_i1 lam1n1 ) ( * Nl7main_i2 lam1n2 ) ( * Nl7main_i3 lam1n3 ) ( - ( + 0 Nl7main_i1 ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * Nl7main_j1 lam1n1 ) ( * Nl7main_j2 lam1n2 ) ( * Nl7main_j3 lam1n3 ) ( - ( + 0 ( * Nl7main_j1 1 ) ) ) ) 0 ) ( = ( + ( * Nl7main_n1 lam1n1 ) ( * Nl7main_n2 lam1n2 ) ( * Nl7main_n3 lam1n3 ) ( - ( + 0 Nl7main_n1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * Nl7CT1 lam0n1 ) ( * Nl7CT2 lam0n2 ) ( * Nl7CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl7main_k1 lam0n1 ) ( * Nl7main_k2 lam0n2 ) ( * Nl7main_k3 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl7main_i1 lam0n1 ) ( * Nl7main_i2 lam0n2 ) ( * Nl7main_i3 lam0n3 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl7main_j1 lam0n1 ) ( * Nl7main_j2 lam0n2 ) ( * Nl7main_j3 lam0n3 ) ) 0 ) ( = ( + ( * Nl7main_n1 lam0n1 ) ( * Nl7main_n2 lam0n2 ) ( * Nl7main_n3 lam0n3 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( > ( + ( * Nl7CT1 lam2n1 ) ( * Nl7CT2 lam2n2 ) ( * Nl7CT3 lam2n3 ) ( - 1 ( + Nl7CT2 ( * Nl7main_j2 0 ) ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam2n1 ) ( * Nl7main_k2 lam2n2 ) ( * Nl7main_k3 lam2n3 ) ( - ( + ( + 0 Nl7main_k2 ) ( * Nl7main_j2 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * Nl7main_i1 lam2n1 ) ( * Nl7main_i2 lam2n2 ) ( * Nl7main_i3 lam2n3 ) ( - ( + 0 Nl7main_i2 ) ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * Nl7main_j1 lam2n1 ) ( * Nl7main_j2 lam2n2 ) ( * Nl7main_j3 lam2n3 ) ( - ( + 0 ( * Nl7main_j2 1 ) ) ) ) 0 ) ( = ( + ( * Nl7main_n1 lam2n1 ) ( * Nl7main_n2 lam2n2 ) ( * Nl7main_n3 lam2n3 ) ( - ( + 0 Nl7main_n2 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * Nl7CT1 lam0n1 ) ( * Nl7CT2 lam0n2 ) ( * Nl7CT3 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl7main_k1 lam0n1 ) ( * Nl7main_k2 lam0n2 ) ( * Nl7main_k3 lam0n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl7main_i1 lam0n1 ) ( * Nl7main_i2 lam0n2 ) ( * Nl7main_i3 lam0n3 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl7main_j1 lam0n1 ) ( * Nl7main_j2 lam0n2 ) ( * Nl7main_j3 lam0n3 ) ) 0 ) ( = ( + ( * Nl7main_n1 lam0n1 ) ( * Nl7main_n2 lam0n2 ) ( * Nl7main_n3 lam0n3 ) ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( > ( + ( * Nl7CT1 lam3n1 ) ( * Nl7CT2 lam3n2 ) ( * Nl7CT3 lam3n3 ) ( - 1 ( + Nl7CT3 ( * Nl7main_j3 0 ) ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam3n1 ) ( * Nl7main_k2 lam3n2 ) ( * Nl7main_k3 lam3n3 ) ( - ( + ( + 0 Nl7main_k3 ) ( * Nl7main_j3 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl7main_i1 lam3n1 ) ( * Nl7main_i2 lam3n2 ) ( * Nl7main_i3 lam3n3 ) ( - ( + 0 Nl7main_i3 ) ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * Nl7main_j1 lam3n1 ) ( * Nl7main_j2 lam3n2 ) ( * Nl7main_j3 lam3n3 ) ( - ( + 0 ( * Nl7main_j3 1 ) ) ) ) 0 ) ( = ( + ( * Nl7main_n1 lam3n1 ) ( * Nl7main_n2 lam3n2 ) ( * Nl7main_n3 lam3n3 ) ( - ( + 0 Nl7main_n3 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( >= lam4n4 0 ) ( > ( + ( * 1 lam4n0 ) ( * 2 lam4n1 ) ( * Nl7CT1 lam4n2 ) ( * Nl7CT2 lam4n3 ) ( * Nl7CT3 lam4n4 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl7main_k1 lam4n2 ) ( * Nl7main_k2 lam4n3 ) ( * Nl7main_k3 lam4n4 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * 1 lam4n1 ) ( * Nl7main_i1 lam4n2 ) ( * Nl7main_i2 lam4n3 ) ( * Nl7main_i3 lam4n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl7main_j1 lam4n2 ) ( * Nl7main_j2 lam4n3 ) ( * Nl7main_j3 lam4n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n1 ) ( * Nl7main_n1 lam4n2 ) ( * Nl7main_n2 lam4n3 ) ( * Nl7main_n3 lam4n4 ) ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n3 0 ) ( >= lam5n4 0 ) ( > ( + ( * 1 lam5n0 ) ( * 2 lam5n1 ) ( * Nl7CT1 lam5n2 ) ( * Nl7CT2 lam5n3 ) ( * Nl7CT3 lam5n4 ) ( - 1 ( + ( + Nl7CT1 ( * Nl7main_i1 1 ) ) ( * Nl7main_j1 0 ) ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam5n2 ) ( * Nl7main_k2 lam5n3 ) ( * Nl7main_k3 lam5n4 ) ( - ( + 0 Nl7main_k1 ) ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * 1 lam5n1 ) ( * Nl7main_i1 lam5n2 ) ( * Nl7main_i2 lam5n3 ) ( * Nl7main_i3 lam5n4 ) ( - ( + 0 ( * Nl7main_i1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl7main_j1 lam5n2 ) ( * Nl7main_j2 lam5n3 ) ( * Nl7main_j3 lam5n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n1 ) ( * Nl7main_n1 lam5n2 ) ( * Nl7main_n2 lam5n3 ) ( * Nl7main_n3 lam5n4 ) ( - ( + 0 Nl7main_n1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( >= lam4n4 0 ) ( > ( + ( * 1 lam4n0 ) ( * 2 lam4n1 ) ( * Nl7CT1 lam4n2 ) ( * Nl7CT2 lam4n3 ) ( * Nl7CT3 lam4n4 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl7main_k1 lam4n2 ) ( * Nl7main_k2 lam4n3 ) ( * Nl7main_k3 lam4n4 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * 1 lam4n1 ) ( * Nl7main_i1 lam4n2 ) ( * Nl7main_i2 lam4n3 ) ( * Nl7main_i3 lam4n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl7main_j1 lam4n2 ) ( * Nl7main_j2 lam4n3 ) ( * Nl7main_j3 lam4n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n1 ) ( * Nl7main_n1 lam4n2 ) ( * Nl7main_n2 lam4n3 ) ( * Nl7main_n3 lam4n4 ) ) 0 ) ) ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( >= lam6n3 0 ) ( >= lam6n4 0 ) ( > ( + ( * 1 lam6n0 ) ( * 2 lam6n1 ) ( * Nl7CT1 lam6n2 ) ( * Nl7CT2 lam6n3 ) ( * Nl7CT3 lam6n4 ) ( - 1 ( + ( + Nl7CT2 ( * Nl7main_i2 1 ) ) ( * Nl7main_j2 0 ) ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam6n2 ) ( * Nl7main_k2 lam6n3 ) ( * Nl7main_k3 lam6n4 ) ( - ( + 0 Nl7main_k2 ) ) ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * 1 lam6n1 ) ( * Nl7main_i1 lam6n2 ) ( * Nl7main_i2 lam6n3 ) ( * Nl7main_i3 lam6n4 ) ( - ( + 0 ( * Nl7main_i2 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * Nl7main_j1 lam6n2 ) ( * Nl7main_j2 lam6n3 ) ( * Nl7main_j3 lam6n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n1 ) ( * Nl7main_n1 lam6n2 ) ( * Nl7main_n2 lam6n3 ) ( * Nl7main_n3 lam6n4 ) ( - ( + 0 Nl7main_n2 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( >= lam4n4 0 ) ( > ( + ( * 1 lam4n0 ) ( * 2 lam4n1 ) ( * Nl7CT1 lam4n2 ) ( * Nl7CT2 lam4n3 ) ( * Nl7CT3 lam4n4 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl7main_k1 lam4n2 ) ( * Nl7main_k2 lam4n3 ) ( * Nl7main_k3 lam4n4 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * 1 lam4n1 ) ( * Nl7main_i1 lam4n2 ) ( * Nl7main_i2 lam4n3 ) ( * Nl7main_i3 lam4n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl7main_j1 lam4n2 ) ( * Nl7main_j2 lam4n3 ) ( * Nl7main_j3 lam4n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n1 ) ( * Nl7main_n1 lam4n2 ) ( * Nl7main_n2 lam4n3 ) ( * Nl7main_n3 lam4n4 ) ) 0 ) ) ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( >= lam7n3 0 ) ( >= lam7n4 0 ) ( > ( + ( * 1 lam7n0 ) ( * 2 lam7n1 ) ( * Nl7CT1 lam7n2 ) ( * Nl7CT2 lam7n3 ) ( * Nl7CT3 lam7n4 ) ( - 1 ( + ( + Nl7CT3 ( * Nl7main_i3 1 ) ) ( * Nl7main_j3 0 ) ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam7n2 ) ( * Nl7main_k2 lam7n3 ) ( * Nl7main_k3 lam7n4 ) ( - ( + 0 Nl7main_k3 ) ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * 1 lam7n1 ) ( * Nl7main_i1 lam7n2 ) ( * Nl7main_i2 lam7n3 ) ( * Nl7main_i3 lam7n4 ) ( - ( + 0 ( * Nl7main_i3 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n0 ) ( * Nl7main_j1 lam7n2 ) ( * Nl7main_j2 lam7n3 ) ( * Nl7main_j3 lam7n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam7n1 ) ( * Nl7main_n1 lam7n2 ) ( * Nl7main_n2 lam7n3 ) ( * Nl7main_n3 lam7n4 ) ( - ( + 0 Nl7main_n3 ) ) ) 0 ) ) ))
(assert ( and ( <= ( + 1 ( * ( - 1 ) undef5 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef8 ) ) 0 ) ( = ( + main_k ( * ( - 1 ) undef5 ) ) 0 ) ( = ( + main_n ( * ( - 1 ) undef8 ) ) 0 ) ( <= ( + ( + ( + Nl7CT1 ( * Nl7main_i1 0 ) ) ( * Nl7main_j1 0 ) ) ( * ( + 0 Nl7main_k1 ) main_k ) ( * ( + 0 Nl7main_n1 ) main_n ) ) 0 ) ( <= ( + ( + ( + Nl7CT2 ( * Nl7main_i2 0 ) ) ( * Nl7main_j2 0 ) ) ( * ( + 0 Nl7main_k2 ) main_k ) ( * ( + 0 Nl7main_n2 ) main_n ) ) 0 ) ( <= ( + ( + ( + Nl7CT3 ( * Nl7main_i3 0 ) ) ( * Nl7main_j3 0 ) ) ( * ( + 0 Nl7main_k3 ) main_k ) ( * ( + 0 Nl7main_n3 ) main_n ) ) 0 ) ))
(assert ( or ( and ( and ( >= lam14n0 0 ) ( >= lam14n1 0 ) ( >= lam14n2 0 ) ( >= lam14n3 0 ) ( > ( + ( * Nl7CT1 lam14n1 ) ( * Nl7CT2 lam14n2 ) ( * Nl7CT3 lam14n3 ) ( - 1 ( - ( + RFN1_CT ( * RFN1_main_j 0 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam14n1 ) ( * Nl7main_k2 lam14n2 ) ( * Nl7main_k3 lam14n3 ) ( - ( - ( + ( + 0 RFN1_main_k ) ( * RFN1_main_j 1 ) ) RFN1_main_k ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam14n0 ) ( * Nl7main_i1 lam14n1 ) ( * Nl7main_i2 lam14n2 ) ( * Nl7main_i3 lam14n3 ) ( - ( - ( + 0 RFN1_main_i ) RFN1_main_i ) ) ) 0 ) ( = ( + ( * 1 lam14n0 ) ( * Nl7main_j1 lam14n1 ) ( * Nl7main_j2 lam14n2 ) ( * Nl7main_j3 lam14n3 ) ( - ( - ( + 0 ( * RFN1_main_j 1 ) ) RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl7main_n1 lam14n1 ) ( * Nl7main_n2 lam14n2 ) ( * Nl7main_n3 lam14n3 ) ) 0 ) ) ( and ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( >= lam12n2 0 ) ( >= lam12n3 0 ) ( > ( + ( * Nl7CT1 lam12n1 ) ( * Nl7CT2 lam12n2 ) ( * Nl7CT3 lam12n3 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam12n1 ) ( * Nl7main_k2 lam12n2 ) ( * Nl7main_k3 lam12n3 ) ( - ( - RFN1_main_k ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam12n0 ) ( * Nl7main_i1 lam12n1 ) ( * Nl7main_i2 lam12n2 ) ( * Nl7main_i3 lam12n3 ) ( - ( - RFN1_main_i ) ) ) 0 ) ( = ( + ( * 1 lam12n0 ) ( * Nl7main_j1 lam12n1 ) ( * Nl7main_j2 lam12n2 ) ( * Nl7main_j3 lam12n3 ) ( - ( - RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl7main_n1 lam12n1 ) ( * Nl7main_n2 lam12n2 ) ( * Nl7main_n3 lam12n3 ) ) 0 ) ) ( and ( >= lam13n0 0 ) ( >= lam13n1 0 ) ( >= lam13n2 0 ) ( >= lam13n3 0 ) ( > ( + ( * Nl7CT1 lam13n1 ) ( * Nl7CT2 lam13n2 ) ( * Nl7CT3 lam13n3 ) ( - 1 ( + ( - ( + RFN1_CT ( * RFN1_main_j 0 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * Nl7main_k1 lam13n1 ) ( * Nl7main_k2 lam13n2 ) ( * Nl7main_k3 lam13n3 ) ( - ( - ( + ( + 0 RFN1_main_k ) ( * RFN1_main_j 1 ) ) RFN1_main_k ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam13n0 ) ( * Nl7main_i1 lam13n1 ) ( * Nl7main_i2 lam13n2 ) ( * Nl7main_i3 lam13n3 ) ( - ( - ( + 0 RFN1_main_i ) RFN1_main_i ) ) ) 0 ) ( = ( + ( * 1 lam13n0 ) ( * Nl7main_j1 lam13n1 ) ( * Nl7main_j2 lam13n2 ) ( * Nl7main_j3 lam13n3 ) ( - ( - ( + 0 ( * RFN1_main_j 1 ) ) RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl7main_n1 lam13n1 ) ( * Nl7main_n2 lam13n2 ) ( * Nl7main_n3 lam13n3 ) ) 0 ) ) ) ) ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( >= lam11n3 0 ) ( > ( + ( * Nl7CT1 lam11n1 ) ( * Nl7CT2 lam11n2 ) ( * Nl7CT3 lam11n3 ) ( - 1 ) ) 0 ) ( = ( + ( * Nl7main_k1 lam11n1 ) ( * Nl7main_k2 lam11n2 ) ( * Nl7main_k3 lam11n3 ) ) 0 ) ( = ( + ( * ( - 1 ) lam11n0 ) ( * Nl7main_i1 lam11n1 ) ( * Nl7main_i2 lam11n2 ) ( * Nl7main_i3 lam11n3 ) ) 0 ) ( = ( + ( * 1 lam11n0 ) ( * Nl7main_j1 lam11n1 ) ( * Nl7main_j2 lam11n2 ) ( * Nl7main_j3 lam11n3 ) ) 0 ) ( = ( + ( * Nl7main_n1 lam11n1 ) ( * Nl7main_n2 lam11n2 ) ( * Nl7main_n3 lam11n3 ) ) 0 ) ) ))
(check-sat)
(exit)
