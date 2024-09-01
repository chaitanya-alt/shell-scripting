#!/bin/bash

echo "All variables passed to script :$@" #It will print what ever you gave as arguments
echo "Number variable passed to scrippt : $#"
echo "Script name is:$0"
echo "current directory :$PWD"
echo "home directory of current user is :$HOME"
echo "PID of the current running script:$$"