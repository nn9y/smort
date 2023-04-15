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
(declare-fun Nl2arg11 () Int)
(declare-fun Nl2arg12 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun Nl2CT2 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n1 () Int)
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
(declare-fun arg1 () Int)
(declare-fun undef10 () Int)
(declare-fun undef9 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(assert ( and ( <= ( - 1 ) Nl2arg11 ) ( <= Nl2arg11 1 ) ( <= ( - 1 ) Nl2arg12 ) ( <= Nl2arg12 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * Nl2CT1 lam0n2 ) ( * Nl2CT2 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n1 ) ( * Nl2arg11 lam0n2 ) ( * Nl2arg12 lam0n3 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( > ( + ( * Nl2CT1 lam1n2 ) ( * Nl2CT2 lam1n3 ) ( - 1 ( + Nl2CT1 ( * Nl2arg11 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam1n1 ) ( * Nl2arg11 lam1n2 ) ( * Nl2arg12 lam1n3 ) ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * Nl2CT1 lam0n2 ) ( * Nl2CT2 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n1 ) ( * Nl2arg11 lam0n2 ) ( * Nl2arg12 lam0n3 ) ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( > ( + ( * Nl2CT1 lam2n2 ) ( * Nl2CT2 lam2n3 ) ( - 1 ( + Nl2CT2 ( * Nl2arg12 1 ) ) ) ) 0 ) ( = ( + ( * 1 lam2n1 ) ( * Nl2arg11 lam2n2 ) ( * Nl2arg12 lam2n3 ) ) 0 ) ) ))
(assert ( or ( and ( not ( <= 1 0 ) ) ( <= arg1 0 ) ( <= ( * ( - 1 ) undef10 ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef9 ) ) 0 ) ( = ( + arg1 ( * ( - 1 ) undef10 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2arg11 ) arg1 ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2arg12 ) arg1 ) ) 0 ) ) ( and ( <= ( * ( - 1 ) undef10 ) 0 ) ( not ( <= arg1 0 ) ) ( <= ( + 1 ( * ( - 1 ) undef9 ) ) 0 ) ( not ( <= ( + 10 ( * ( - 1 ) arg1 ) ) 0 ) ) ( = ( + arg1 ( * ( - 1 ) undef10 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2arg11 ) arg1 ) ) 0 ) ( <= ( + Nl2CT2 ( * ( + 0 Nl2arg12 ) arg1 ) ) 0 ) ) ))
(assert ( or ( or ( and ( >= lam7n0 0 ) ( >= lam7n1 0 ) ( >= lam7n2 0 ) ( > ( + ( * ( - 9 ) lam7n0 ) ( * Nl2CT1 lam7n1 ) ( * Nl2CT2 lam7n2 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam7n0 ) ( * Nl2arg11 lam7n1 ) ( * Nl2arg12 lam7n2 ) ) 0 ) ) ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( > ( + ( * ( - 9 ) lam8n0 ) ( * Nl2CT1 lam8n1 ) ( * Nl2CT2 lam8n2 ) 1 ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * Nl2arg11 lam8n1 ) ( * Nl2arg12 lam8n2 ) ( - 1 ) ) 0 ) ) ) ( and ( and ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( > ( + ( * 1 lam3n3 ) ( - 1 Nl2CT1 ) ) 0 ) ( = ( + ( * 1 lam3n1 ) ( * 1 lam3n4 ) ( - ( + 0 Nl2arg11 ) ) ) 0 ) ( = ( * ( - 1 ) lam3n3 ) 0 ) ( = ( + ( * ( - 1 ) lam3n2 ) ( * ( - 1 ) lam3n4 ) ) 0 ) ) ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( > ( + ( * 1 lam4n3 ) ( - 1 Nl2CT2 ) ) 0 ) ( = ( + ( * 1 lam4n1 ) ( * 1 lam4n4 ) ( - ( + 0 Nl2arg12 ) ) ) 0 ) ( = ( * ( - 1 ) lam4n3 ) 0 ) ( = ( + ( * ( - 1 ) lam4n2 ) ( * ( - 1 ) lam4n4 ) ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n3 0 ) ( > ( + ( * 1 lam5n1 ) ( * 1 lam5n2 ) ( * ( - 9 ) lam5n3 ) ( - 1 Nl2CT1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n1 ) ( * 1 lam5n3 ) ( * 1 lam5n4 ) ( - ( + 0 Nl2arg11 ) ) ) 0 ) ( = ( * ( - 1 ) lam5n2 ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * ( - 1 ) lam5n4 ) ) 0 ) ) ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( >= lam6n2 0 ) ( >= lam6n3 0 ) ( > ( + ( * 1 lam6n1 ) ( * 1 lam6n2 ) ( * ( - 9 ) lam6n3 ) ( - 1 Nl2CT2 ) ) 0 ) ( = ( + ( * ( - 1 ) lam6n1 ) ( * 1 lam6n3 ) ( * 1 lam6n4 ) ( - ( + 0 Nl2arg12 ) ) ) 0 ) ( = ( * ( - 1 ) lam6n2 ) 0 ) ( = ( + ( * ( - 1 ) lam6n0 ) ( * ( - 1 ) lam6n4 ) ) 0 ) ) ) ( and ( >= lam0n0 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( > ( + ( * Nl2CT1 lam0n2 ) ( * Nl2CT2 lam0n3 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam0n1 ) ( * Nl2arg11 lam0n2 ) ( * Nl2arg12 lam0n3 ) ) 0 ) ) ) ))
(check-sat)
(exit)