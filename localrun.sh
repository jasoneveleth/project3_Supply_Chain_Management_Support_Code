#!/bin/bash

########################################
############# CSCI 2951-O ##############
########################################
E_BADARGS=65
if [ $# -ne 1 ]
then
	echo "Usage: `basename $0` <input>"
	exit $E_BADARGS
fi
	
export CP_SOLVER_EXEC=/Applications/CPLEX_Studio2211/cpoptimizer/bin/arm64_osx/cpoptimizer
python src/main.py "$1" 2> >(grep -v 'RuntimeWarning: docplex.cp is supported by Python versions' | grep -v 'warnings.warn(msg, RuntimeWarning)') | grep -v 'Using cp installation at'
