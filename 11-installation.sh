#!/bin/bash

# check the user has root access or not.
# if root access, proceed with script.
# otherwise throw the error.
# check already install or not if yes, inform user it is already installed.
# if not install it.
# check if it is success or not.

#sudo is root user

USER=$(id -u)  #you need to run script with sudo

