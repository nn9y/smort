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
(declare-fun Nl2i^01 () Int)
(declare-fun lam0n0 () Int)
(declare-fun lam0n1 () Int)
(declare-fun lam0n2 () Int)
(declare-fun Nl2CT1 () Int)
(declare-fun lam1n0 () Int)
(declare-fun lam1n1 () Int)
(declare-fun lam1n2 () Int)
(declare-fun lam2n0 () Int)
(declare-fun lam2n1 () Int)
(declare-fun lam2n2 () Int)
(declare-fun lam2n3 () Int)
(declare-fun lam2n4 () Int)
(declare-fun lam2n5 () Int)
(declare-fun lam2n6 () Int)
(declare-fun lam2n7 () Int)
(declare-fun lam2n8 () Int)
(declare-fun lam2n9 () Int)
(declare-fun lam2n10 () Int)
(declare-fun lam2n11 () Int)
(declare-fun lam2n12 () Int)
(declare-fun lam2n13 () Int)
(declare-fun lam2n14 () Int)
(declare-fun lam3n0 () Int)
(declare-fun lam3n1 () Int)
(declare-fun lam3n2 () Int)
(declare-fun lam3n3 () Int)
(declare-fun lam3n4 () Int)
(declare-fun lam3n5 () Int)
(declare-fun lam3n6 () Int)
(declare-fun lam3n7 () Int)
(declare-fun lam3n8 () Int)
(declare-fun lam3n9 () Int)
(declare-fun lam3n10 () Int)
(declare-fun lam3n11 () Int)
(declare-fun lam3n12 () Int)
(declare-fun lam3n13 () Int)
(declare-fun lam3n14 () Int)
(declare-fun lam4n0 () Int)
(declare-fun lam4n1 () Int)
(declare-fun lam4n2 () Int)
(declare-fun lam4n3 () Int)
(declare-fun lam4n4 () Int)
(declare-fun lam4n5 () Int)
(declare-fun lam4n6 () Int)
(declare-fun lam4n7 () Int)
(declare-fun lam4n8 () Int)
(declare-fun lam4n9 () Int)
(declare-fun lam4n10 () Int)
(declare-fun lam4n11 () Int)
(declare-fun lam4n12 () Int)
(declare-fun lam4n13 () Int)
(declare-fun lam4n14 () Int)
(declare-fun undef57 () Int)
(declare-fun undef6180 () Int)
(declare-fun undef6191 () Int)
(declare-fun __const_7^0 () Int)
(declare-fun undef6231 () Int)
(declare-fun ap_listeners^0 () Int)
(declare-fun die_now^0 () Int)
(declare-fun i^0 () Int)
(declare-fun last_poll_idx^0 () Int)
(declare-fun lr^0 () Int)
(declare-fun num_listensocks^0 () Int)
(declare-fun requests_this_child^0 () Int)
(declare-fun status^0 () Int)
(declare-fun undef6239 () Int)
(declare-fun undef6232 () Int)
(declare-fun undef6238 () Int)
(declare-fun lam5n0 () Int)
(declare-fun lam5n1 () Int)
(declare-fun lam6n0 () Int)
(declare-fun lam6n1 () Int)
(assert ( and ( <= ( - 1 ) Nl2i^01 ) ( <= Nl2i^01 1 ) ))
(assert ( or ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( > ( + ( * 1 lam0n1 ) ( * Nl2CT1 lam0n2 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl2i^01 lam0n2 ) ) 0 ) ) ( and ( >= lam1n0 0 ) ( >= lam1n1 0 ) ( >= lam1n2 0 ) ( > ( + ( * 1 lam1n1 ) ( * Nl2CT1 lam1n2 ) ( - 1 ( + Nl2CT1 ( * Nl2i^01 ( - 1 ) ) ) ) ) 0 ) ( = ( + ( * ( - 1 ) lam1n1 ) ( * Nl2i^01 lam1n2 ) ( - ( + 0 ( * Nl2i^01 1 ) ) ) ) 0 ) ) ))
(assert ( or ( and ( not ( <= 1 0 ) ) ( <= ( + 1 ( * ( - 1 ) undef57 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6180 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6191 ) ) 0 ) ( = ( + ( * ( - 1 ) __const_7^0 ) undef6231 ) 0 ) ( = ( + ap_listeners^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = die_now^0 0 ) ( = ( + i^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = last_poll_idx^0 0 ) ( = ( + lr^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = ( + num_listensocks^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = requests_this_child^0 0 ) ( = ( + status^0 ( * ( - 1 ) undef6231 ) ) 0 ) ( = ( + undef6231 ( * ( - 1 ) undef6239 ) ) 0 ) ( = ( + undef6232 ( * ( - 1 ) undef6238 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2i^01 ) i^0 ) ) 0 ) ) ( and ( not ( <= 1 0 ) ) ( <= ( + 1 __const_7^0 ( * ( - 1 ) undef6231 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef57 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6180 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6191 ) ) 0 ) ( = ( + ap_listeners^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = die_now^0 0 ) ( = ( + i^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = last_poll_idx^0 0 ) ( = ( + lr^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = ( + num_listensocks^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = requests_this_child^0 0 ) ( = ( + status^0 ( * ( - 1 ) undef6231 ) ) 0 ) ( = ( + undef6231 ( * ( - 1 ) undef6239 ) ) 0 ) ( = ( + undef6232 ( * ( - 1 ) undef6238 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2i^01 ) i^0 ) ) 0 ) ) ( and ( not ( <= 1 0 ) ) ( <= ( + 1 ( * ( - 1 ) __const_7^0 ) undef6231 ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef57 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6180 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6191 ) ) 0 ) ( = ( + ap_listeners^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = die_now^0 0 ) ( = ( + i^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = last_poll_idx^0 0 ) ( = ( + lr^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = ( + num_listensocks^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = requests_this_child^0 0 ) ( = ( + status^0 ( * ( - 1 ) undef6231 ) ) 0 ) ( = ( + undef6231 ( * ( - 1 ) undef6239 ) ) 0 ) ( = ( + undef6232 ( * ( - 1 ) undef6238 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2i^01 ) i^0 ) ) 0 ) ) ))
(assert ( or ( or ( and ( >= lam5n0 0 ) ( >= lam5n1 0 ) ( > ( + ( * Nl2CT1 lam5n1 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam5n0 ) ( * Nl2i^01 lam5n1 ) ) 0 ) ) ( and ( >= lam6n0 0 ) ( >= lam6n1 0 ) ( > ( + ( * Nl2CT1 lam6n1 ) ( - 1 ) ) 0 ) ( = ( + ( * 1 lam6n0 ) ( * Nl2i^01 lam6n1 ) ) 0 ) ) ) ( and ( or ( and ( not ( <= 1 0 ) ) ( <= ( + 1 ( * ( - 1 ) undef57 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6180 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6191 ) ) 0 ) ( = ( + ( * ( - 1 ) __const_7^0 ) undef6231 ) 0 ) ( = ( + ap_listeners^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = die_now^0 0 ) ( = ( + i^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = last_poll_idx^0 0 ) ( = ( + lr^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = ( + num_listensocks^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = requests_this_child^0 0 ) ( = ( + status^0 ( * ( - 1 ) undef6231 ) ) 0 ) ( = ( + undef6231 ( * ( - 1 ) undef6239 ) ) 0 ) ( = ( + undef6232 ( * ( - 1 ) undef6238 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2i^01 ) i^0 ) ) 0 ) ) ( and ( not ( <= 1 0 ) ) ( <= ( + 1 __const_7^0 ( * ( - 1 ) undef6231 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef57 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6180 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6191 ) ) 0 ) ( = ( + ap_listeners^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = die_now^0 0 ) ( = ( + i^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = last_poll_idx^0 0 ) ( = ( + lr^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = ( + num_listensocks^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = requests_this_child^0 0 ) ( = ( + status^0 ( * ( - 1 ) undef6231 ) ) 0 ) ( = ( + undef6231 ( * ( - 1 ) undef6239 ) ) 0 ) ( = ( + undef6232 ( * ( - 1 ) undef6238 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2i^01 ) i^0 ) ) 0 ) ) ( and ( not ( <= 1 0 ) ) ( <= ( + 1 ( * ( - 1 ) __const_7^0 ) undef6231 ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef57 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6180 ) ) 0 ) ( <= ( + 1 ( * ( - 1 ) undef6191 ) ) 0 ) ( = ( + ap_listeners^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = die_now^0 0 ) ( = ( + i^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = last_poll_idx^0 0 ) ( = ( + lr^0 ( * ( - 1 ) undef6180 ) ) 0 ) ( = ( + num_listensocks^0 ( * ( - 1 ) undef57 ) ) 0 ) ( = requests_this_child^0 0 ) ( = ( + status^0 ( * ( - 1 ) undef6231 ) ) 0 ) ( = ( + undef6231 ( * ( - 1 ) undef6239 ) ) 0 ) ( = ( + undef6232 ( * ( - 1 ) undef6238 ) ) 0 ) ( <= ( + Nl2CT1 ( * ( + 0 Nl2i^01 ) i^0 ) ) 0 ) ) ) ( and ( >= lam0n0 0 ) ( >= lam0n1 0 ) ( >= lam0n2 0 ) ( > ( + ( * 1 lam0n1 ) ( * Nl2CT1 lam0n2 ) ( - 1 ) ) 0 ) ( = ( + ( * ( - 1 ) lam0n1 ) ( * Nl2i^01 lam0n2 ) ) 0 ) ) ) ))
(check-sat)
(exit)