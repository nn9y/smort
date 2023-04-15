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
(declare-fun Nl16x0^01 () Int)
(declare-fun Nl16x1^01 () Int)
(declare-fun Nl16x0^02 () Int)
(declare-fun Nl16x1^02 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun Nl16CT1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun Nl16CT2 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun undef409 () Int)
(declare-fun undef109 () Int)
(declare-fun x0^0 () Int)
(declare-fun undef851 () Int)
(declare-fun x1^0 () Int)
(declare-fun undef859 () Int)
(declare-fun undef401 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n7 () Int)
(declare-fun lam4n8 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam4n3 () Int)
(declare-fun lam4n4 () Int)
(declare-fun lam4n5 () Int)
(declare-fun lam4n6 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n7 () Int)
(declare-fun lam5n8 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam5n2 () Int)
(declare-fun lam5n3 () Int)
(declare-fun lam5n4 () Int)
(declare-fun lam5n5 () Int)
(declare-fun lam5n6 () Int)
(assert ( and ( <= ( - 1 ) Nl16x0^01 ) ( <= Nl16x0^01 1 ) ( <= ( - 1 ) Nl16x1^01 ) ( <= Nl16x1^01 1 ) ( <= ( - 1 ) Nl16x0^02 ) ( <= Nl16x0^02 1 ) ( <= ( - 1 ) Nl16x1^02 ) ( <= Nl16x1^02 1 ) ))
(assert ( or ( and ( <= undef409 0 ) ( not ( <= ( + ( - 198 ) undef109 ) 0 ) ) ( = ( + x0^0 ( * ( - 1 ) undef851 ) ) 0 ) ( = ( + x1^0 ( * ( - 1 ) undef859 ) ) 0 ) ( = ( + ( * ( - 1 ) undef401 ) undef851 ) 0 ) ( = ( + ( * ( - 1 ) undef409 ) undef859 ) 0 ) ( <= ( + ( + ( + Nl16CT1 ( * Nl16x0^01 0 ) ) ( * Nl16x1^01 0 ) ) ( * ( + 0 ( * Nl16x0^01 1 ) ) undef851 ) ( * ( + 0 ( * Nl16x1^01 1 ) ) undef859 ) ) 0 ) ( <= ( + ( + ( + Nl16CT2 ( * Nl16x0^02 0 ) ) ( * Nl16x1^02 0 ) ) ( * ( + 0 ( * Nl16x0^02 1 ) ) undef851 ) ( * ( + 0 ( * Nl16x1^02 1 ) ) undef859 ) ) 0 ) ) ( and ( <= undef409 0 ) ( not ( <= ( + ( - 198 ) undef109 ) 0 ) ) ( = ( + x0^0 ( * ( - 1 ) undef401 ) ) 0 ) ( = ( + x1^0 ( * ( - 1 ) undef409 ) ) 0 ) ( <= ( + Nl16CT1 ( * ( + 0 Nl16x0^01 ) x0^0 ) ( * ( + 0 Nl16x1^01 ) x1^0 ) ) 0 ) ( <= ( + Nl16CT2 ( * ( + 0 Nl16x0^02 ) x0^0 ) ( * ( + 0 Nl16x1^02 ) x1^0 ) ) 0 ) ) ))
(assert ( or ( or ( and ( >= lam4n0 0 ) ( >= lam4n7 0 ) ( >= lam4n8 0 ) ( > ( + ( * Nl16CT1 lam4n7 ) ( * Nl16CT2 lam4n8 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam4n1 ) ( * Nl16x0^01 lam4n7 ) ( * Nl16x0^02 lam4n8 ) ) 0 ) ( = ( + ( * 1 lam4n2 ) ( * Nl16x1^01 lam4n7 ) ( * Nl16x1^02 lam4n8 ) ) 0 ) ( = ( * 1 lam4n3 ) 0 ) ( = ( * 1 lam4n4 ) 0 ) ( = ( * 1 lam4n5 ) 0 ) ( = ( * 1 lam4n6 ) 0 ) ( = ( + ( * ( - 1 ) lam4n1 ) ( * ( - 1 ) lam4n3 ) ) 0 ) ( = ( + ( * 1 lam4n0 ) ( * ( - 1 ) lam4n2 ) ( * ( - 1 ) lam4n4 ) ) 0 ) ( = ( * ( - 1 ) lam4n5 ) 0 ) ( = ( * ( - 1 ) lam4n6 ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n7 0 ) ( >= lam5n8 0 ) ( > ( + ( * Nl16CT1 lam5n7 ) ( * Nl16CT2 lam5n8 ) 199 ) 0 ) ( = ( + ( * 1 lam5n1 ) ( * Nl16x0^01 lam5n7 ) ( * Nl16x0^02 lam5n8 ) ) 0 ) ( = ( + ( * 1 lam5n2 ) ( * Nl16x1^01 lam5n7 ) ( * Nl16x1^02 lam5n8 ) ) 0 ) ( = ( - 1 ) 0 ) ( = ( * 1 lam5n3 ) 0 ) ( = ( * 1 lam5n4 ) 0 ) ( = ( * 1 lam5n5 ) 0 ) ( = ( * 1 lam5n6 ) 0 ) ( = ( + ( * ( - 1 ) lam5n1 ) ( * ( - 1 ) lam5n3 ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * ( - 1 ) lam5n2 ) ( * ( - 1 ) lam5n4 ) ) 0 ) ( = ( * ( - 1 ) lam5n5 ) 0 ) ( = ( * ( - 1 ) lam5n6 ) 0 ) ) ) ( and ( or ( and ( <= undef409 0 ) ( not ( <= ( + ( - 198 ) undef109 ) 0 ) ) ( = ( + x0^0 ( * ( - 1 ) undef851 ) ) 0 ) ( = ( + x1^0 ( * ( - 1 ) undef859 ) ) 0 ) ( = ( + ( * ( - 1 ) undef401 ) undef851 ) 0 ) ( = ( + ( * ( - 1 ) undef409 ) undef859 ) 0 ) ( <= ( + ( + ( + Nl16CT1 ( * Nl16x0^01 0 ) ) ( * Nl16x1^01 0 ) ) ( * ( + 0 ( * Nl16x0^01 1 ) ) undef851 ) ( * ( + 0 ( * Nl16x1^01 1 ) ) undef859 ) ) 0 ) ( <= ( + ( + ( + Nl16CT2 ( * Nl16x0^02 0 ) ) ( * Nl16x1^02 0 ) ) ( * ( + 0 ( * Nl16x0^02 1 ) ) undef851 ) ( * ( + 0 ( * Nl16x1^02 1 ) ) undef859 ) ) 0 ) ) ( and ( <= undef409 0 ) ( not ( <= ( + ( - 198 ) undef109 ) 0 ) ) ( = ( + x0^0 ( * ( - 1 ) undef401 ) ) 0 ) ( = ( + x1^0 ( * ( - 1 ) undef409 ) ) 0 ) ( <= ( + Nl16CT1 ( * ( + 0 Nl16x0^01 ) x0^0 ) ( * ( + 0 Nl16x1^01 ) x1^0 ) ) 0 ) ( <= ( + Nl16CT2 ( * ( + 0 Nl16x0^02 ) x0^0 ) ( * ( + 0 Nl16x1^02 ) x1^0 ) ) 0 ) ) ) false ) ))
(check-sat)
(exit)