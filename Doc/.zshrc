# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

CONF_DIR=~/MyConfigFiles

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="random"
ZSH_THEME="palmtoy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
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
plugins=(git github node npm archlinux colored-man colorize command-not-found copydir copyfile cp debian terminitor)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/will/Download/Software/Programming/jdk1.7.0_25/bin:/home/will/go/bin:/home/will/Download/Software/Programming/redis-2.6.16/src:/home/will/Workspace/GitHub/MyConfigFiles/Bin:/home/will/node/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

. $CONF_DIR/.bash_aliases

# red: 31, green: 32, yellow: 33, blue: 34, purple: 35, cyan: 36
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;31;40'

