# some more ls aliases
alias reloadbr="cd /home/will/Workspace/GitHub/MyConfigFiles/Doc && source ./.bashrc && cd -"
alias l='ls -CF'
alias ll='ls -la --color=auto'
alias ls='ls --color=auto --show-control-chars'
alias lm='ll | less' 
alias df='df -h'
alias du='du -h --max-depth=1'
alias cp='cp -iR'

alias cd-='cd -'
alias cd..='cd ..'
alias cd...='cd ../../'
alias cd....="cd ../../.."
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -p'
alias rd='rm -rf'
alias ztar='tar -zvcf'
alias uztar='tar -zvxf'
alias man='man -a'
alias vi='vim'
alias gs='git status'
alias gc='git checkout'
alias gd='git diff'
alias gp='git push'
alias gcmt='git commit -am'
alias gb='git branch'
alias grep='grep --color=auto'
alias pgr='ps aux | grep'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

