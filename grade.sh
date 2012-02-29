#!/bin/bash
#
# elcScriptedGrader
#
# @author  Michael E. Cotterell <mepcotterell@gmail.com>
# @license LICENSE (MIT style license file).

# Set up some usefult variables
CWD=$(pwd)
IN="$CWD"/in
OUT="$CWD"/out
PAYLOAD="$CWD"/payload

# Make sure the 'in' directory exists
if [ ! -d "$IN" ]; then
    echo "The '$IN' directory doesn't exist!"
    exit 1
fi

# Make sure the 'payload' directory exists
if [ ! -d "$PAYLOAD" ]; then
    echo "The '$PAYLOAD' directory doesn't exist!"
    exit 1
fi

# Clean the grading workspace
rm -rf out

# Create the output directory
mkdir -p out


# Loop trhough each section
for student in in/*
do
    if [ -d "$student" ] 
    then

	echo " - Examining $(basename "$student")"

	cd "$student"

	echo "   - cleaning"

	rm -f *.class
	rm -f results.txt
	rm -f errors.txt

	echo "   - compiling"

	javac *.java 2>> errors.txt

	echo "   - testing"

	echo " " >> results.txt
	java CreditCardPayOff < ./../../tc1.txt >> results.txt 2>> errors.txt
	echo " " >> results.txt
	java CreditCardPayOff < ./../../tc2.txt >> results.txt 2>> errors.txt
	echo " " >> results.txt
	java CreditCardPayOff < ./../../tc3.txt >> results.txt 2>> errors.txt
	echo " " >> results.txt
	java CreditCardPayOff < ./../../tc4.txt >> results.txt 2>> errors.txt

	echo "   - done"

	if [ $(stat -c%s "errors.txt") -eq 0 ]
	then
	    rm -f errors.txt
	fi    

	cd ../../

    fi
done