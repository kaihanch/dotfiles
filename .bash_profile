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
alias slg="svn log -l 20"

# Print the status . e.g sst 
# List all new files. e.g sst ?  
# Add all new files. e.g sst ? svn add  
function sst(){
    cmd="svn status";
    
    if [[ -n $1 ]]; then
       cmd="$cmd | grep ^$1 ";
    fi
    
    if [[ -n $2 ]]; then
       cmd="$cmd | awk '{print \$2}' | xargs $2 $3";
    fi
    
    eval $cmd
}


# docker alias
alias dockerrmiall="docker rmi -f $(docker images -q)"
alias dockerrmall="docker rm -Vf $(docker ps -a -q)"
