#!/bin/bash

# Run script with
# ./add_cf_users.sh usernames.txt my_organization my_space

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

# Check if the input file and organization/space are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <user_file> <organization> <space>"
    exit 1
fi

# Input file containing usernames (one username per line)
user_file=$1

# Organization in Cloud Foundry
organization=$2

# Space in Cloud Foundry
space=$3

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
    # Check if the username is not empty
    if [ -n "$username" ]; then
        # Assign a specific role to the user in the space
        cf set-space-role "$username" "$organization" "$space" SpaceDeveloper
        echo "User '$username' added as SpaceDeveloper to space '$space' in organization '$organization'."
    fi
done < "$user_file"
