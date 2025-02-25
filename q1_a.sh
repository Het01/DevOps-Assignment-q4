#!/bin/bash

# Function to sort digits in descending order
desc_sort() {
    echo "$1" | grep -o . | sort -r | tr -d '\n'
}

# Function to sort digits in ascending order
asc_sort() {
    echo "$1" | grep -o . | sort | tr -d '\n'
}

# Function to implement Kaprekar's routine
kaprekar_routine() {
    local num=$1
    local kaprekar_constant=6174
    
    while [[ $num -ne $kaprekar_constant ]]; do
        # Sort digits in ascending and descending order
        asc=$(asc_sort "$num")
        desc=$(desc_sort "$num")
        
        # Ensure the number has 4 digits
        num=$(echo "$desc - $asc" | bc)
        num=$(printf "%04d" $num)
        
        echo "$desc - $asc = $num"
    done
    
    echo "Kaprekar's routine reached 6174."
}

# Read input from user
echo -n "Enter a 4-digit number: "
read input_number
kaprekar_routine "$input_number"

