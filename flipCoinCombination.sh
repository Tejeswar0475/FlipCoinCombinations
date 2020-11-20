#!/bin/bash

read -p "How many times you want to flip:" num

function singletFlip()
{
	flip=$((RANDOM%2))

	if [ $flip == 1 ]
	then
		echo "Head-$flip"
		((h++))
		singlet[h]=$h
	else
		echo "Tail-$flip"
		((t++))
		singlet[t]=$t
	fi
}

function doubletFlip()
{
	flip=$((RANDOM%4))
	if [[ $flip == 0 ]]
	then
		((hh++))
		doublet[hh]=$hh
	elif [[ $flip == 1 ]]
	then
		((tt++))
		doublet[tt]=$tt
	elif [[ $flip == 2 ]]
	then
		((ht++))
		doublet[ht]=$ht
	else
		((th++))
		doublet[th]=$th
	fi
}


declare -A singlet

h=0
t=0

for (( i=0;i<$num;i++ ))
do
	singletFlip
done

for i in ${!singlet[@]}
do

	echo "$i - ${singlet[$i]}"
	if [[ $i -eq $h ]]
	then
		echo "Singlet Head Percentage H : `echo "scale=1; ${singlet[$i]}*100/$num" | bc ` %"
	else
		echo "Singlet Tail Percentage T : `echo "scale=1; ${singlet[$i]}*100/$num" | bc ` %"
	fi
done


declare -A doublet


hh=0
tt=0
ht=0
th=0


for (( i=0;i<$num;i++))
do
	doubletFlip
done

for j in ${!doublet[@]}
do
    echo "$j - ${doublet[$j]}"
    if [[ $j -eq hh ]]
    then
        echo "Doublet Head-Head Percentage HH : `echo "scale=1; ${doublet[$j]}*100/$num" | bc ` %"
    elif [[ $j -eq tt ]]
    then
        echo "Doublet Tail-Tail Percentage TT : `echo "scale=1; ${doublet[$j]}*100/$num" | bc ` %"
    elif [[ $j -eq ht ]]
    then
        echo "Doublet Head-Tail Percentage HT : `echo "scale=1; ${doublet[$j]}*100/$num" | bc ` %"
    else
        echo "Doublet Tail-Head Percentage TH : `echo "scale=1; ${doublet[$j]}*100/$num" | bc ` %"
    fi
done
