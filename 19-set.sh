#!/bin/bash

set -e
trap error ERR

trap 'echo "there is an error in $LINEON,command is : $BASH_COMMAND"' ERR

echo "hello"
echo "before error"
cfcfcdf;dnf..
echo "after error"