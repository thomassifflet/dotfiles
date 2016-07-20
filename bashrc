# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Set colors for ls
export LSCOLORS=ExFxBxDxCxegedabagacad

# Set language
export LANG="en_US.UTF-8"

# Functions and aliases
alias c="clear"
alias ll="ls -GFalh"
alias dm="docker-machine"
alias dc="docker-compose"

function take() {
  mkdir $1
  cd $1
}

# Load computer specific setup
if [ -f $HOME/.bash_local ]; then
  . $HOME/.bash_local
fi

# Load nvm
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# Load bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Load rbenv
if [ -e "/usr/local/bin/rbenv" ] ; then
  eval "$(rbenv init -)"
fi

# Configure Docker bash completion
export DOCKER_COMPLETION_SHOW_NETWORK_IDS="no"
export DOCKER_COMPLETION_SHOW_IMAGE_IDS="no"
export DOCKER_COMPLETION_SHOW_TAGS="yes"

# Customize prompt
# export PS1='\u:\W$(__docker_machine_ps1 " [%s]") $>'
export PS1='\u:\W $>'
