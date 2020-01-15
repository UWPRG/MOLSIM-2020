#!/bin/bash

##create new output file, clean slate
> evankomp.txt
> evankomp_odd.txt
> evankomp_even.txt

##Loop over n
for n in {1..100}
do
	#Print the number, do differentiate between inputs
	echo "n= $n" >> evankomp.txt

	#Test for even or odd
	if (( $n % 2 )); then
	#ODD
		#Print odd to main output
		echo "Odd" >> evankomp.txt
		#Send number to odds file
		echo $n >> evankomp_odd.txt
	else
	#EVEN
		#Range 5-9
		if ((n >= 5 && n <= 9)); then
			echo "Even and Blue" >> evankomp.txt
		fi
		#Range 10-20
                if ((n >= 10 && n <= 20)); then
                        echo "Even and Red" >> evankomp.txt
                fi
		#Range 5-9
                if ((n > 60)); then
                        echo "Potato" >> evankomp.txt
                fi
		#Also send it to evens file
		echo $n >> evankomp_even.txt 
	fi
	#Print a seperator
	echo "------------------------------------------" >>evankomp.txt
done

