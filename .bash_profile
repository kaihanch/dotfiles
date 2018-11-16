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
alias sst="svn status"

# List all new files. e.g sls ?  
# Add all new files. e.g sls ? svn add  
function sls(){
   if [[ -n $2 ]]; then
       svn status | grep "^$1" | awk '{print $2}' | xargs $2 $3;
   else
       svn status | grep "^$1" | awk '{print $2}';    
   fi
}

# svn log display only kaihan e.g slg 10 kaihan
function slg(){
   username=$2
   if [[ -n $2 ]]; then
       #display a specific user's commits in svn log
       svn log -l $1 | sed -n "/${username}/,/-----$/p"; 
   else
       svn log -l $1;    
   fi
}

# docker alias
alias dockerrmiall="docker rmi -f $(docker images -q)"
alias dockerrmall="docker rm -Vf $(docker ps -a -q)"
