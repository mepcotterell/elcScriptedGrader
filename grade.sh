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

# TODO Make sure the Makefile exists in the 'payload' directory

# Clean the grading workspace
rm -rf out

# Create the output directory
mkdir -p out

# Loop trhough each section
for STUDENT_IN in "$IN"/*
do
    if [ -d "$STUDENT_IN" ] 
    then

	# Usefule paths
	STUDENT_NAME=$(basename "$STUDENT_IN")
	STUDENT_OUT="$OUT"/"$STUDENT_NAME"

	# cd into CWD
	cd "$CWD"

	echo " - Examining $STUDENT_NAME > $STUDENT"

	echo "   - creating $OUT/$STUDENT_NAME directory"
	mkdir -p "$STUDENT_OUT"

	echo "   - copying needed files into $STUDENT_OUT"
	# copy from in to out
	cp -r "$STUDENT_IN"/* "$STUDENT_OUT"
	# copy from payload to out
	cp -r "$PAYLOAD"/* "$STUDENT_OUT"

       	echo "   - entering $STUDENT_OUT"
	cd "$STUDENT_OUT"

	echo "   - cleaning"
	make clean

	echo "   - compiling"
	make compile

	echo "   - testing"
	make test

	echo "   - finishing"
	# TODO clean up error file if it's empty

	#cd "$student"

	#echo "   - cleaning"

	#rm -f *.class
	#rm -f results.txt
	#rm -f errors.txt

	#echo "   - compiling"

	#javac *.java 2>> errors.txt

	#echo "   - testing"

	#echo " " >> results.txt
	#java CreditCardPayOff < ./../../tc1.txt >> results.txt 2>> errors.txt
	#echo " " >> results.txt
	#java CreditCardPayOff < ./../../tc2.txt >> results.txt 2>> errors.txt
	#echo " " >> results.txt
	#java CreditCardPayOff < ./../../tc3.txt >> results.txt 2>> errors.txt
	#echo " " >> results.txt
	#java CreditCardPayOff < ./../../tc4.txt >> results.txt 2>> errors.txt

	#echo "   - done"

	#if [ $(stat -c%s "errors.txt") -eq 0 ]
	#then
	#    rm -f errors.txt
	#fi    

	cd ../../

    fi
done