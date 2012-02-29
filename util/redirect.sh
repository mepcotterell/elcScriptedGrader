#!/bin/bash
#
# redirect.sh 
#
# Usage: redirect.sh cmd input_file result_file error_file
#
# @author  Michael E. Cotterell <mepcotterell@gmail.com>
# @license LICENSE (MIT style license file).

echo " " | tee -a $3 $4
echo "$1" | tee -a $3 $4
echo " " | tee -a $3 $4
$1 < $2 >> $3 2>> $4

