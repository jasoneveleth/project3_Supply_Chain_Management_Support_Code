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

eval "$(conda shell.bash hook)"
conda activate ibm-cp-cplex

export DOCPLEX_COS_LOCATION=/Applications/CPLEX_Studio2211
python src/main.py "$1" 2> >(grep -v 'RuntimeWarning: docplex.cp is supported by Python versions' | grep -v 'warnings.warn(msg, RuntimeWarning)') | grep -v 'Using cp installation at'
