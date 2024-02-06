#!/bin/bash
ctrlc=0

function trap_ctrlc {
    let ctrlc++
    echo
    if [[ $ctrlc == 1 ]]; then
        echo "Stop doing that. "
    elif [[ $ctrlc == 2 ]]; then
        echo "I warned you... "
    else
        echo "Throwing in the towel. "
    fi
}

trap trap_ctrlc SIGINT

while true
do
    echo Sleeping. ..
    sleep 10
done