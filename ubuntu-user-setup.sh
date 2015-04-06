#!/bin/bash

# Parameters
## 1: name for new user
## 2: public ssh key of local machine (use ssh_keygen)

# Environment setup
echo "Creating user $1..."
adduser $1
gpasswd -a $1 sudo

## SSH key setup
echo "Changing to user $1..."
sudo -u $1 $(./ssh-dir-setup.sh $2)
