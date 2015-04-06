#!/bin/bash
# Parameters
## 1: name for new user
## 2: public ssh key of local machine (use ssh_keygen)

# Add public ssh key from local machine to droplet on digitalocean.com
# (do ssh-keygen if you don't have a public ssh key yet (likely in ~/.ssh/id_rsa.pub))
#echo "ssh'ing to root user of $1"
#ssh root@$1

# Environment setup
echo "Creating user $1..."
adduser $1
gpasswd -a $1 sudo

## SSH key setup
echo "Changing to user $1..."
su - $1
mkdir .ssh
chmod 700 .ssh
cd .ssh
echo $2 > authorized_keys
chmod 600 authorized_keys
exit #return to root user
## Other options for /etc/ssh/sshd_config:
### Change port number: Port 4444
### PermitRootLogin: no
echo "Restarting ssh to use new settings..."
service ssh restart


# Install stuff
echo "Installing stuff with user $1..."
su - $1

## Ruby
echo "Installing Ruby..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3
rvm rubygems current
sudo apt-get install nodejs #for javascript runtime environment
gem install bundle

## Oh-my-zsh
