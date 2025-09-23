#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:please run this script with root privilage"
    exit 1 # failure is othher than 0
fi     
# functions receives inputs through args like shell script args.
VALIDATE () { 
    if [ $1 -ne 0 ] ; then
        echo "ERROR: installing $2 is failure"
        exit 1
    else
        echo "installing $2 is success"
    fi
}

dnf install mysql -y
validate $? "mysql"
