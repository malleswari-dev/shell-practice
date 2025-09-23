#!/bin/bash

echo "all variables passed to the script: $@"
echo "all variables passed to the script: $*"
echo "script name:$0"
echo "first argument:$1"
echo "current directory:$pwd"
echo "who is running this:$user"
echo "home directory of user:$home"
echo "PID of the script:$$"
