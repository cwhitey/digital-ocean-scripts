#!/bin/bash

## Ruby
echo "Installing Ruby..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3
source /usr/local/rvm/scripts/rvm
rvm rubygems current
sudo apt-get install nodejs #for javascript runtime environment
gem install bundle

## Oh-my-zsh
echo "Installing oh-my-zsh"
apt-get install zsh
git clone https://github.com/cwhitey/dotfiles.git
cp dotfiles/.zshrc ~
cp dotfiles/antigen.zsh ~
chsh -s $(which zsh)
echo "Run `zsh` or open a new terminal to start using oh-my-zsh!"


echo "Removing 'dotfiles' repo..."
rm -rf dotfiles
