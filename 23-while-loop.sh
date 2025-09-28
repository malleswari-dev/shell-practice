#!/bin/bash


# Initialize a counter variable
count=1

# Loop while 'count' is less than or equal to 5
while [ $count -le 5 ]
do
  echo "Current count: $count"
  # Increment the counter
  count=$(( count + 1 ))
done

echo "Loop finished."