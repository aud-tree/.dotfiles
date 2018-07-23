# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOQUIT=false
setopt BRACE_CCL
setopt GLOB

# Make tmux recognize 256 colors
alias tmux="tmux -2"

# Useful aliases
alias b="bundle exec"
alias bil="bundle install"
alias biloc="bundle install --binstubs .bundle/bin --path .bundle"
alias brake="bundle exec rake"
alias brails="bundle exec rails"
alias gs="git status"
alias gdc="git diff --cached"
alias gpr="git pull --rebase"
alias tignm="tig --no-merges"

# Docker aliases
alias dc="docker-compose"
alias di="eval \$(docker-machine env dev)"
alias dm="docker-machine"
alias dclean="docker ps -a | grep _run_ | awk '{print \$1}' | xargs docker rm"
alias dps="docker ps"
alias dpsa="docker ps -a"

# Remote pairing aliases
alias rps="sudo rm -rf /tmp/pairing*; tmux -S /tmp/pairing new -s pairing"
alias remote_pairing_start_session="rps"
alias rpss="chgrp pairing /tmp/pairing"
alias remote_pairing_share_socket="rpss"
alias rpc="tmux -S /tmp/pairing a -t pairing"
alias remote_pairing_connect="rpc"

alias fix_oh_my_zsh="sudo chown $USER $ZSH/.git/logs/refs/remotes/origin/master"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby zsh-nvm)

source $ZSH/oh-my-zsh.sh

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Setup RbEnv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Setup Golang
export GOPATH="$HOME/code/go"
export PATH="$PATH:/usr/local/go/bin:${GOPATH//://bin:}/bin"

# Autojump
# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Homebrew needs this since it can't symlink over the system openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

