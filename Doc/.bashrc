MY_DIR=/home/will/Workspace/GitHub/MyConfigFiles/Doc 

. $MY_DIR/git-completion.bash
. $MY_DIR/.git-prompt.sh
. $MY_DIR/.color-ps1.sh
. $MY_DIR/.bash_aliases

# Set Titlebar and Prompt
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export PS1="\[${BLUE}\]\u@ubuntu:\[${YELLOW}\]\w\[${GREEN}\]\$(__git_ps1)\[${NORMAL}\]\$ "

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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

