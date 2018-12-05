#!/usr/bin/env bash

# git autocomplete/ svn
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# powerline
PATH=$PATH:/Users/kaihan.chang/Library/Python/3.7/bin
. /Users/kaihan.chang/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

# git alias
alias gst="git status"
alias gcmm="git commit -m"
alias gcma="git commit --amend"

# svn alias 
alias slg="svn log -l"
alias sst="svn status"
# use phpstorm as diff toll 
alias sdifftool="svn diff --diff-cmd ~/svn-diffwrap.sh"


# List all new files. e.g sls ? 
# Add all new files. e.g sls ? svn add  
function sls(){
    cmd="svn status";
    
    if [[ -n $1 ]]; then
       cmd="$cmd | grep '^$1' ";
    fi
    
    # svn st | grep '^?' | sed 's/^[? ]*/"/' | sed 's/$/"/' | xargs
    
    if [[ -n $2 ]]; then
       cmd="$cmd | awk '{print \$2}' | xargs $2 $3";
    fi
    
    echo $cmd;
    eval $cmd;
}

# docker alias
alias dockerrmiall="docker rmi -f $(docker images -q)"
alias dockerrmall="docker rm -Vf $(docker ps -a -q)"

# work alias
alias listdir="ls -d */"
alias listfile="ls -ap | grep -v /"

# type something (optional), then press up/down arrow key to search through history for commands that begin with what you typed.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

