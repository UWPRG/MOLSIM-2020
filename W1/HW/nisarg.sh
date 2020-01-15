#!/bin/bash

exec > output.txt

counter=1
while [ $counter -le 100 ]
do
        if [ $(($counter % 2)) == 1 ]
        then
		echo "odd"
                echo "The number is $counter and odd" >> odd.txt
		 
        fi

	if [ $((counter % 2)) == ] 
	then

		echo "The number is $counter and even" >> even.txt

		if [ "$counter" -ge 5 -a "$counter" -le 9 ] 
		then
			echo "Even and blue"
		fi

		if [ "$counter" -ge 10 -a "$counter" -le 20 ]
		then
			echo "Even and red"
		fi

		if [ "$counter" -gt 60 ] 
		then
			echo "Potato"
		fi
	fi
((counter++))
done
 
