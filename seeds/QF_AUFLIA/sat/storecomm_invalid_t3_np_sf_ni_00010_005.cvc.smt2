(set-info :smt-lib-version 2.6)
(set-logic QF_AUFLIA)
(set-info :source |
Benchmarks used in the followin paper:
Big proof engines as little proof engines: new results on rewrite-based satisfiability procedure
Alessandro Armando, Maria Paola Bonacina, Silvio Ranise, Stephan Schulz. 
PDPAR'05
http://www.ai.dist.unige.it/pdpar05/


|)
(set-info :category "crafted")
(set-info :status sat)
(declare-fun a_160 () (Array Int Int))
(declare-fun a_161 () (Array Int Int))
(declare-fun a_162 () (Array Int Int))
(declare-fun a_163 () (Array Int Int))
(declare-fun a_164 () (Array Int Int))
(declare-fun a_165 () (Array Int Int))
(declare-fun a_166 () (Array Int Int))
(declare-fun a_167 () (Array Int Int))
(declare-fun a_168 () (Array Int Int))
(declare-fun a_169 () (Array Int Int))
(declare-fun a_170 () (Array Int Int))
(declare-fun a_171 () (Array Int Int))
(declare-fun a_172 () (Array Int Int))
(declare-fun a_173 () (Array Int Int))
(declare-fun a_174 () (Array Int Int))
(declare-fun a_175 () (Array Int Int))
(declare-fun a_176 () (Array Int Int))
(declare-fun a_177 () (Array Int Int))
(declare-fun a_178 () (Array Int Int))
(declare-fun a_179 () (Array Int Int))
(declare-fun a1 () (Array Int Int))
(declare-fun e1 () Int)
(declare-fun e10 () Int)
(declare-fun e2 () Int)
(declare-fun e3 () Int)
(declare-fun e4 () Int)
(declare-fun e5 () Int)
(declare-fun e6 () Int)
(declare-fun e7 () Int)
(declare-fun e8 () Int)
(declare-fun e9 () Int)
(assert (= a_160 (store a1 1 e1)))
(assert (= a_161 (store a_160 2 e2)))
(assert (= a_162 (store a_161 3 e3)))
(assert (= a_163 (store a_162 4 e4)))
(assert (= a_164 (store a_163 5 e5)))
(assert (= a_165 (store a_164 6 e6)))
(assert (= a_166 (store a_165 7 e7)))
(assert (= a_167 (store a_166 8 e8)))
(assert (= a_168 (store a_167 9 e9)))
(assert (= a_169 (store a_168 1 e1)))
(assert (= a_170 (store a1 7 e7)))
(assert (= a_171 (store a_170 2 e2)))
(assert (= a_172 (store a_171 6 e6)))
(assert (= a_173 (store a_172 4 e4)))
(assert (= a_174 (store a_173 10 e10)))
(assert (= a_175 (store a_174 5 e5)))
(assert (= a_176 (store a_175 9 e9)))
(assert (= a_177 (store a_176 1 e1)))
(assert (= a_178 (store a_177 3 e3)))
(assert (= a_179 (store a_178 8 e8)))
(assert (not (= a_169 a_179)))
(check-sat)
(exit)