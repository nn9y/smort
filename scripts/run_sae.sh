#! /bin/bash

SMORT_HOME='/home/yang/Projects/smort/'
smort=$SMORT_HOME'bin/smort'

SOLVER_HOME=$SMORT_HOME'solvers/'
sat_mr_file=$SMORT_HOME'scripts/sae_sat.mr'
unsat_mr_file=$SMORT_HOME'scripts/sae_unsat.mr'
package='extensions.sae'

BENCHMARKS="QF_S NIA NRA QF_NIA QF_SLIA QF_NRA LIA LRA QF_LIA QF_LRA"

cvc=($(find "${SOLVER_HOME}" -name 'cvc*'))
option=" --strings-exp"
for i in "${!cvc[@]}"
do
  cvc[i]+="$option"
done
z3=($(find "${SOLVER_HOME}" -name 'z3-*'))
suffix="/bin/z3"
for i in "${!z3[@]}"
do
  z3[i]+="$suffix"
done
solvers=("${cvc[@]}" "${z3[@]}")


solvers_string=$(printf "%s;" "${solvers[@]}" | sed 's/;$//')

for theory in $BENCHMARKS;
do
  python3 $smort "${solvers_string}" $sat_mr_file -mt -ms -m $package --sat-seeds "${SMORT_HOME}seeds/${theory}/sat"
  python3 $smort "${solvers_string}" $unsat_mr_file -mt -ms -m $package --unsat-seeds "${SMORT_HOME}seeds/${theory}/unsat"
done
