#!/bin/bash
# everything in shell as considered as string
NUMBER1=100
NUMBER2=200
NAME=devops
SUM=$(($NUMBER1+$NUMBER2+$NAME))
echo "SUM is:${SUM}"