#!/bin/bash



NUMBER=$1

echo "please enter the number :$1"

if[ $NUMBER -gt 20]
then
    echo "entered values $NUMBER is greated than 20"
else 
    echo "entered value $NUMBER is less than 20"

fi