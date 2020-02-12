#!/bin/bash -x

echo "******************************  Welcome To Arithmetic Computation And Sorting ******************************"

# GET USER INPUT
read -p " Enter the number for a : " input1
read -p " Enter the number for b : " input2
read -p " Enter the number for c : " input3

# FIRST COMPUTATION FOR [ a + b * c ]
result1=`echo "scale=2; $input1 + $input2 * $input3" | bc`

# SECOND COMPUTATION FOR [ a * b + c ]
result2=`echo "scale=2; $input1 * $input2 + $input3" | bc`

# THIRD COMPUTATION FOR [ c + a / b ]
result3=`echo "scale=2; $input3 + $input1 / $input2" | bc`

# FOURTH COMPUTATION FOR [ a % b + c ]
result4=`echo "$input1 % $input2 + $input3" | bc`

