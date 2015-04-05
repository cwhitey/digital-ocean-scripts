#!/bin/bash
# Parameters
## 1: ip address of droplet
## 2: name for new user
## 3: public ssh key of local machine (use ssh_keygen)


ssh root@$1

# Environment setup
echo "Creating user $2..."
adduser $2
gpasswd -a $2 sudo

## SSH key setup
echo "Changing to user $2..."
su - $2
mkdir .ssh
chmod 700 .ssh
cd .ssh
echo $3 > authorized_keys
chmod 600 authorized_keys
exit #return to root user
## Other options for /etc/ssh/sshd_config:
### Change port number: Port 4444
### PermitRootLogin: no
echo "Restarting ssh to use new settings..."
service ssh restart


# Install stuff
echo "Installing stuff with user $2..."
su - $2

## Ruby
echo "Installing Ruby..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3
rvm rubygems current
sudo apt-get install nodejs #for javascript runtime environment
gem install bundle
