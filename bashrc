# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Functions and aliases
alias c="clear"
alias ll="ls -la"

function dmoff() {
  if [ "$1" = "start" ]; then
    docker-machine start office
    eval $(docker-machine env --no-proxy office)
  elif [ "$1" = "stop" ]; then
    docker-machine stop office
  else
    echo "You have to enter start or stop, jackass!"
  fi
}

function take() {
  mkdir $1
  cd $1
}

# Configure proxy when at work
function proxy() {
  if [ -z "$http_proxy" ]; then
    SERVER=localhost
    PORT=3128
    export http_proxy="http://$SERVER:$PORT/"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export HTTP_PROXY=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export FTP_PROXY=$http_proxy
    export RSYNC_PROXY=$http_proxy
    echo -e "Proxy environment variables set."
  else
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset RSYNC_PROXY
    echo -e "Proxy environment variables removed."
  fi
}

# Load nvm
export NVM_DIR="/Users/kon8883/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Configure Docker bash completion
export DOCKER_COMPLETION_SHOW_NETWORK_IDS="no"
export DOCKER_COMPLETION_SHOW_IMAGE_IDS="no"
export DOCKER_COMPLETION_SHOW_TAGS="yes"
