(set-info :smt-lib-version 2.6)
(set-logic NIA)
(set-info :source |These benchmarks are translations from the TPTP Library (Thousands of
Problems for Theorem Provers), see http://www.cs.miami.edu/~tptp/

The TPTP is maintained by Geoff Sutcliffe, and he contributed this
selection of benchmarks to SMT-LIB.
|)
(set-info :category "industrial")
(set-info :status sat)
(assert (not (forall ((?X Int) (?Y Int)) (= (* ?X ?X) ?Y))))
(check-sat)
(exit)