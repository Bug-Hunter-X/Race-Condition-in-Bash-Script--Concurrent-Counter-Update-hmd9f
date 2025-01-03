#!/bin/bash

# This script demonstrates a solution to the race condition using a lock file.

counter=0
lockfile="counter.lock"

# Function to increment the counter
increment_counter() {
  # Acquire the lock
  flock -x "$lockfile" || exit 1
  local current_value=$(cat counter.txt)
  local new_value=$((current_value + 1))
  echo $new_value > counter.txt
  # Release the lock
  flock -u "$lockfile"
}

# Create a counter file
echo 0 > counter.txt

# Run two processes concurrently
(increment_counter &)
(increment_counter &)
wait

# Expected value: 2
final_value=$(cat counter.txt)
echo "Final counter value: $final_value"