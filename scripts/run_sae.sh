#! /bin/bash

SMORT_HOME=''
smort=$SMORT_HOME'bin/smort'

SOLVER_HOME=$SMORT_HOME'solvers/'
sat_mr_file=$SMORT_HOME'scripts/sae_sat.mr'
unsat_mr_file=$SMORT_HOME'scripts/sae_unsat.mr'
package='extensions.sae'

# Start all benchmarks.
BENCHMARKS="QF_S NIA NRA QF_NIA QF_SLIA QF_NRA LIA LRA QF_LIA QF_LRA"

cvc=( `find $SOLVERS_HOME -name 'cvc*'` )
option=" --strings-exp"
for i in "${!cvc[@]}"
do
  cvc[i]+="$option"
done
z3=( `find $SOLVERS_HOME -name 'z3-*'` )
suffix="/bin/z3"
for i in "${!z3[@]}"
do
  z3[i]+="$suffix"
done
solvers=("${cvc[@]}" "${z3[@]}")

array=("cvc4" "cvc5" "z3")
string="${array[*]}"
string="${string//${IFS:0:1}/;}"

solvers_string="${solvers[*]}"
solvers_string="${solvers_string//${IFS:0:1}/;}"

for theory in $BENCHMARKS;
do  
    python3 $smort $sat_mr_file "${solvers_string}" -mt -ms -m $package --sat-seeds "${SMORT_HOME}seeds/${theory}/sat"
    python3 $smort $unsat_mr_file "${solvers_string}" -mt -ms -m $package --unsat-seeds "${SMORT_HOME}seeds/${theory}/unsat"
done

