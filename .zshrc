# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
TERM="xterm-256color"
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false

# Useful aliases
alias b="bundle exec"
alias bil="bundle install"
alias brake="bundle exec rake"
alias gs="git status"
alias emacs="TERM=xterm emacs"

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
plugins=(git rails ruby tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$PATH
# Setup Android SDK
android_sdk_path=~/code/libraries_and_sdks/android-sdk-macosx
export PATH=$PATH:$android_sdk_path/tools:$android_sdk_path/platform-tools

# Setup RbEnv
eval "$(rbenv init -)"

# Setup Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
export GROOVY_HOME=/usr/local/opt/groovy/libexec
