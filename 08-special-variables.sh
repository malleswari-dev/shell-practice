#!/bin/bash

echo "all variables passed to the script: $@"
echo "all variables passed to the script: $*"
echo "script name:$0"
echo "first argument:$1"
echo "current directory:$PWD"
echo "who is running this:$USER"
echo "home directory of user:$HOME"
echo "PID of the script:$$"
sleep 50 &
echo "pid of the lost command in background is :$!"