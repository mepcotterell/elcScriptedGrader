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
UTIL="$CWD"/util

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
	# copt from util to out
	cp -r "$UTIL"/* "$STUDENT_OUT"

       	echo "   - entering $STUDENT_OUT"
	cd "$STUDENT_OUT"

	echo "   - cleaning"
	make clean

	echo "   - compiling"
	make compile

	echo "   - testing"
	make test

	echo "   - finishing"
	# clean up error file if it's empty
	if [ $(stat -c%s "errors.txt") -eq 0 ]
	then
	    rm -f errors.txt
	fi    

	echo "   - done with $STUDENT_NAME"

    fi
done