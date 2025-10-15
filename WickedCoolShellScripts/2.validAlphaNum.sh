#!/bin/bash
#  validAlphaNum--Ensures that input consists only of alphanumeric and numeric characters.

validAlphaNum()
{
    # Valid arg: returns 0 is all upper+lower+digi; 1 otherwise
    #      The pattern: [^[:alnum:]]
    #      [:alnum:] is a POSIX character class meaning “alphanumeric characters” (A–Z, a–z, 0–9).
    #      [^ … ] means “not these characters.”
    #      So [^[:alnum:]] matches any character that is NOT alphanumeric (e.g., !, @, #, spaces, punctuation, etc.).
    #      The replacement: '' (empty) - This means any non-alphanumeric character is replaced with nothing (i.e., removed).
    validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

    if [ "$validchars" = "$1" ] ; then
        return 0
    else
        return 1
    fi
}

# BEGIN MAIN SCRIPT--DELETE OR COMMENT OUT EVERYTHING BELOW THIS LINE IF YOU WANT TO INCLUDE THIS IN OTHER SCRIPTS

/bin/echo -n "Enter input: "
read input

# Input validation
if !validAlphaNum "$input" ; then
    echo "Please enter only letters and numbers" >&2
    exit 1
else
    echo "Input valid"
fi
    exit 0