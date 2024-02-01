#!/bin/bash

for i in $(ls);do
    echo item: $i
done


for i in $(seq 1 10); do
    echo -n "$i "
done

mkdir newFolder 2> /dev/null|| cat <(ls -l newFolder)
cd newFolder
for i in $(seq 1 5); do
    touch file$i.txt
done