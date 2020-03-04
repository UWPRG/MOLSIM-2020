#!/bin/bash

counter=1
while [ $counter -le 100 ]
do
        if [ $(($counter % 2)) == 1 ]
        then
                echo "odd"
                echo "$counter odd" >> odd.txt

        else
                if [ "$counter" -ge 5 -a "$counter" -le 9 ]
                then
                        echo "Even and Blue"
                fi

                if [ "$counter" -ge 10 -a "$counter" -le 20 ]
                then
                        echo "Even and red"
                fi

                if [ "$counter" -gt 60 ]
                then
                       echo "Potato"
                fi

        echo "$counter even" >> even.txt
        fi

((counter++))
done
