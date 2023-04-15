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
(declare-fun Nl2main_j1 () Int)
(declare-fun Nl2main_i1 () Int)
(declare-fun Nl2main_fac1 () Int)
(declare-fun Nl2main_j2 () Int)
(declare-fun Nl2main_i2 () Int)
(declare-fun Nl2main_fac2 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun Nl2CT2 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
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
(declare-fun lam6n1 () Int)
(declare-fun lam6n2 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n0 () Int)
(declare-fun main_j () Int)
(declare-fun undef2 () Int)
(declare-fun main_i () Int)
(declare-fun main_fac () Int)
(declare-fun lam11n0 () Int)
(declare-fun lam11n1 () Int)
(declare-fun lam11n2 () Int)
(declare-fun RFN1_CT () Int)
(declare-fun RFN1_main_i () Int)
(declare-fun RFN1_main_fac () Int)
(declare-fun RFN1_main_j () Int)
(declare-fun lam15n0 () Int)
(declare-fun lam15n1 () Int)
(declare-fun lam15n2 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam10n0 () Int)
(declare-fun lam10n1 () Int)
(declare-fun lam10n2 () Int)
(declare-fun lam13n0 () Int)
(declare-fun lam13n1 () Int)
(declare-fun lam13n2 () Int)
(declare-fun lam14n0 () Int)
(declare-fun lam14n1 () Int)
(declare-fun lam14n2 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam12n0 () Int)
(declare-fun lam12n1 () Int)
(declare-fun lam12n2 () Int)
(assert ( and ( <= ( - 1 ) Nl2main_j1 ) ( <= Nl2main_j1 1 ) ( <= ( - 1 ) Nl2main_i1 ) ( <= Nl2main_i1 1 ) ( <= ( - 1 ) Nl2main_fac1 ) ( <= Nl2main_fac1 1 ) ( <= ( - 1 ) Nl2main_j2 ) ( <= Nl2main_j2 1 ) ( <= ( - 1 ) Nl2main_i2 ) ( <= Nl2main_i2 1 ) ( <= ( - 1 ) Nl2main_fac2 ) ( <= Nl2main_fac2 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( > ( + ( * 1 lam0n0 ) ( * Nl2CT1 lam0n1 ) ( * Nl2CT2 lam0n2 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl2main_j1 lam0n1 ) ( * Nl2main_j2 lam0n2 ) ) 0 ) ( = ( + ( * Nl2main_i1 lam0n1 ) ( * Nl2main_i2 lam0n2 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl2main_fac1 lam0n1 ) ( * Nl2main_fac2 lam0n2 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( > ( + ( * 1 lam1n0 ) ( * Nl2CT1 lam1n1 ) ( * Nl2CT2 lam1n2 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2main_i1 1 ) ) ( * Nl2main_fac1 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * Nl2main_j1 lam1n1 ) ( * Nl2main_j2 lam1n2 ) ( - ( + 0 Nl2main_j1 ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam1n1 ) ( * Nl2main_i2 lam1n2 ) ( - ( + 0 ( * Nl2main_i1 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * Nl2main_fac1 lam1n1 ) ( * Nl2main_fac2 lam1n2 ) ) 0 ) ( = ( - ( + 0 ( * Nl2main_fac1 1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( > ( + ( * 1 lam0n0 ) ( * Nl2CT1 lam0n1 ) ( * Nl2CT2 lam0n2 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl2main_j1 lam0n1 ) ( * Nl2main_j2 lam0n2 ) ) 0 ) ( = ( + ( * Nl2main_i1 lam0n1 ) ( * Nl2main_i2 lam0n2 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * Nl2main_fac1 lam0n1 ) ( * Nl2main_fac2 lam0n2 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( > ( + ( * 1 lam2n0 ) ( * Nl2CT1 lam2n1 ) ( * Nl2CT2 lam2n2 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2main_i2 1 ) ) ( * Nl2main_fac2 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * Nl2main_j1 lam2n1 ) ( * Nl2main_j2 lam2n2 ) ( - ( + 0 Nl2main_j2 ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam2n1 ) ( * Nl2main_i2 lam2n2 ) ( - ( + 0 ( * Nl2main_i2 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * Nl2main_fac1 lam2n1 ) ( * Nl2main_fac2 lam2n2 ) ) 0 ) ( = ( - ( + 0 ( * Nl2main_fac2 1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( > ( + ( * 1 lam3n0 ) ( * Nl2CT1 lam3n1 ) ( * Nl2CT2 lam3n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * Nl2main_j1 lam3n1 ) ( * Nl2main_j2 lam3n2 ) ) 0 ) ( = ( + ( * Nl2main_i1 lam3n1 ) ( * Nl2main_i2 lam3n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl2main_fac1 lam3n1 ) ( * Nl2main_fac2 lam3n2 ) ) 0 ) ) ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( > ( + ( * 1 lam4n0 ) ( * Nl2CT1 lam4n1 ) ( * Nl2CT2 lam4n2 ) ( - 1 ( + ( + Nl2CT1 ( * Nl2main_i1 1 ) ) ( * Nl2main_fac1 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * Nl2main_j1 lam4n1 ) ( * Nl2main_j2 lam4n2 ) ( - ( + 0 Nl2main_j1 ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam4n1 ) ( * Nl2main_i2 lam4n2 ) ( - ( + 0 ( * Nl2main_i1 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl2main_fac1 lam4n1 ) ( * Nl2main_fac2 lam4n2 ) ) 0 ) ( = ( - ( + 0 ( * Nl2main_fac1 1 ) ) ) 0 ) ) ))
(assert ( or ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( > ( + ( * 1 lam3n0 ) ( * Nl2CT1 lam3n1 ) ( * Nl2CT2 lam3n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam3n0 ) ( * Nl2main_j1 lam3n1 ) ( * Nl2main_j2 lam3n2 ) ) 0 ) ( = ( + ( * Nl2main_i1 lam3n1 ) ( * Nl2main_i2 lam3n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl2main_fac1 lam3n1 ) ( * Nl2main_fac2 lam3n2 ) ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( > ( + ( * 1 lam5n0 ) ( * Nl2CT1 lam5n1 ) ( * Nl2CT2 lam5n2 ) ( - 1 ( + ( + Nl2CT2 ( * Nl2main_i2 1 ) ) ( * Nl2main_fac2 0 ) ) ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * Nl2main_j1 lam5n1 ) ( * Nl2main_j2 lam5n2 ) ( - ( + 0 Nl2main_j2 ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam5n1 ) ( * Nl2main_i2 lam5n2 ) ( - ( + 0 ( * Nl2main_i2 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl2main_fac1 lam5n1 ) ( * Nl2main_fac2 lam5n2 ) ) 0 ) ( = ( - ( + 0 ( * Nl2main_fac2 1 ) ) ) 0 ) ) ))
(assert ( and ( = ( + main_j ( * ( - 1 ) undef2 ) ) 0 ) ( = ( + ( - 1 ) main_i ) 0 ) ( = ( + ( - 1 ) main_fac ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2main_j1 ) main_j ) ( * ( + 0 Nl2main_i1 ) main_i ) ( * ( + 0 Nl2main_fac1 ) main_fac ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2main_j2 ) main_j ) ( * ( + 0 Nl2main_i2 ) main_i ) ( * ( + 0 Nl2main_fac2 ) main_fac ) ) 0 ) ))
(assert ( or ( and ( and ( and ( >= lam11n0 0 ) ( >= lam11n1 0 ) ( >= lam11n2 0 ) ( > ( + ( * 1 lam11n0 ) ( * Nl2CT1 lam11n1 ) ( * Nl2CT2 lam11n2 ) ( - 1 ( - ( + ( + RFN1_CT ( * RFN1_main_i 1 ) ) ( * RFN1_main_fac 0 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam11n0 ) ( * Nl2main_j1 lam11n1 ) ( * Nl2main_j2 lam11n2 ) ( - ( - ( + 0 RFN1_main_j ) RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam11n1 ) ( * Nl2main_i2 lam11n2 ) ( - ( - ( + 0 ( * RFN1_main_i 1 ) ) RFN1_main_i ) ) ) 0 ) ( = ( + ( * 1 lam11n0 ) ( * Nl2main_fac1 lam11n1 ) ( * Nl2main_fac2 lam11n2 ) ( - ( - RFN1_main_fac ) ) ) 0 ) ( = ( - ( + 0 ( * RFN1_main_fac 1 ) ) ) 0 ) ) ( and ( >= lam15n0 0 ) ( >= lam15n1 0 ) ( >= lam15n2 0 ) ( > ( + ( * 1 lam15n0 ) ( * Nl2CT1 lam15n1 ) ( * Nl2CT2 lam15n2 ) ( - 1 ( - ( + ( + RFN1_CT ( * RFN1_main_i 1 ) ) ( * RFN1_main_fac 0 ) ) RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam15n0 ) ( * Nl2main_j1 lam15n1 ) ( * Nl2main_j2 lam15n2 ) ( - ( - ( + 0 RFN1_main_j ) RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam15n1 ) ( * Nl2main_i2 lam15n2 ) ( - ( - ( + 0 ( * RFN1_main_i 1 ) ) RFN1_main_i ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam15n0 ) ( * Nl2main_fac1 lam15n1 ) ( * Nl2main_fac2 lam15n2 ) ( - ( - RFN1_main_fac ) ) ) 0 ) ( = ( - ( + 0 ( * RFN1_main_fac 1 ) ) ) 0 ) ) ) ( or ( and ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( > ( + ( * 1 lam9n0 ) ( * Nl2CT1 lam9n1 ) ( * Nl2CT2 lam9n2 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * Nl2main_j1 lam9n1 ) ( * Nl2main_j2 lam9n2 ) ( - ( - RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam9n1 ) ( * Nl2main_i2 lam9n2 ) ( - ( - RFN1_main_i ) ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * Nl2main_fac1 lam9n1 ) ( * Nl2main_fac2 lam9n2 ) ( - ( - RFN1_main_fac ) ) ) 0 ) ) ( and ( >= lam10n0 0 ) ( >= lam10n1 0 ) ( >= lam10n2 0 ) ( > ( + ( * 1 lam10n0 ) ( * Nl2CT1 lam10n1 ) ( * Nl2CT2 lam10n2 ) ( - 1 ( + ( - ( + ( + RFN1_CT ( * RFN1_main_i 1 ) ) ( * RFN1_main_fac 0 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam10n0 ) ( * Nl2main_j1 lam10n1 ) ( * Nl2main_j2 lam10n2 ) ( - ( - ( + 0 RFN1_main_j ) RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam10n1 ) ( * Nl2main_i2 lam10n2 ) ( - ( - ( + 0 ( * RFN1_main_i 1 ) ) RFN1_main_i ) ) ) 0 ) ( = ( + ( * 1 lam10n0 ) ( * Nl2main_fac1 lam10n1 ) ( * Nl2main_fac2 lam10n2 ) ( - ( - RFN1_main_fac ) ) ) 0 ) ( = ( - ( + 0 ( * RFN1_main_fac 1 ) ) ) 0 ) ) ) ( and ( and ( >= lam13n0 0 ) ( >= lam13n1 0 ) ( >= lam13n2 0 ) ( > ( + ( * 1 lam13n0 ) ( * Nl2CT1 lam13n1 ) ( * Nl2CT2 lam13n2 ) ( - 1 ( - RFN1_CT ) ) ) 0 ) ( = ( + ( * 1 lam13n0 ) ( * Nl2main_j1 lam13n1 ) ( * Nl2main_j2 lam13n2 ) ( - ( - RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam13n1 ) ( * Nl2main_i2 lam13n2 ) ( - ( - RFN1_main_i ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam13n0 ) ( * Nl2main_fac1 lam13n1 ) ( * Nl2main_fac2 lam13n2 ) ( - ( - RFN1_main_fac ) ) ) 0 ) ) ( and ( >= lam14n0 0 ) ( >= lam14n1 0 ) ( >= lam14n2 0 ) ( > ( + ( * 1 lam14n0 ) ( * Nl2CT1 lam14n1 ) ( * Nl2CT2 lam14n2 ) ( - 1 ( + ( - ( + ( + RFN1_CT ( * RFN1_main_i 1 ) ) ( * RFN1_main_fac 0 ) ) RFN1_CT ) 1 ) ) ) 0 ) ( = ( + ( * 1 lam14n0 ) ( * Nl2main_j1 lam14n1 ) ( * Nl2main_j2 lam14n2 ) ( - ( - ( + 0 RFN1_main_j ) RFN1_main_j ) ) ) 0 ) ( = ( + ( * Nl2main_i1 lam14n1 ) ( * Nl2main_i2 lam14n2 ) ( - ( - ( + 0 ( * RFN1_main_i 1 ) ) RFN1_main_i ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam14n0 ) ( * Nl2main_fac1 lam14n1 ) ( * Nl2main_fac2 lam14n2 ) ( - ( - RFN1_main_fac ) ) ) 0 ) ( = ( - ( + 0 ( * RFN1_main_fac 1 ) ) ) 0 ) ) ) ) ) ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( > ( + ( * 1 lam8n0 ) ( * Nl2CT1 lam8n1 ) ( * Nl2CT2 lam8n2 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * Nl2main_j1 lam8n1 ) ( * Nl2main_j2 lam8n2 ) ) 0 ) ( = ( + ( * Nl2main_i1 lam8n1 ) ( * Nl2main_i2 lam8n2 ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl2main_fac1 lam8n1 ) ( * Nl2main_fac2 lam8n2 ) ) 0 ) ) ( and ( >= lam12n0 0 ) ( >= lam12n1 0 ) ( >= lam12n2 0 ) ( > ( + ( * 1 lam12n0 ) ( * Nl2CT1 lam12n1 ) ( * Nl2CT2 lam12n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam12n0 ) ( * Nl2main_j1 lam12n1 ) ( * Nl2main_j2 lam12n2 ) ) 0 ) ( = ( + ( * Nl2main_i1 lam12n1 ) ( * Nl2main_i2 lam12n2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam12n0 ) ( * Nl2main_fac1 lam12n1 ) ( * Nl2main_fac2 lam12n2 ) ) 0 ) ) ) ))
(check-sat)
(exit)