#!/usr/bin/env bash

DOTFILES_DIR=$(pwd)

echo "Setting your default settings for the system..."

echo "Installing Xcode make tools..."
xcode-select --install

echo "Symlinking dotfiles to home directory..."
ln -s $DOTFILES_DIR/bash_profile $HOME/.bash_profile
ln -s $DOTFILES_DIR/bashrc $HOME/.bashrc
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/gemrc $HOME/.gemrc

if [ -f $DOTFILES_DIR/bash_local ]; then
  ln -s $DOTFILES_DIR/bash_local $HOME/.bash_local
fi

echo "Downloading homebrew and packages..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install git bash-completion trash tree
brew cask install firefox google-chrome iterm2 sublime-text

echo “Downloading nvm…”
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

echo "Installing liquidprompt"
git clone https://github.com/nojhan/liquidprompt.git $HOME/liquidprompt
source $HOME/liquidprompt/liquidprompt

echo "Symlinking Sublime Text Packages so Sublime Text can find them..."
mkdir -p $HOME/Library/Application\ Support/Sublime\ Text\ 3
ln -sF $DOTFILES_DIR/sublime_text_packages $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages
mkdir -p $HOME/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages
ln -sF $DOTFILES_DIR/Package\ Control.sublime-package $HOME/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

echo "Downloading Docker for Mac..."
curl https://download.docker.com/mac/stable/Docker.dmg > $HOME/Downloads/Docker_for_Mac.dmg
hdiutil mount $HOME/Downloads/Docker_for_Mac.dmg
sudo cp -R /Volumes/Docker/Docker.app /Applications
hdiutil unmount /Volumes/Docker

echo "Resetting the environment..."
. $HOME/.bashrc

echo "Installing the latest LTS version of node..."
nvm install --lts
nvm alias default $(node --version)

echo "Your computer is setup!"
