#!/bin/bash

read -p "How many times you want to flip:" num

function singletFlip()
{
	flip=$((RANDOM%2))

	if [ $flip == 1 ]
	then
		((h++))
		singlet[h]=$h
	else

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

function tripletFlip()
{
	flip=$((RANDOM%8))
	if [ $flip -eq 0 ]
	then
		((hhh++))
		triplet[hhh]=$hhh
	elif [ $flip -eq 1 ]
	then
		((hht++))
		triplet[hht]=$hht
	elif [ $flip -eq 2 ]
	then
		((hth++))
		triplet[hth]=$hth
	elif [ $flip -eq 3 ]
	then
		((htt++))
		triplet[htt]=$htt
	elif [ $flip -eq 4 ]
	then
		((thh++))
		triplet[thh]=$thh
	elif [ $flip -eq 5 ]
	then
		((tht++))
		triplet[tht]=$tht
	elif [ $flip -eq 6 ]
	then
		((tth++))
		triplet[tth]=$tth
	else
		((ttt++))
		triplet[ttt]=$ttt
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


declare -A triplet

hhh=0
hht=0
hth=0
htt=0

ttt=0
thh=0
tht=0
tth=0

for (( i=0; i<$num; i++ ))
do
	tripletFlip
done

for k in ${!triplet[@]}
do
    echo "$k - ${triplet[$k]}"
    if [[ $k -eq hhh ]]
    then
        echo "Triplet H-H-H percentage : `echo "scale=1; ${triplet[$k]}*100/$num" | bc ` %"
    elif [[ $k -eq hht ]]
    then
        echo "Triplet H-H-T percentage : `echo "scale=1; ${triplet[$k]}*100/$num" | bc ` %"
    elif [[ $k -eq hth ]]
    then
        echo "Triplet H-T-H percentage : `echo "scale=1; ${triplet[$k]}*100/$num" | bc ` %"
    elif [[ $k -eq htt ]]
    then
        echo "Triplet H-T-T percentage : `echo "scale=1; ${triplet[$k]}*100/$num" | bc ` %"
    elif [[ $k -eq thh ]]
    then
        echo "Triplet T-H-H percentage : `echo "scale=1; ${triplet[$k]}*100/$num" | bc ` %"
    elif [[ $k -eq tht ]]
    then
        echo "Triplet T-H-T percentage : `echo "scale=1; ${triplet[$k]}*100/$num" | bc ` %"
    elif [[ $k -eq tth ]]
    then
        echo "Triplet T-T-H percentage : `echo "scale=1; ${triplet[$k]}*100/$num" | bc ` %"
    else
        echo "Triplet T-T-T percentage : `echo "scale=1; ${triplet[$k]}*100/$num" | bc ` %"
    fi
done



