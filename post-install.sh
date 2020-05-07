#!/bin/bash

# get pwd from script args
PWD=$1

curl -sL https://deb.nodesource.com/setup_12.x > /dev/null

# Check if node is installed
which node > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Node is installed, skipping..."
else
    echo "Node is NOT installed, installing..."
    echo "$PWD" | sudo -S apt install nodejs -y
fi