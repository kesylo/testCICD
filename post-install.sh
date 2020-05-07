#!/bin/bash

# Update pc
echo "$PWD" | sudo -S apt-get update -y

# get pwd from script args
PWD=$1

echo "$PWD" | curl -sL https://deb.nodesource.com/setup_12.x | sudo -E -S bash -
echo "$PWD" | sudo -S apt-get update -y

# Check if node is installed
which node > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Node is installed, skipping..."
else
    echo "Node is NOT installed, installing..."
    echo "$PWD" | sudo -S apt-get install nodejs -y
fi