#!/bin/bash

# Problem 1
for n in {1..100}; do
  if [[ $(($n % 2)) -eq 1 ]]; then
    echo "Odd" >> dave_juergens.txt
    echo $n >> dave_juergens_odd.txt
  elif [[ $(($n % 2)) -eq 0 ]]; then
    echo $n >> dave_juergens_even.txt
    if [[ (($n -ge 5)) && (($n -le 9)) ]]; then
      echo "Even and Blue" >> dave_juergens.txt
    elif [[ (($n -ge 10)) && (($n -le 20)) ]]; then
      echo "Even and Red" >> dave_juergens.txt
    elif [[ (($n > 60)) ]]; then
      echo "Potato" >> dave_juergens.txt
    fi
  fi
done
