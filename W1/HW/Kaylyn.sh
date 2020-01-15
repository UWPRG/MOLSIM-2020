#!/bin/bash
#Print odds to file.
for n in {1..100};
do
	if (( n % 2 == 1 ));
	then
	echo "Odd" >> kaylyn.txt
	echo "$n" >> kaylyn_odd.txt
	else
		if (( 5 <= n && n <=9 ));
		then
			echo "Even and Blue" >> kaylyn.txt
		fi
		if (( 10 <= n && n<= 20 ));
		then
			echo "Even and Red" >> kaylyn.txt
		fi
		if (( 60 <= n ));
		then
			echo "Potato" >> kaylyn.txt
		fi
	echo "$n" >> kaylyn_even.txt
	fi
done
