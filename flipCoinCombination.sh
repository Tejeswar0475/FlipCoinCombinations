#!/bin/bash

declare -A coin
h=0
t=0
read -p "How many times you want to flip:" num

function flip()
{
	flip=$((RANDOM%2))

	if [ $flip == 1 ]
	then
		echo "Head-$flip"
		((h++))
		coin[h]=$h
	else
		echo "Tail-$flip"
		((t++))
		coin[t]=$t
	fi
}

for (( i=0;i<$num;i++ ))
do
	flip
done

for i in ${!coin[@]}
do

	echo "$i - ${coin[$i]}"
	if [[ $i -eq $h ]]
	then
		echo "Singlet Head Percentage H : `echo "scale=1; ${coin[$i]}*100/$num" | bc ` %"
	else
		echo "Singlet Head Percentage H : `echo "scale=1; ${coin[$i]}*100/$num" | bc ` %"
	fi
done
