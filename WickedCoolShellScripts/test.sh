#!/bin/bash

for i in $@;do
    echo $i
done

message=("Hello" "  " "World" "\n")
indexes=${!message[@]}

for i in {0..3}; do
    echo -ne "${message[i]}"
done


for i in ${!message[@]}; do
    printf "${message[i]}"
done


echo $indexes
echo {0..3}

declare -a cars
cars[0]="Audi"
cars[1]="Bently"
cars[2]="Cadillac"

echo "${cars[@]}"
unset cars[1]
echo "${cars[@]}"