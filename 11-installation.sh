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
    exit 4
fi

dnf list install git

if [ $? -ne 0 ]
then
    echo "git is not install, we are going to instal it"
    dnf install git -y
else 
    echo "git is already installed, nothing to do"
fi




