#!/bin/bash
#Index starts from 0, size is 3 for below.
FRUITS=("Orange" "Apple" "KIWI") #Arrray  Index first element startrs with 0.

echo "first fruit is : ${FRUITS[0]}"
echo "first fruit is : ${FRUITS[1]}"
echo "first fruit is : ${FRUITS[2]}"

echo "first fruit is : ${FRUITS[@}"

