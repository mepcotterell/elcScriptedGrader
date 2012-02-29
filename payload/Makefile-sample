# Makefile for elcScriptedGrader
#
# @author  Michael E. Cotterell <mepcotterell@gmail.com>
# @license LICENSE (MIT style license file).
#
# EDIT THIS FILE TO BE PROJECT SPECIFIC!
#

all: clean compile test

compile:
	echo " " >> errors.txt
	echo "########## COMPILE ##########" >> errors.txt
	echo " " >> errors.txt
	javac -d classes *.java 2>> errors.txt

test:
	echo " " | tee -a results.txt errors.txt
	echo "######## TEST CASE 1 ########" | tee -a results.txt errors.txt
	echo " " | tee -a results.txt errors.txt
	java -cp classes SampleApp < tc1-sample.txt >> results.txt 2>> errors.txt

clean:
	rm -rf classes
	rm -f results.txt
	rm -f errors.txt
	mkdir -p classes

