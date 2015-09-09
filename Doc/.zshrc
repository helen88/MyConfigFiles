# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

CONF_DIR=~/MyConfigFiles

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="random"
ZSH_THEME="palmtoy"

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
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github osx node npm nvm brew colored-man colorize command-not-found copydir copyfile cp dircycle)

source $ZSH/oh-my-zsh.sh

source $HOME/.nvm/nvm.sh # This loads NVM

export ZOOKEEPER_BIN=~/Downloads/Software/Programming/zookeeper-3.4.5/bin
export MONGODB_BIN=~/Downloads/Software/Programming/MongoDB/mongodb-osx-x86_64-2.6.1/bin

export GAM=~/Workspace/Projects/gam

# Customize to your needs...
export PATH=~/Library/Bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/redis-2.6.14/src:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$ZOOKEEPER_BIN:$MONGODB_BIN:$PATH
export PATH=$PATH:/Users/will/Android/android-sdk-macosx/platform-tools:/Users/will/Android/android-sdk-macosx/tools:/Users/will/Android/apache-ant-1.9.4/bin:/Users/will/Android/android-sdk-macosx/build-tools/20.0.0:/usr/local/apache-maven-3.2.5/bin

export MAVEN_OPTS="-Xms256m -Xmx512m"

export ANDROID_HOME=/Users/will/Android/android-sdk-macosx
#export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home

. $CONF_DIR/.bash_alias

# red: 31, green: 32, yellow: 33, blue: 34, purple: 35, cyan: 36
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;31;40'

fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

setopt HIST_IGNORE_ALL_DUPS

# npm
. <(npm completion)

