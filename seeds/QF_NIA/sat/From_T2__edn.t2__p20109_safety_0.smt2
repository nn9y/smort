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
(declare-fun Nl20__const_100^01 () Int)
(declare-fun Nl20__const_50^01 () Int)
(declare-fun Nl20__const_8^01 () Int)
(declare-fun Nl20d^01 () Int)
(declare-fun Nl20i19^01 () Int)
(declare-fun Nl20j20^01 () Int)
(declare-fun Nl20__const_100^02 () Int)
(declare-fun Nl20__const_50^02 () Int)
(declare-fun Nl20__const_8^02 () Int)
(declare-fun Nl20d^02 () Int)
(declare-fun Nl20i19^02 () Int)
(declare-fun Nl20j20^02 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun lam0n3 () Int)
(declare-fun lam0n4 () Int)
(declare-fun lam0n5 () Int)
(declare-fun Nl20CT1 () Int)
(declare-fun Nl20CT2 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam1n3 () Int)
(declare-fun lam1n4 () Int)
(declare-fun lam1n5 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
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
(declare-fun lam6n5 () Int)
(declare-fun lam7n0 () Int)
(declare-fun lam7n1 () Int)
(declare-fun lam7n2 () Int)
(declare-fun lam7n3 () Int)
(declare-fun lam7n4 () Int)
(declare-fun lam7n5 () Int)
(declare-fun __const_150^0 () Int)
(declare-fun i13^0 () Int)
(declare-fun __const_100^0 () Int)
(declare-fun __const_50^0 () Int)
(declare-fun undef1003 () Int)
(declare-fun sqr11^0 () Int)
(declare-fun undef1317 () Int)
(declare-fun undef1325 () Int)
(declare-fun __const_8^0 () Int)
(declare-fun d^0 () Int)
(declare-fun lam8n0 () Int)
(declare-fun lam8n1 () Int)
(declare-fun lam8n2 () Int)
(declare-fun lam8n3 () Int)
(declare-fun lam8n6 () Int)
(declare-fun lam8n7 () Int)
(declare-fun lam8n4 () Int)
(declare-fun lam8n5 () Int)
(declare-fun lam9n0 () Int)
(declare-fun lam9n1 () Int)
(declare-fun lam9n2 () Int)
(declare-fun lam9n3 () Int)
(declare-fun lam9n6 () Int)
(declare-fun lam9n7 () Int)
(declare-fun lam9n4 () Int)
(declare-fun lam9n5 () Int)
(assert ( and ( <= ( - 1 ) Nl20__const_100^01 ) ( <= Nl20__const_100^01 1 ) ( <= ( - 1 ) Nl20__const_50^01 ) ( <= Nl20__const_50^01 1 ) ( <= ( - 1 ) Nl20__const_8^01 ) ( <= Nl20__const_8^01 1 ) ( <= ( - 1 ) Nl20d^01 ) ( <= Nl20d^01 1 ) ( <= ( - 1 ) Nl20i19^01 ) ( <= Nl20i19^01 1 ) ( <= ( - 1 ) Nl20j20^01 ) ( <= Nl20j20^01 1 ) ( <= ( - 1 ) Nl20__const_100^02 ) ( <= Nl20__const_100^02 1 ) ( <= ( - 1 ) Nl20__const_50^02 ) ( <= Nl20__const_50^02 1 ) ( <= ( - 1 ) Nl20__const_8^02 ) ( <= Nl20__const_8^02 1 ) ( <= ( - 1 ) Nl20d^02 ) ( <= Nl20d^02 1 ) ( <= ( - 1 ) Nl20i19^02 ) ( <= Nl20i19^02 1 ) ( <= ( - 1 ) Nl20j20^02 ) ( <= Nl20j20^02 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( > ( + ( * 1 lam0n1 ) ( * 2 lam0n2 ) ( * 2 lam0n3 ) ( * Nl20CT1 lam0n4 ) ( * Nl20CT2 lam0n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl20__const_100^01 lam0n4 ) ( * Nl20__const_100^02 lam0n5 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * Nl20__const_50^01 lam0n4 ) ( * Nl20__const_50^02 lam0n5 ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam0n4 ) ( * Nl20__const_8^02 lam0n5 ) ) 0 ) ( = ( + ( * Nl20d^01 lam0n4 ) ( * Nl20d^02 lam0n5 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * Nl20i19^01 lam0n4 ) ( * Nl20i19^02 lam0n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl20j20^01 lam0n4 ) ( * Nl20j20^02 lam0n5 ) ) 0 ) ( = ( * ( - 1 ) lam0n3 ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( >= lam1n3 0 ) ( >= lam1n4 0 ) ( >= lam1n5 0 ) ( > ( + ( * 1 lam1n1 ) ( * 2 lam1n2 ) ( * 2 lam1n3 ) ( * Nl20CT1 lam1n4 ) ( * Nl20CT2 lam1n5 ) ( - 1 ( + ( + Nl20CT1 ( * Nl20i19^01 1 ) ) ( * Nl20j20^01 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n1 ) ( * Nl20__const_100^01 lam1n4 ) ( * Nl20__const_100^02 lam1n5 ) ( - ( + 0 Nl20__const_100^01 ) ) ) 0 ) ( = ( + ( * 1 lam1n0 ) ( * ( - 1 ) lam1n2 ) ( * Nl20__const_50^01 lam1n4 ) ( * Nl20__const_50^02 lam1n5 ) ( - ( + 0 Nl20__const_50^01 ) ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam1n4 ) ( * Nl20__const_8^02 lam1n5 ) ( - ( + 0 Nl20__const_8^01 ) ) ) 0 ) ( = ( + ( * Nl20d^01 lam1n4 ) ( * Nl20d^02 lam1n5 ) ( - ( + 0 Nl20d^01 ) ) ) 0 ) ( = ( + ( * 1 lam1n2 ) ( * Nl20i19^01 lam1n4 ) ( * Nl20i19^02 lam1n5 ) ( - ( + 0 ( * Nl20i19^01 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n0 ) ( * Nl20j20^01 lam1n4 ) ( * Nl20j20^02 lam1n5 ) ) 0 ) ( = ( * ( - 1 ) lam1n3 ) 0 ) ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( > ( + ( * 1 lam0n1 ) ( * 2 lam0n2 ) ( * 2 lam0n3 ) ( * Nl20CT1 lam0n4 ) ( * Nl20CT2 lam0n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl20__const_100^01 lam0n4 ) ( * Nl20__const_100^02 lam0n5 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * Nl20__const_50^01 lam0n4 ) ( * Nl20__const_50^02 lam0n5 ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam0n4 ) ( * Nl20__const_8^02 lam0n5 ) ) 0 ) ( = ( + ( * Nl20d^01 lam0n4 ) ( * Nl20d^02 lam0n5 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * Nl20i19^01 lam0n4 ) ( * Nl20i19^02 lam0n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl20j20^01 lam0n4 ) ( * Nl20j20^02 lam0n5 ) ) 0 ) ( = ( * ( - 1 ) lam0n3 ) 0 ) ) ( and ( >= lam2n0 0 ) ( >= lam2n1 0 ) ( >= lam2n2 0 ) ( >= lam2n3 0 ) ( >= lam2n4 0 ) ( >= lam2n5 0 ) ( > ( + ( * 1 lam2n1 ) ( * 2 lam2n2 ) ( * 2 lam2n3 ) ( * Nl20CT1 lam2n4 ) ( * Nl20CT2 lam2n5 ) ( - 1 ( + ( + Nl20CT2 ( * Nl20i19^02 1 ) ) ( * Nl20j20^02 0 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n1 ) ( * Nl20__const_100^01 lam2n4 ) ( * Nl20__const_100^02 lam2n5 ) ( - ( + 0 Nl20__const_100^02 ) ) ) 0 ) ( = ( + ( * 1 lam2n0 ) ( * ( - 1 ) lam2n2 ) ( * Nl20__const_50^01 lam2n4 ) ( * Nl20__const_50^02 lam2n5 ) ( - ( + 0 Nl20__const_50^02 ) ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam2n4 ) ( * Nl20__const_8^02 lam2n5 ) ( - ( + 0 Nl20__const_8^02 ) ) ) 0 ) ( = ( + ( * Nl20d^01 lam2n4 ) ( * Nl20d^02 lam2n5 ) ( - ( + 0 Nl20d^02 ) ) ) 0 ) ( = ( + ( * 1 lam2n2 ) ( * Nl20i19^01 lam2n4 ) ( * Nl20i19^02 lam2n5 ) ( - ( + 0 ( * Nl20i19^02 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam2n0 ) ( * Nl20j20^01 lam2n4 ) ( * Nl20j20^02 lam2n5 ) ) 0 ) ( = ( * ( - 1 ) lam2n3 ) 0 ) ) ))
(assert ( or ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( >= lam3n4 0 ) ( > ( + ( * 1 lam3n0 ) ( * 1 lam3n1 ) ( * 2 lam3n2 ) ( * Nl20CT1 lam3n3 ) ( * Nl20CT2 lam3n4 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl20__const_100^01 lam3n3 ) ( * Nl20__const_100^02 lam3n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n1 ) ( * Nl20__const_50^01 lam3n3 ) ( * Nl20__const_50^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam3n3 ) ( * Nl20__const_8^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20d^01 lam3n3 ) ( * Nl20d^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20i19^01 lam3n3 ) ( * Nl20i19^02 lam3n4 ) ) 0 ) ( = ( + ( * 1 lam3n1 ) ( * Nl20j20^01 lam3n3 ) ( * Nl20j20^02 lam3n4 ) ) 0 ) ( = ( * ( - 1 ) lam3n2 ) 0 ) ) ( and ( >= lam4n0 0 ) ( >= lam4n1 0 ) ( >= lam4n2 0 ) ( >= lam4n3 0 ) ( >= lam4n4 0 ) ( > ( + ( * 1 lam4n0 ) ( * 1 lam4n1 ) ( * 2 lam4n2 ) ( * Nl20CT1 lam4n3 ) ( * Nl20CT2 lam4n4 ) ( - 1 ( + Nl20CT1 ( * Nl20j20^01 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n0 ) ( * Nl20__const_100^01 lam4n3 ) ( * Nl20__const_100^02 lam4n4 ) ( - ( + 0 Nl20__const_100^01 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam4n1 ) ( * Nl20__const_50^01 lam4n3 ) ( * Nl20__const_50^02 lam4n4 ) ( - ( + 0 Nl20__const_50^01 ) ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam4n3 ) ( * Nl20__const_8^02 lam4n4 ) ( - ( + 0 Nl20__const_8^01 ) ) ) 0 ) ( = ( + ( * Nl20d^01 lam4n3 ) ( * Nl20d^02 lam4n4 ) ( - ( + 0 Nl20d^01 ) ) ) 0 ) ( = ( + ( * Nl20i19^01 lam4n3 ) ( * Nl20i19^02 lam4n4 ) ( - ( + 0 Nl20i19^01 ) ) ) 0 ) ( = ( + ( * 1 lam4n1 ) ( * Nl20j20^01 lam4n3 ) ( * Nl20j20^02 lam4n4 ) ( - ( + 0 ( * Nl20j20^01 1 ) ) ) ) 0 ) ( = ( * ( - 1 ) lam4n2 ) 0 ) ) ))
(assert ( or ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( >= lam3n4 0 ) ( > ( + ( * 1 lam3n0 ) ( * 1 lam3n1 ) ( * 2 lam3n2 ) ( * Nl20CT1 lam3n3 ) ( * Nl20CT2 lam3n4 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl20__const_100^01 lam3n3 ) ( * Nl20__const_100^02 lam3n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n1 ) ( * Nl20__const_50^01 lam3n3 ) ( * Nl20__const_50^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam3n3 ) ( * Nl20__const_8^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20d^01 lam3n3 ) ( * Nl20d^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20i19^01 lam3n3 ) ( * Nl20i19^02 lam3n4 ) ) 0 ) ( = ( + ( * 1 lam3n1 ) ( * Nl20j20^01 lam3n3 ) ( * Nl20j20^02 lam3n4 ) ) 0 ) ( = ( * ( - 1 ) lam3n2 ) 0 ) ) ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( >= lam5n2 0 ) ( >= lam5n3 0 ) ( >= lam5n4 0 ) ( > ( + ( * 1 lam5n0 ) ( * 1 lam5n1 ) ( * 2 lam5n2 ) ( * Nl20CT1 lam5n3 ) ( * Nl20CT2 lam5n4 ) ( - 1 ( + Nl20CT2 ( * Nl20j20^02 1 ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n0 ) ( * Nl20__const_100^01 lam5n3 ) ( * Nl20__const_100^02 lam5n4 ) ( - ( + 0 Nl20__const_100^02 ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam5n1 ) ( * Nl20__const_50^01 lam5n3 ) ( * Nl20__const_50^02 lam5n4 ) ( - ( + 0 Nl20__const_50^02 ) ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam5n3 ) ( * Nl20__const_8^02 lam5n4 ) ( - ( + 0 Nl20__const_8^02 ) ) ) 0 ) ( = ( + ( * Nl20d^01 lam5n3 ) ( * Nl20d^02 lam5n4 ) ( - ( + 0 Nl20d^02 ) ) ) 0 ) ( = ( + ( * Nl20i19^01 lam5n3 ) ( * Nl20i19^02 lam5n4 ) ( - ( + 0 Nl20i19^02 ) ) ) 0 ) ( = ( + ( * 1 lam5n1 ) ( * Nl20j20^01 lam5n3 ) ( * Nl20j20^02 lam5n4 ) ( - ( + 0 ( * Nl20j20^02 1 ) ) ) ) 0 ) ( = ( * ( - 1 ) lam5n2 ) 0 ) ) ))
(assert ( and ( <= ( + __const_150^0 ( * ( - 1 ) i13^0 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) __const_100^0 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) __const_50^0 ) ) 0 ) ( not ( <= ( + ( - 1 ) undef1003 ) 0 ) ) ( = ( + sqr11^0 ( * ( - 1 ) undef1317 ) ) 0 ) ( = ( + undef1317 ( * ( - 1 ) undef1325 ) ) 0 ) ( <= ( + ( + ( + Nl20CT1 ( * Nl20i19^01 0 ) ) ( * Nl20j20^01 0 ) ) ( * ( + 0 Nl20__const_100^01 ) __const_100^0 ) ( * ( + 0 Nl20__const_50^01 ) __const_50^0 ) ( * ( + 0 Nl20__const_8^01 ) __const_8^0 ) ( * ( + 0 Nl20d^01 ) d^0 ) ) 0 ) ( <= ( + ( + ( + Nl20CT2 ( * Nl20i19^02 0 ) ) ( * Nl20j20^02 0 ) ) ( * ( + 0 Nl20__const_100^02 ) __const_100^0 ) ( * ( + 0 Nl20__const_50^02 ) __const_50^0 ) ( * ( + 0 Nl20__const_8^02 ) __const_8^0 ) ( * ( + 0 Nl20d^02 ) d^0 ) ) 0 ) ))
(assert ( or ( or ( and ( >= lam8n0 0 ) ( >= lam8n1 0 ) ( >= lam8n2 0 ) ( >= lam8n3 0 ) ( >= lam8n6 0 ) ( >= lam8n7 0 ) ( > ( + ( * 1 lam8n1 ) ( * 1 lam8n2 ) ( * ( - 1 ) lam8n3 ) ( * Nl20CT1 lam8n6 ) ( * Nl20CT2 lam8n7 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n1 ) ( * 1 lam8n4 ) ( * Nl20__const_100^01 lam8n6 ) ( * Nl20__const_100^02 lam8n7 ) ) 0 ) ( = ( + ( * 1 lam8n0 ) ( * ( - 1 ) lam8n2 ) ( * 1 lam8n3 ) ( * Nl20__const_50^01 lam8n6 ) ( * Nl20__const_50^02 lam8n7 ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n2 ) ( * Nl20__const_8^01 lam8n6 ) ( * Nl20__const_8^02 lam8n7 ) ) 0 ) ( = ( + ( * 1 lam8n5 ) ( * Nl20d^01 lam8n6 ) ( * Nl20d^02 lam8n7 ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n3 ) ( * Nl20i19^01 lam8n6 ) ( * Nl20i19^02 lam8n7 ) ) 0 ) ( = ( + ( * ( - 1 ) lam8n0 ) ( * Nl20j20^01 lam8n6 ) ( * Nl20j20^02 lam8n7 ) ) 0 ) ( = ( * ( - 1 ) lam8n4 ) 0 ) ( = ( * ( - 1 ) lam8n5 ) 0 ) ) ( and ( >= lam9n0 0 ) ( >= lam9n1 0 ) ( >= lam9n2 0 ) ( >= lam9n3 0 ) ( >= lam9n6 0 ) ( >= lam9n7 0 ) ( > ( + ( * 1 lam9n1 ) ( * 1 lam9n2 ) ( * ( - 1 ) lam9n3 ) ( * Nl20CT1 lam9n6 ) ( * Nl20CT2 lam9n7 ) 2 ) 0 ) ( = ( + ( * ( - 1 ) lam9n1 ) ( * 1 lam9n4 ) ( * Nl20__const_100^01 lam9n6 ) ( * Nl20__const_100^02 lam9n7 ) ) 0 ) ( = ( + ( * 1 lam9n0 ) ( * ( - 1 ) lam9n2 ) ( * 1 lam9n3 ) ( * Nl20__const_50^01 lam9n6 ) ( * Nl20__const_50^02 lam9n7 ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n2 ) ( * Nl20__const_8^01 lam9n6 ) ( * Nl20__const_8^02 lam9n7 ) ) 0 ) ( = ( + ( * 1 lam9n5 ) ( * Nl20d^01 lam9n6 ) ( * Nl20d^02 lam9n7 ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n3 ) ( * Nl20i19^01 lam9n6 ) ( * Nl20i19^02 lam9n7 ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n0 ) ( * Nl20j20^01 lam9n6 ) ( * Nl20j20^02 lam9n7 ) ) 0 ) ( = ( + ( * ( - 1 ) lam9n4 ) ( - 1 ) ) 0 ) ( = ( * ( - 1 ) lam9n5 ) 0 ) ) ) ( and ( and ( <= ( + __const_150^0 ( * ( - 1 ) i13^0 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) __const_100^0 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) __const_50^0 ) ) 0 ) ( not ( <= ( + ( - 1 ) undef1003 ) 0 ) ) ( = ( + sqr11^0 ( * ( - 1 ) undef1317 ) ) 0 ) ( = ( + undef1317 ( * ( - 1 ) undef1325 ) ) 0 ) ( <= ( + ( + ( + Nl20CT1 ( * Nl20i19^01 0 ) ) ( * Nl20j20^01 0 ) ) ( * ( + 0 Nl20__const_100^01 ) __const_100^0 ) ( * ( + 0 Nl20__const_50^01 ) __const_50^0 ) ( * ( + 0 Nl20__const_8^01 ) __const_8^0 ) ( * ( + 0 Nl20d^01 ) d^0 ) ) 0 ) ( <= ( + ( + ( + Nl20CT2 ( * Nl20i19^02 0 ) ) ( * Nl20j20^02 0 ) ) ( * ( + 0 Nl20__const_100^02 ) __const_100^0 ) ( * ( + 0 Nl20__const_50^02 ) __const_50^0 ) ( * ( + 0 Nl20__const_8^02 ) __const_8^0 ) ( * ( + 0 Nl20d^02 ) d^0 ) ) 0 ) ) ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( >= lam0n3 0 ) ( >= lam0n4 0 ) ( >= lam0n5 0 ) ( > ( + ( * 1 lam0n1 ) ( * 2 lam0n2 ) ( * 2 lam0n3 ) ( * Nl20CT1 lam0n4 ) ( * Nl20CT2 lam0n5 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl20__const_100^01 lam0n4 ) ( * Nl20__const_100^02 lam0n5 ) ) 0 ) ( = ( + ( * 1 lam0n0 ) ( * ( - 1 ) lam0n2 ) ( * Nl20__const_50^01 lam0n4 ) ( * Nl20__const_50^02 lam0n5 ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam0n4 ) ( * Nl20__const_8^02 lam0n5 ) ) 0 ) ( = ( + ( * Nl20d^01 lam0n4 ) ( * Nl20d^02 lam0n5 ) ) 0 ) ( = ( + ( * 1 lam0n2 ) ( * Nl20i19^01 lam0n4 ) ( * Nl20i19^02 lam0n5 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n0 ) ( * Nl20j20^01 lam0n4 ) ( * Nl20j20^02 lam0n5 ) ) 0 ) ( = ( * ( - 1 ) lam0n3 ) 0 ) ) ( and ( >= lam3n0 0 ) ( >= lam3n1 0 ) ( >= lam3n2 0 ) ( >= lam3n3 0 ) ( >= lam3n4 0 ) ( > ( + ( * 1 lam3n0 ) ( * 1 lam3n1 ) ( * 2 lam3n2 ) ( * Nl20CT1 lam3n3 ) ( * Nl20CT2 lam3n4 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n0 ) ( * Nl20__const_100^01 lam3n3 ) ( * Nl20__const_100^02 lam3n4 ) ) 0 ) ( = ( + ( * ( - 1 ) lam3n1 ) ( * Nl20__const_50^01 lam3n3 ) ( * Nl20__const_50^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20__const_8^01 lam3n3 ) ( * Nl20__const_8^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20d^01 lam3n3 ) ( * Nl20d^02 lam3n4 ) ) 0 ) ( = ( + ( * Nl20i19^01 lam3n3 ) ( * Nl20i19^02 lam3n4 ) ) 0 ) ( = ( + ( * 1 lam3n1 ) ( * Nl20j20^01 lam3n3 ) ( * Nl20j20^02 lam3n4 ) ) 0 ) ( = ( * ( - 1 ) lam3n2 ) 0 ) ) ) ) ))
(check-sat)
(exit)