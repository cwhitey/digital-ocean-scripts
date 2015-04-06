#!/bin/bash

## Ruby
echo "Installing Ruby..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3
rvm rubygems current
sudo apt-get install nodejs #for javascript runtime environment
gem install bundle

## Oh-my-zsh
echo "Installing oh-my-zsh"
apt-get install zsh
git clone https://github.com/cwhitey/dotfiles.git
cp dotfiles/.zshrc ~
cp dotfiles/antigen.sh ~
chsh /usr/bin/zsh
