#!/bin/bash
interfaces=($(ifconfig|grep ': '|awk -F ':' '{print $1}'))  # get avaliable interface
if [ $# != 1 ]||[ $1 = '-h' ]||[ $1 = "--help" ]  # no interface selected
then
	echo "Usage: ./arpings interface"
	echo "Avaliable interface:"
	echo "	${interfaces[@]}"
	echo "For example, scanning at eth0 interface: ./arpings eth0"
	exit	
fi

for interface in ${interfaces[@]}
do
	if [ $interface = $1 ]
	then
		ip=$(ifconfig|grep -A 1 $1|awk -F 'inet' '{print $2}'|awk '{print $1}')
		for i in $(seq 1 254)
		do
			if [ $(arping -I $1 -c 1 ${ip%.*}.$i|grep 'Received'|awk '{print $2}') = '1' ]  # output survival host
			then
				echo ${ip%.*}.$i  
			fi
		done
		exit
	fi
done

echo "Wrong interface!"
echo "Avaliable interface:"
echo "	${interfaces[@]}"



