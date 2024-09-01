#!/bin/bash

# Check if MySQL is installed
rpm -q mysql
if [ $? -ne 0 ]; then
    echo "MySQL is not installed, we are going to install it..."
    dnf install mysql -y
    if [ $? -ne 0 ]; then
        echo "The MySQL installation has failed, please check it."
        exit 1
    else
        echo "The MySQL installation is successful."
    fi
else
    echo "MySQL is already installed, nothing to do..."
fi