#!/bin/bash

for i in $@;do
    echo $i
done

message=("Hello" "  " "World" "\n")
indexes=${!message[@]}

for i in {0..3}; do
    echo -ne "${message[i]}"
done

echo $indexes
echo {0..3}

if [ $indexes -eq {0..3} ]; then
    echo "Equal"
else
    echo "not Equal"
fi