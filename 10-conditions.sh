#!/bin/bash

# -gt - greater than
# -eq - equalent
# -ne - not equalent
# -lt - less than

NUMBER=$1

if [ $NUMBER -lt 10 ] ; then
    echo "given number $NUMBER is less than 10"
else
    echo "given number $NUMBER is equal to 10"
fi        