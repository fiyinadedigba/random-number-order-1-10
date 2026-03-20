#!/usr/bin/env bash
#==========================================================
# Script: random_1_10.sh
# Purpose: Generate a random permutation of integers in a given range
#==========================================================

set -euo pipefail

# Usage:
# ./random_1_10.sh [START] [END] [SEED]
# Example: ./random_1_10.sh 1 10
# Example with seed: ./random_shuffle.sh 1 100 42

#-----------------------------
# Parse input arguments
#-----------------------------
START=${1:-1}            # Default start = 1
END=${2:-10}             # Default end = 10
SEED=${3:-$RANDOM}       # Optional seed (default = random)

#-----------------------------
# Validate input
#-----------------------------
if ! [[ "$START" =~ ^[0-9]+$ ]] || ! [[ "$END" =~ ^[0-9]+$ ]]; then
    echo "Error: START and END must be non-negative integers."
    exit 1
fi

if (( START > END )); then
    echo "Error: START must be less than or equal to END."
    exit 1
fi

#-----------------------------
# Initialize RANDOM with seed
#-----------------------------
RANDOM=$SEED

#-----------------------------
# Build the numbers array
#-----------------------------
numbers=($(seq "$START" "$END"))
n=${#numbers[@]}

#-----------------------------
# Fisher–Yates shuffle
#-----------------------------
for ((i = n-1; i > 0; i--)); do
    j=$((RANDOM % (i+1)))
    # Swap numbers[i] and numbers[j]
    temp=${numbers[i]}
    numbers[i]=${numbers[j]}
    numbers[j]=$temp
done

#-----------------------------
# Print result
#-----------------------------
printf "%s\n" "${numbers[@]}"
