#!/bin/bash

if [ $1 == "" ]
then 
	echo " You didn't give the IP"
	echo " usage: ./PingWithNmap.sh <IP>"
	echo " this script will scan the network with ping and after that active host scanned by nmap"
else
	for ip in $(seq 1 255)
	do
		ping  $1.$ip -c 1 | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
	
		#echo $1.$ip
	done > ip.txt
fi

#Now for the nmap scan
for ip in $(cat ip.txt)
do
	nmap -F $ip
done 
