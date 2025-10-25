#!/bin/bash
# normdate--Normalizes month field in date specification to three letters,
# first letter capitalized. A helper function for Script #7, valid-date.
# Exit 0 if successful, 1 if error.

nothNumToName()
{
    case "$1" in
        1|01) month="Jan" ;;
        2|02) month="Feb" ;;
        3|03) month="Mar" ;;
        4|04) month="Apr" ;;
        5|05) month="May" ;;
        6|06) month="Jun" ;;
        7|07) month="Jul" ;;
        8|08) month="Aug" ;;
        9|09) month="Sep" ;;
        10)   month="Oct" ;;
        11)   month="Nov" ;;
        12)   month="Dec" ;;
        *)    echo "$0: Unknown month value $1" >&2
              exit 1
    esac
    return 0
}