#!/bin/bash

for i in $@;do
    echo $i
done

message=("Hello" "World")

echo $message[@]