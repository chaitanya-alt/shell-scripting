#!/bin/bash

# check the user has root access or not.
# if root access, proceed with script.
# otherwise throw the error.
# check already install or not if yes, inform user it is already installed.
# if not install it.
# check if it is success or not.

#sudo is root user

USER=$(id -u)  #you need to run script with sudo

echo "user id is:$USER"

if [ $USER -ne 0 ]
then
    echo "Please run the script with root previliges"
    exit 1
fi

dnf list install gittt

if [ $? -ne 0 ]
then
    echo "git is not install, we are going to instal it"
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "git installation is failed, please check it"
        exit 1
    else
        echo "git installation is succefull"
    fi
else 
    echo "git is already installed, nothing to do"
fi





