#!/bin/bash
# validint--Validates integer input, allowing negative integers too

validint()
{
    # Validate first field and test that value against min value $2 and/or
    #  max value $3 if they are supplied. If the value isn't whithin range
    #  or it's not composed of just digits, fail.

    number="$1";  min="$2";  max="$3"

    # -z test means “string length is zero”
    if [ -z $number ] ; then 
        echo "You didn't enter anything. Please enter a number" >&2
        return 1
    fi

    # Is the first character a '-' sign?
    if [ "${number%${number#?}}" = "-" ]; then
        testvalue="${number#?}" #grab all but the first character to test
    else
        testvalue="$number"
    fi

    # Create a version of the number that has no digits for testing.
    nodigits="$(echo $testvalue | sed 's/[[:digit:]]//g')"

    # Check for nondigit characters
    # ! -z means “string length is not zero”
    if [ ! -z $nodigits ] ; then
        echo "Invalid number format! Only digits, no commas, spaces, etc" >&2
        return 1
    fi
}