#!/bin/bash
# everything in shell as considered as string
NUMBER1=100
NUMBER2=200
NAME=devops

SUM=$(($NUMBER1+$NUMBER2))
echo "SUM is:${SUM}"

# SUM=$(($NUMBER1+$NUMBER2+$NAME))
# echo "SUM is:${SUM}"

#size =4,max index = 3
LEADERS=("modi" "putin" "trudo" "trump")

echo "all leaders:${LEADERS[@]}"
echo "first leader:${LEADERS[0]}"
echo "second leader:${LEADERS[1]}"
echo "first leader:${LEADERS[10]}"