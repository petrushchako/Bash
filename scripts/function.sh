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

ls (){
    command ls $1
}

ls "-l" | sort -R


VAR1="ABC"

function init {
    VAR2="DEF"
    local VAR3="GHI"
    echo "Inside the function: $VAR1$VAR2$VAR3"
}
init
echo "Outside of the function $VAR1$VAR2$VAR3"


hello
quit