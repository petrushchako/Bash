#!/bin/bash

# File to use with script:
#  abc.txt
#    user1@example.com
#    user2@example.com
#    user3@example.com

# Usage: script.sh -f <user_file> -o <organization> -s <space>

# Function to display usage instructions
usage() {
    echo "Usage: $0 -f <user_file> -o <organization> -s <space>"
    exit 1
}

# Check if CF CLI is installed
if ! command -v cf &> /dev/null; then
    echo "Error: CF CLI is not installed. Please install it and try again."
    exit 1
fi

# Check if the user is logged in to CF
if ! cf target &> /dev/null; then
    echo "Error: Not logged in to Cloud Foundry. Please log in and try again."
    exit 1
fi

# Parse command-line arguments
while getopts "f:o:s:" opt; do
    case "$opt" in
        f) user_file="$OPTARG" ;;
        o) organization="$OPTARG" ;;
        s) space="$OPTARG" ;;
        *) usage ;;
    esac
done

# Ensure all required parameters are provided
if [ -z "$user_file" ] || [ -z "$organization" ] || [ -z "$space" ]; then
    usage
fi

# Check if the input file exists
if [ ! -f "$user_file" ]; then
    echo "Error: File '$user_file' not found."
    exit 1
fi

# Check if the organization exists
if ! cf org "$organization" &> /dev/null; then
    echo "Error: Organization '$organization' not found in Cloud Foundry."
    exit 1
fi

# Check if the space exists
if ! cf space "$space" &> /dev/null; then
    echo "Error: Space '$space' not found in organization '$organization'."
    exit 1
fi

# Loop through each username in the input file
while IFS= read -r username; do
    if [ -n "$username" ]; then
        cf set-space-role "$username" "$organization" "$space" SpaceDeveloper
        echo "User '$username' added as SpaceDeveloper to space '$space' in organization '$organization'."
    fi
done < "$user_file"
