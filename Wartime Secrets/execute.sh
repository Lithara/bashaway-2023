#!/bin/bash

# Function to check if a string contains at least one lowercase character
contains_lowercase() {
    [[ $1 =~ [a-z] ]]
}

# Function to check if a string contains at least one uppercase character
contains_uppercase() {
    [[ $1 =~ [A-Z] ]]
}

# Function to check if a string contains at least one numeric character
contains_numeric() {
    [[ $1 =~ [0-9] ]]
}

# Function to check if a string is at least 8 characters long
is_length_valid() {
    local length=${#1}
    (( length >= 8 ))
}

# Main script

# Get the password from the user
read -p "Enter a password: " password

# Check if the password meets all criteria
if contains_lowercase "$password" && contains_uppercase "$password" && contains_numeric "$password" && is_length_valid "$password"; then
    echo "true"
else
    echo "false"
fi
