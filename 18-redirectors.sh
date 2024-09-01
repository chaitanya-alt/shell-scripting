#!/bin/bash

LOGS_FOLDER=$(/var/logs/shell-scripts)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)  # this is used to the script name actual script name is 8-redirectors.sh
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)  #you need to run script with sudo
R="\e[31m"       #we are decaring colors in function.
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo "$R Please run the script with root previliges$N"  &>> $LOGS_FILE
    exit 1
    fi
}

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 is $R FAILED..$N" &>> $LOGS_FILE
        exit 1

    else
        echo -e "$2 is $G SUCCESS..$N" &>> $LOGS_FILE
    fi
}

CHECK_ROOT