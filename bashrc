# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Set colors for ls
export LSCOLORS=HeExBxDxcxegedabagacad

# Set language
export LANG="en_US.UTF-8"

# Functions and aliases
alias c="clear"
alias ..="cd .."
alias ll="ls -GFalh"
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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Load bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Load rbenv
if [ -e "/usr/local/bin/rbenv" ] ; then
  eval "$(rbenv init -)"
fi

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

# Customize prompt
# export PS1='\u:\W$(__docker_machine_ps1 " [%s]") $>'
export PS1='\W $>'
