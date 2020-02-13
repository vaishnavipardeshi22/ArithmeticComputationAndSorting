#!/bin/bash -x

echo "******************************  Welcome To Arithmetic Computation And Sorting ******************************"

#GET USER INPUT
read -p " Enter the number for a : " input1
read -p " Enter the number for b : " input2
read -p " Enter the number for c : " input3

#FIRST COMPUTATION FOR [ a + b * c ]
result1=`echo "scale=2; $input1 + $input2 * $input3" | bc`

#SECOND COMPUTATION FOR [ a * b + c ]
result2=`echo "scale=2; $input1 * $input2 + $input3" | bc`

#THIRD COMPUTATION FOR [ c + a / b ]
result3=`echo "scale=2; $input3 + $input1 / $input2" | bc`

#FOURTH COMPUTATION FOR [ a % b + c ]
result4=`echo "$input1 % $input2 + $input3" | bc`

#DECLARE DICTIONARY AND STORE COMPUTATION RESULTS IN DICTIONARY
declare -A resultDictionary

resultDictionary[result1]=$result1
resultDictionary[result2]=$result2
resultDictionary[result3]=$result3
resultDictionary[result4]=$result4

#READ VALUES FROM DICTIONARY IN ARRAY
for (( i=0; i<${#resultDictionary[@]}; i++ ))
do
	resultArray[i]=${resultDictionary[result$(( i+1 ))]}
done

#FUNCTION SORTING RESULTS IN DECENDING ORDER
function descendingSort()
{
	for(( i=0; i<${#resultArray[@]}; i++ ))
	do
		for(( j=0; j<${#resultArray[@]}-1; j++ ))
		do
			if (( $(echo "${resultArray[j+1]} > ${resultArray[j]}" | bc -l) ))
			then
				temp=${resultArray[j]}
				resultArray[j]=${resultArray[j+1]}
				resultArray[j+1]=$temp
			fi
		done
	done
	echo ${resultArray[@]}
}

#FUNCTION CALL FOR SORTING IN DECENDING ORDER
descendingSort ${resultArray[@]}

#FUNCTION SORTING RESULTS IN ASCENDING ORDER
function ascendingSort()
{
	for(( i=0; i<${#resultArray[@]}; i++ ))
	do
		for(( j=0; j<${#resultArray[@]}-1; j++ ))
		do
			if (( $(echo "${resultArray[j+1]} < ${resultArray[j]}" | bc -l) ))
			then
				temp=${resultArray[j]}
				resultArray[j]=${resultArray[j+1]}
				resultArray[j+1]=$temp
			fi
		done
	done
	echo ${resultArray[@]}
}

#FUNCTION CALL FOR SORTING IN ASCENDING ORDER
ascendingSort ${resultArray[@]}
