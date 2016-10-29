#!/usr/bin/env bash

DOTFILES_DIR=$(pwd)

echo "Setting your default settings for the system..."
defaults write com.apple.screensaver askForPassword 1

echo "Installing Xcode make tools..."
xcode-select --install

echo "Downloading homebrew and packages..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install git bash-completion trash tree nvm
brew cask install firefox google-chrome iterm2

echo "Downloading Docker for Mac..."
curl https://download.docker.com/mac/stable/Docker.dmg > $HOME/Downloads/Docker_for_Mac.dmg
hdiutil mount $HOME/Downloads/Docker_for_Mac.dmg
sudo cp -R /Volumes/Sublime\ Text/Sublime\ Text.app /Applications
hdiutil unmount /Volumes/Sublime\ Text/

echo "Downloading Sublime Text 3..."
curl https://download.sublimetext.com/Sublime%20Text%20Build%203126.dmg > $HOME/Downloads/Sublime_Text_3.dmg
hdiutil mount $HOME/Downloads/Sublime_Text_3.dmg
sudo cp -R /Volumes/Sublime\ Text/Sublime\ Text.app /Applications
hdiutil unmount /Volumes/Sublime\ Text/

echo "Symlinking Sublime Text Packages so Sublime Text can find them..."
ln -sF $DOTFILES_DIR/sublime_text_packages $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages

echo "Symlinking dotfiles to home directory..."
ln -s $DOTFILES_DIR/bash_profile $HOME/.bash_profile
ln -s $DOTFILES_DIR/bashrc $HOME/.bashrc
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/gemrc $HOME/.gemrc

if [ -f $DOTFILES_DIR/bash_local ]; then
  ln -s $DOTFILES_DIR/bash_local $HOME/.bash_local
fi

echo "Resetting the environment..."
. $HOME/.bashrc

echo "Installing the latest LTS version of node..."
nvm install --lts
nvm alias default $(node --version)

echo "Your computer is setup!"
