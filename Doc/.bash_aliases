# some more ls aliases
alias reloadzsh="cd /home/will/Workspace/GitHub/MyConfigFiles/Doc && source ./.zshrc && cd -"
alias l='ls -CF'
alias ll='ls -la --color=auto'
alias ls='ls --color=auto --show-control-chars'
alias lm='ll | less' 
alias df='df -h'
alias du='du -h --max-depth=1'
alias cp='cp -iR'

alias cdg="cd ~/GitHub/lordofpomelo/game-server"
alias cdw="cd ~/GitHub/lordofpomelo/web-server"
alias cdp="cd ~/GitHub/pomelo"

alias cd-='cd -'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -p'
alias rd='rm -rf'
alias ztar='tar -zvcf'
alias uztar='tar -zvxf'
alias ttar='tar -tvf'
alias man='man -a'
alias vi='vim'
alias pgr='ps aux | grep'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

