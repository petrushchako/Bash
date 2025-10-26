#!/bin/bash
# nicenumber--Given a number, shows it in comma-separated form. Expects DD
# (decimal point delimited) and TD (thousand delimiter) to be instaniated.
# Instantiates nicenum or, is a secong arg is specified, the out is echoed to stdout

nicenumber()
{
    # Note that we assume that '.' is a decimal separator in the INPUT value to this script.
    # The decimal separator in the output value is '.' unless specified by the user with the -d flag.

    integer=$(echo $1| cut -d. -f1)         # Left of the decimal
    decimal=$(echo $1| cut -d. -f2)         # Right of the decimal

    # Check if number has more than the integer part.
    if [ "$decimal" != "$1" ] ; then
        # There is a fractional part, so let's include it.
        result="${DD:= '.'}$decimal"
    fi
}