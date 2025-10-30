#!/usr/bin/env bash

declare -r version="1.0.0" # Create read only variable
#int="1.0.1" #Following reassignement with different type would case error: ./test.sh: line 4: int: readonly variable
echo -e "$0\nVersion: $version\v"

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


declare -A dict
dict=(["One"]=1 ["Two"]=2 ["Three"]=3)
echo "${!dict[@]}"  # One Three Two
echo "${dict[@]}"   # 1 3 2