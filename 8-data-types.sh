#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER!+$NUMBER2))  # Outside brackets is for shell scripting and inside brackets is for addition.

echo "The sum amount is : $SUM"
