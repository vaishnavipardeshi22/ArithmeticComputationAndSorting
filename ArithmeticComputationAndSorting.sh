#!/bin/bash -x

echo "******************************  Welcome To Arithmetic Computation And Sorting ******************************"

# GET USER INPUT
read -p " Enter the number for a : " input1
read -p " Enter the number for b : " input2
read -p " Enter the number for c : " input3

# FIRST COMPUTATION FOR [ a + b * c ]
result1=`echo "scale=2; $input1 + $input2 * $input3" | bc`
