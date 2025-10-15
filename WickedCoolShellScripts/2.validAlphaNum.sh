#!/bin/bash
#  validAlphaNum--Ensures that input consists only of alphanumeric and numeric characters.

validAlphaNum()
{
    # Valid arg: returns 0 is all upper+lower+digi; 1 otherwise
    validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

    if [ "$validchars" = "$1" ] ; then
        return 0
    else
        return 1
    fi
}

