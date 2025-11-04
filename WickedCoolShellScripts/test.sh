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

# Bash 4+ required
#
# declare -A dict
# dict=(["One"]=1 ["Two"]=2 ["Three"]=3)
# echo "${!dict[@]}"  # One Three Two
# echo "${dict[@]}"   # 1 3 2

# declare -A students
# students=([1]="Harry Potter" [2]="Ron Weasley" [3]="Hermione Granger")
# echo ${!students[@]} # 3 2 1

# for i in $(printf "%s\n" "${!students[@]}"| sort -n); do
#     echo "$i : ${students[$i]}"
# done

test_local_var()
{
    local x="I'm a local variable"
    if [[ -z $x ]]; then
        echo "String is empty"
    elif [[ -n $x ]]; then
        if [[ $x == "I'm a local variable" ]]; then
            x=${x/variable/string} 
            echo $x
        else
            echo $x
        fi
    else
        echo "None of the checks have passed"
    fi
}

test_local_var

# Bexause x is local scope, it is not visible outside of test_local_var and resuts in empty var check evaluating to true
if [[ -z $x ]]; then
    echo "String is empty"
elif [[ -n $x ]]; then
    echo $x
else
    echo "None of the checks have passed"
fi