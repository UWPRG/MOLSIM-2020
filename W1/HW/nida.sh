#!/bin/bash

n=1

while [ $n -le 100 ]
do 
	if [ $(($n % 2)) != 0 ]
	then
		echo -e "$n \t Odd"
	fi
	if  [ $n -le 9 ] && [ $n -ge 5 ] && [ $(($n % 2)) == 0 ]
	then
	       echo -e "$n \t Even and Blue"
	fi

	if  [ $n -le 20 ] && [ $n -ge 10 ] && [ $(($n % 2)) == 0 ]
	then
	       echo -e "$n \t Even and Red"
	fi

	if  [ $n -gt 60 ] && [ $(($n % 2)) == 0 ]
	then
	       echo -e "$n \t Potato"
	fi
	if [ $(($n % 2)) == 0 ]
	then 
		echo "$n" >> nida_even.txt
	fi
	if  [ $(($n % 2)) != 0 ]
	then 
		echo "$n" >> nida_odd.txt
	fi
n=$(($n+1))
done

