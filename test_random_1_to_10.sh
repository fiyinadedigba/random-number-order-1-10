#!/usr/bin/env bash
#==========================================================
# Test Script: test_random_1_to_10.sh
# Purpose: Test random_1_to_10.sh for correctness
# Usage: ./test_random_1_to_10.sh <script_to_test> [START] [END] [SEED]
#==========================================================

set -euo pipefail

#-----------------------------
# Parse arguments
#-----------------------------
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <script_to_test> [START] [END] [SEED]"
    exit 1
fi

SCRIPT="$1"

START="${2:-1}"
END="${3:-10}"
SEED="${4:-42}"

fail() { echo "Test failed: $1"; exit 1; }
pass() { echo "TEST PASSED:  $1"; }

#-----------------------------
# Run the script
#-----------------------------
output="$($SCRIPT "$START" "$END" "$SEED")"

#-----------------------------
# Test 1: Correct number of lines
#-----------------------------
count=$(echo "$output" | wc -l | tr -d ' ')
expected_count=$((END - START + 1))
if [[ "$count" -ne "$expected_count" ]]; then
    fail "Expected $expected_count numbers, got $count"
else
    pass "Correct number of lines ($expected_count)"
fi

#-----------------------------
# Test 2: Numbers within range
#-----------------------------
invalid=$(echo "$output" | awk -v s="$START" -v e="$END" '$1 < s || $1 > e')
if [[ -n "$invalid" ]]; then
    fail "Found numbers outside range $START-$END"
else
    pass "All numbers within range $START-$END"
fi

#-----------------------------
# Test 3: No duplicates
#-----------------------------
duplicates=$(echo "$output" | sort | uniq -d)
if [[ -n "$duplicates" ]]; then
    fail "Duplicate numbers found: $duplicates"
else
    pass "No duplicates"
fi

#-----------------------------
# Test 4: All numbers present
#-----------------------------
missing=$(comm -23 <(seq "$START" "$END" | sort) <(echo "$output" | sort))
if [[ -n "$missing" ]]; then
    fail "Missing numbers: $missing"
else
   pass "All numbers $START-$END present"
fi

echo "All tests passed!"
