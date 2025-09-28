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

while IFS= read -r line; do
    # Process each line here
    echo "Processing line: $line"
    # You can perform other operations with the $line variable
done < 20-script-1.sh