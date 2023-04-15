(set-info :smt-lib-version 2.6)
(set-logic QF_NIA)
(set-info
  :source |
SMT script generated by Ultimate LassoRanker [1].
Ultimate LassoRanker is a tool that analyzes termination and nontermination of 
lasso-shaped programs. This script contains the SMT commands that Ultimate 
LassoRanker used while checking if a lasso-shaped program has a geometric 
nontermination argument [2].

This SMT script belongs to a set of SMT scripts that was generated by applying
Ultimate Buchi Automizer [3,4] to the benchmarks from the SV-COMP 2015 [5,6] 
which are available at [7]. Ultimate Buchi Automizer takes omega-traces
(lasso-shaped programs) and uses LassoRanker in order to check if the 
lasso-shaped program is terminating.

2015-04-30, Matthias Heizmann (heizmann@informatik.uni-freiburg.de)


[1] https://ultimate.informatik.uni-freiburg.de/LassoRanker/
[2] Jan Leike, Matthias Heizmann:
Geometric Series as Nontermination Arguments for Linear Lasso Programs. 
CoRR abs/1405.4413 (2014)
http://arxiv.org/abs/1405.4413
[3] http://ultimate.informatik.uni-freiburg.de/BuchiAutomizer/
[4] Matthias Heizmann, Jochen Hoenicke, Andreas Podelski: Software Model 
Checking for People Who Love Automata. CAV 2013:36-52
[5] http://sv-comp.sosy-lab.org/2015/
[6] Dirk Beyer: Software Verification and Verifiable Witnesses - (Report on 
SV-COMP 2015). TACAS 2015: 401-416
[7] https://svn.sosy-lab.org/software/sv-benchmarks/tags/svcomp15/
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun |init_main_#t~mem1| () Int)
(declare-fun |honda_main_#t~mem1| () Int)
(declare-fun |ray_main_#t~mem1| () Int)
(declare-fun |init_#NULL.offset| () Int)
(declare-fun |honda_#NULL.offset| () Int)
(declare-fun |ray_#NULL.offset| () Int)
(declare-fun |init_main_#t~mem2| () Int)
(declare-fun |honda_main_#t~mem2| () Int)
(declare-fun |ray_main_#t~mem2| () Int)
(declare-fun |init_(ite (select #valid 0) 1 0)| () Int)
(declare-fun |honda_(ite (select #valid 0) 1 0)| () Int)
(declare-fun |ray_(ite (select #valid 0) 1 0)| () Int)
(declare-fun |init_main_#t~malloc0.offset| () Int)
(declare-fun |honda_main_#t~malloc0.offset| () Int)
(declare-fun |ray_main_#t~malloc0.offset| () Int)
(declare-fun
  |init_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| ()
  Int)
(declare-fun
  |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| ()
  Int)
(declare-fun
  |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| () Int)
(declare-fun |init_main_#t~malloc0.base| () Int)
(declare-fun |honda_main_#t~malloc0.base| () Int)
(declare-fun |ray_main_#t~malloc0.base| () Int)
(declare-fun init_main_~x~1.offset () Int)
(declare-fun honda_main_~x~1.offset () Int)
(declare-fun ray_main_~x~1.offset () Int)
(declare-fun |init_#NULL.base| () Int)
(declare-fun |honda_#NULL.base| () Int)
(declare-fun |ray_#NULL.base| () Int)
(declare-fun init_main_~x~1.base () Int)
(declare-fun honda_main_~x~1.base () Int)
(declare-fun ray_main_~x~1.base () Int)
(declare-fun |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| () Int)
(declare-fun |ray_(ite (select old(#valid) main_~x~1.base) 1 0)| () Int)
(declare-fun |honda_(ite (select old(#valid) 0) 1 0)| () Int)
(declare-fun |ray_(ite (select old(#valid) 0) 1 0)| () Int)
(declare-fun |honda_(select #length main_~x~1.base)| () Int)
(declare-fun |ray_(select #length main_~x~1.base)| () Int)
(declare-fun |honda_(ite (select #valid main_~x~1.base) 1 0)| () Int)
(declare-fun |ray_(ite (select #valid main_~x~1.base) 1 0)| () Int)
(declare-fun |honda_(select old(#length) main_~x~1.base)| () Int)
(declare-fun |ray_(select old(#length) main_~x~1.base)| () Int)
(declare-fun lambda () Int)
(assert
 (and
 (or
 (and (= |init_main_#t~mem1| |honda_main_#t~mem1|)
 (= |init_main_#t~mem2| |honda_main_#t~mem2|)
 (= |init_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 1)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 
 (- 1)) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| (- 1)) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| (- 1)) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 4) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 1) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 
 (- 1)) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| (- 1))
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| (- 1))
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset (- 1)) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 1) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 1) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| (- 1))
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 1) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| (- 1)) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 1) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 
 (- 4)) 0))
 (and (= |init_main_#t~mem1| |honda_main_#t~mem1|)
 (= |init_main_#t~mem2| |honda_main_#t~mem2|)
 (= |init_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base (- 1)) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 
 (- 1)) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 1)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 
 (- 1)) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| (- 1)) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| (- 1)) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 4) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| (- 1))
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| (- 1))
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset (- 1)) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 1) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 1) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| (- 1))
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 1) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 0) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| (- 1)) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 0) 0)
 (>=
 (+ (* |honda_main_#t~mem2| 0)
 (* |honda_(ite (select old(#valid) main_~x~1.base) 1 0)| 0)
 (* |honda_(ite (select old(#valid) 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.base| 0)
 (* |honda_(select #length main_~x~1.base)| 1) 
 (* honda_main_~x~1.base 0) 
 (* |honda_main_#t~mem1| 0) 
 (* |honda_#NULL.offset| 0) 
 (* |honda_(ite (select #valid 0) 1 0)| 0)
 (* |honda_main_#t~malloc0.offset| 0)
 (* |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)| 0)
 (* |honda_(ite (select #valid main_~x~1.base) 1 0)| 0)
 (* |honda_(select old(#length) main_~x~1.base)| 0)
 (* honda_main_~x~1.offset 0) 
 (* |honda_#NULL.base| 0) 
 (* |init_#NULL.offset| 0) 
 (* |init_(ite (select #valid 0) 1 0)| 0) 
 (* |init_main_#t~malloc0.offset| 0) 
 (* |init_main_#t~malloc0.base| 0) 
 (* init_main_~x~1.offset 0) 
 (* |init_#NULL.base| 0) (* init_main_~x~1.base 0) 
 (- 4)) 0)))
 (and
 (= |honda_(ite (select old(#valid) main_~x~1.base) 1 0)|
 (+ |honda_(ite (select old(#valid) main_~x~1.base) 1 0)|
 |ray_(ite (select old(#valid) main_~x~1.base) 1 0)|))
 (= |honda_(ite (select old(#valid) 0) 1 0)|
 (+ |honda_(ite (select old(#valid) 0) 1 0)|
 |ray_(ite (select old(#valid) 0) 1 0)|))
 (= |honda_main_#t~malloc0.base|
 (+ |honda_main_#t~malloc0.base| |ray_main_#t~malloc0.base|))
 (= |honda_(select #length main_~x~1.base)|
 (+ |honda_(select #length main_~x~1.base)|
 |ray_(select #length main_~x~1.base)|))
 (= honda_main_~x~1.base (+ honda_main_~x~1.base ray_main_~x~1.base))
 (= |honda_#NULL.offset| (+ |honda_#NULL.offset| |ray_#NULL.offset|))
 (= |honda_main_#t~malloc0.offset|
 (+ |honda_main_#t~malloc0.offset| |ray_main_#t~malloc0.offset|))
 (= |honda_(ite (select #valid 0) 1 0)|
 (+ |honda_(ite (select #valid 0) 1 0)| |ray_(ite (select #valid 0) 1 0)|))
 (= |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 (+ |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|))
 (= |honda_(ite (select #valid main_~x~1.base) 1 0)|
 (+ |honda_(ite (select #valid main_~x~1.base) 1 0)|
 |ray_(ite (select #valid main_~x~1.base) 1 0)|))
 (= |honda_(select old(#length) main_~x~1.base)|
 (+ |honda_(select old(#length) main_~x~1.base)|
 |ray_(select old(#length) main_~x~1.base)|))
 (= honda_main_~x~1.offset (+ honda_main_~x~1.offset ray_main_~x~1.offset))
 (= |honda_#NULL.base| (+ |honda_#NULL.base| |ray_#NULL.base|))
 (>=
 (+ (* (+ |honda_main_#t~mem2| |ray_main_#t~mem2|) 0)
 (*
 (+ |honda_(ite (select old(#valid) main_~x~1.base) 1 0)|
 |ray_(ite (select old(#valid) main_~x~1.base) 1 0)|) 0)
 (*
 (+ |honda_(ite (select old(#valid) 0) 1 0)|
 |ray_(ite (select old(#valid) 0) 1 0)|) 0)
 (* (+ |honda_main_#t~malloc0.base| |ray_main_#t~malloc0.base|) 0)
 (*
 (+ |honda_(select #length main_~x~1.base)|
 |ray_(select #length main_~x~1.base)|) 0)
 (* (+ honda_main_~x~1.base ray_main_~x~1.base) 0)
 (* (+ |honda_main_#t~mem1| |ray_main_#t~mem1|) 0)
 (* (+ |honda_#NULL.offset| |ray_#NULL.offset|) 0)
 (* (+ |honda_main_#t~malloc0.offset| |ray_main_#t~malloc0.offset|) 0)
 (* (+ |honda_(ite (select #valid 0) 1 0)| |ray_(ite (select #valid 0) 1 0)|)
 0)
 (*
 (+ |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|) 0)
 (*
 (+ |honda_(ite (select #valid main_~x~1.base) 1 0)|
 |ray_(ite (select #valid main_~x~1.base) 1 0)|) 1)
 (*
 (+ |honda_(select old(#length) main_~x~1.base)|
 |ray_(select old(#length) main_~x~1.base)|) 0)
 (* (+ honda_main_~x~1.offset ray_main_~x~1.offset) 0)
 (* (+ |honda_#NULL.base| |ray_#NULL.base|) 0) 
 (* |honda_main_#t~mem2| 0) 
 (* |honda_main_#t~mem1| 0) 
 (- 1)) 0)
 (>=
 (+ (* (+ |honda_main_#t~mem2| |ray_main_#t~mem2|) 0)
 (*
 (+ |honda_(ite (select old(#valid) main_~x~1.base) 1 0)|
 |ray_(ite (select old(#valid) main_~x~1.base) 1 0)|) 0)
 (*
 (+ |honda_(ite (select old(#valid) 0) 1 0)|
 |ray_(ite (select old(#valid) 0) 1 0)|) 0)
 (* (+ |honda_main_#t~malloc0.base| |ray_main_#t~malloc0.base|) 0)
 (*
 (+ |honda_(select #length main_~x~1.base)|
 |ray_(select #length main_~x~1.base)|) 0)
 (* (+ honda_main_~x~1.base ray_main_~x~1.base) 0)
 (* (+ |honda_main_#t~mem1| |ray_main_#t~mem1|) 0)
 (* (+ |honda_#NULL.offset| |ray_#NULL.offset|) 0)
 (* (+ |honda_main_#t~malloc0.offset| |ray_main_#t~malloc0.offset|) 0)
 (* (+ |honda_(ite (select #valid 0) 1 0)| |ray_(ite (select #valid 0) 1 0)|)
 0)
 (*
 (+ |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|) 
 (- 1))
 (*
 (+ |honda_(ite (select #valid main_~x~1.base) 1 0)|
 |ray_(ite (select #valid main_~x~1.base) 1 0)|) 0)
 (*
 (+ |honda_(select old(#length) main_~x~1.base)|
 |ray_(select old(#length) main_~x~1.base)|) 0)
 (* (+ honda_main_~x~1.offset ray_main_~x~1.offset) 0)
 (* (+ |honda_#NULL.base| |ray_#NULL.base|) 0) 
 (* |honda_main_#t~mem2| 0) 
 (* |honda_main_#t~mem1| 0) 6) 0)
 (>=
 (+ (* (+ |honda_main_#t~mem2| |ray_main_#t~mem2|) 0)
 (*
 (+ |honda_(ite (select old(#valid) main_~x~1.base) 1 0)|
 |ray_(ite (select old(#valid) main_~x~1.base) 1 0)|) 0)
 (*
 (+ |honda_(ite (select old(#valid) 0) 1 0)|
 |ray_(ite (select old(#valid) 0) 1 0)|) 0)
 (* (+ |honda_main_#t~malloc0.base| |ray_main_#t~malloc0.base|) 0)
 (*
 (+ |honda_(select #length main_~x~1.base)|
 |ray_(select #length main_~x~1.base)|) 1)
 (* (+ honda_main_~x~1.base ray_main_~x~1.base) 0)
 (* (+ |honda_main_#t~mem1| |ray_main_#t~mem1|) 0)
 (* (+ |honda_#NULL.offset| |ray_#NULL.offset|) 0)
 (* (+ |honda_main_#t~malloc0.offset| |ray_main_#t~malloc0.offset|) 0)
 (* (+ |honda_(ite (select #valid 0) 1 0)| |ray_(ite (select #valid 0) 1 0)|)
 0)
 (*
 (+ |honda_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|) 0)
 (*
 (+ |honda_(ite (select #valid main_~x~1.base) 1 0)|
 |ray_(ite (select #valid main_~x~1.base) 1 0)|) 0)
 (*
 (+ |honda_(select old(#length) main_~x~1.base)|
 |ray_(select old(#length) main_~x~1.base)|) 0)
 (* (+ honda_main_~x~1.offset ray_main_~x~1.offset) (- 1))
 (* (+ |honda_#NULL.base| |ray_#NULL.base|) 0) 
 (* |honda_main_#t~mem2| 0) 
 (* |honda_main_#t~mem1| 0) 
 (- 4)) 0)
 (= |ray_(ite (select old(#valid) main_~x~1.base) 1 0)|
 (* |ray_(ite (select old(#valid) main_~x~1.base) 1 0)| lambda))
 (= |ray_(ite (select old(#valid) 0) 1 0)|
 (* |ray_(ite (select old(#valid) 0) 1 0)| lambda))
 (= |ray_main_#t~malloc0.base| (* |ray_main_#t~malloc0.base| lambda))
 (= |ray_(select #length main_~x~1.base)|
 (* |ray_(select #length main_~x~1.base)| lambda))
 (= ray_main_~x~1.base (* ray_main_~x~1.base lambda))
 (= |ray_#NULL.offset| (* |ray_#NULL.offset| lambda))
 (= |ray_main_#t~malloc0.offset| (* |ray_main_#t~malloc0.offset| lambda))
 (= |ray_(ite (select #valid 0) 1 0)|
 (* |ray_(ite (select #valid 0) 1 0)| lambda))
 (= |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 (* |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 lambda))
 (= |ray_(ite (select #valid main_~x~1.base) 1 0)|
 (* |ray_(ite (select #valid main_~x~1.base) 1 0)| lambda))
 (= |ray_(select old(#length) main_~x~1.base)|
 (* |ray_(select old(#length) main_~x~1.base)| lambda))
 (= ray_main_~x~1.offset (* ray_main_~x~1.offset lambda))
 (= |ray_#NULL.base| (* |ray_#NULL.base| lambda))
 (>=
 (+ (* (* |ray_main_#t~mem2| lambda) 0)
 (* (* |ray_(ite (select old(#valid) main_~x~1.base) 1 0)| lambda) 0)
 (* (* |ray_(ite (select old(#valid) 0) 1 0)| lambda) 0)
 (* (* |ray_main_#t~malloc0.base| lambda) 0)
 (* (* |ray_(select #length main_~x~1.base)| lambda) 0)
 (* (* ray_main_~x~1.base lambda) 0) 
 (* (* |ray_main_#t~mem1| lambda) 0) 
 (* (* |ray_#NULL.offset| lambda) 0)
 (* (* |ray_main_#t~malloc0.offset| lambda) 0)
 (* (* |ray_(ite (select #valid 0) 1 0)| lambda) 0)
 (*
 (* |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 lambda) 0) (* (* |ray_(ite (select #valid main_~x~1.base) 1 0)| lambda) 1)
 (* (* |ray_(select old(#length) main_~x~1.base)| lambda) 0)
 (* (* ray_main_~x~1.offset lambda) 0) 
 (* (* |ray_#NULL.base| lambda) 0) 
 (* |ray_main_#t~mem2| 0) 
 (* |ray_main_#t~mem1| 0)) 0)
 (>=
 (+ (* (* |ray_main_#t~mem2| lambda) 0)
 (* (* |ray_(ite (select old(#valid) main_~x~1.base) 1 0)| lambda) 0)
 (* (* |ray_(ite (select old(#valid) 0) 1 0)| lambda) 0)
 (* (* |ray_main_#t~malloc0.base| lambda) 0)
 (* (* |ray_(select #length main_~x~1.base)| lambda) 0)
 (* (* ray_main_~x~1.base lambda) 0) 
 (* (* |ray_main_#t~mem1| lambda) 0) 
 (* (* |ray_#NULL.offset| lambda) 0)
 (* (* |ray_main_#t~malloc0.offset| lambda) 0)
 (* (* |ray_(ite (select #valid 0) 1 0)| lambda) 0)
 (*
 (* |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 lambda) (- 1))
 (* (* |ray_(ite (select #valid main_~x~1.base) 1 0)| lambda) 0)
 (* (* |ray_(select old(#length) main_~x~1.base)| lambda) 0)
 (* (* ray_main_~x~1.offset lambda) 0) 
 (* (* |ray_#NULL.base| lambda) 0) 
 (* |ray_main_#t~mem2| 0) 
 (* |ray_main_#t~mem1| 0)) 0)
 (>=
 (+ (* (* |ray_main_#t~mem2| lambda) 0)
 (* (* |ray_(ite (select old(#valid) main_~x~1.base) 1 0)| lambda) 0)
 (* (* |ray_(ite (select old(#valid) 0) 1 0)| lambda) 0)
 (* (* |ray_main_#t~malloc0.base| lambda) 0)
 (* (* |ray_(select #length main_~x~1.base)| lambda) 1)
 (* (* ray_main_~x~1.base lambda) 0) 
 (* (* |ray_main_#t~mem1| lambda) 0) 
 (* (* |ray_#NULL.offset| lambda) 0)
 (* (* |ray_main_#t~malloc0.offset| lambda) 0)
 (* (* |ray_(ite (select #valid 0) 1 0)| lambda) 0)
 (*
 (* |ray_(select (select #memory_int main_~x~1.base) main_~x~1.offset)|
 lambda) 0) (* (* |ray_(ite (select #valid main_~x~1.base) 1 0)| lambda) 0)
 (* (* |ray_(select old(#length) main_~x~1.base)| lambda) 0)
 (* (* ray_main_~x~1.offset lambda) (- 1)) 
 (* (* |ray_#NULL.base| lambda) 0) 
 (* |ray_main_#t~mem2| 0) 
 (* |ray_main_#t~mem1| 0)) 0) 
 (= lambda lambda)) (>= lambda 0)))
(check-sat)
(exit)
