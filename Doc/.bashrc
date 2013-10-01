source /home/will/Workspace/GitHub/MyConfigFiles/Doc/git-completion.bash
source /home/will/Workspace/GitHub/MyConfigFiles/Doc/.git-prompt.sh
source /home/will/Workspace/GitHub/MyConfigFiles/Doc/.color-ps1.sh
source /home/will/Workspace/GitHub/MyConfigFiles/Doc/.bash_aliases

export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
# Set Titlebar and Prompt
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export PS1="\[${BLUE}\]\u@mac:\[${YELLOW}\]\w\[${GREEN}\]\$(__git_ps1)\[${NORMAL}\]\$ "

# java ~
export JAVA_HOME=/home/will/Download/Software/Programming/jdk1.7.0_25
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib

# go ~
export GOROOT=/home/will/Download/Software/Programming/go
export GOPATH=/home/will/Download/Software/Programming/go/MyDir

export PATH=${JAVA_HOME}/bin:${GOROOT}/bin:${GOPATH}/bin:/home/will/node/bin:$PATH

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

