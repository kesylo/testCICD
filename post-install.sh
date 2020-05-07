#!/bin/bash

PWD=$1

curl -sL https://deb.nodesource.com/setup_12.x > /dev/null

echo "$PWD" | sudo -S apt install nodejs -y

if node -v > /dev/null
  then
    echo " 111 node is installed, skipping..."
  else
    echo " 111 node is installed, skipping..."
fi

if which node > /dev/null
  then
    echo "222 node is installed, skipping..."
  else
    echo "222 node is installed, skipping..."
fi