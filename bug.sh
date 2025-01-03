#!/bin/bash

# This script demonstrates a race condition that can lead to unexpected behavior.
# Two processes try to update a shared counter simultaneously.

counter=0

# Function to increment the counter
increment_counter() {
  local current_value=$(cat counter.txt)
  local new_value=$((current_value + 1))
  echo $new_value > counter.txt
}

# Create a counter file
echo 0 > counter.txt

# Run two processes concurrently
(increment_counter &)
(increment_counter &)
wait

# Expected value: 2.  Actual value might be 1 due to the race condition.
final_value=$(cat counter.txt)
echo "Final counter value: $final_value"