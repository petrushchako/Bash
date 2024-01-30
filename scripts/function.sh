#!/bin/bash
USER=$1
age=$2


function quit {
    #Do Cleanup Stuff
    exit
    }
function hello {
    #Do Script Initialization Stuff
    echo "Hello, $USER!"
    echo "You are $age year old"
    }
hello
quit