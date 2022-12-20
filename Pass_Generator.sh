#!/bin/bash
echo "Generate a random password,press 0"
echo "Hash any word, press 2"
read  option
if [ $option -eq 0 ]
then 
	echo "Enter the pass length"
	read p_length
	if [ $p_length -le 1 ]
	then 
		echo "Length must be greater then 3 "
		exit
	else
		for x in {1..5}
		do
			openssl rand -base64 20 | cut -c 1-$p_length
		done
	fi
else [ $option -eq 2 ]
	echo "Enter the word you want to hash"
	read  word
	echo $(echo $word | base64)
fi
