# This file is a list of aliases used my classes at berkeley each semester
# It contains shortcuts for often used commands for moving files and homework
# Defined Variables:
# ==============================================================================
sync="rsync -avz --delete"
classsite="open -a Safari http://inst.eecs.berkeley.edu/" #all EECS sites
ser="cs.berkeley.edu"
master10="~/Documents/CS10/" # Master account Cloned Folder
cs10="cs10@cory.$ser" # CS10 Master Account
cs10t="cs10-th@cory.$ser"

proj="~/Dropbox/Projects"
dotf="${proj}/dotfiles/"
cur="Fa13"

# ALIASES:
# ==============================================================================
alias stk="stk-simply"
alias ditto="ditto -v"
alias makw="make" #fix for common typos
alias matw="mate"
alias cdd="cd ${dotf}"
alias mate.="mate . * */*"
alias cdc="cd ~/Dropbox/College/$curr"
alias jekylls="jekyll serve --watch"
alias gc="git commit -am"
alias gcm="git commit"
alias gp="git push"
alias gs="git status"
alias push-post="~/Dropbox/Projects/Website/tools/push-post.sh"
alias apsync="~/Dropbox/Projects/ApertureSync/sync.sh"

# CLASSES
# ==============================================================================
# CS10 Fa13 (updated)
alias cd10="cd ~/Dropbox/College/$cur/CS10"
alias ssh10="ssh $cs10"
alias cs10="$classite~cs10/$cur"
alias push10="$sync ${master10} $cs10"
alias pull10="$sync $cs10:~/* ${master10}"
alias pushsite="scp -r ${master10}/public_html/* $cs10/public_html/"
alias pullsite="scp - $cs10:~/pulic_html/* ${master10}/public_html/"

# EE122 Fa13
alias cd122="cd ~/Dropbox/College/$cur/ee122"
alias ee122="$classite~ee122/$cur"
# EE42 Fa13
alias cd122="cd ~/Dropbox/College/$cur/ee42"
alias ee122="$classite~ee42/$cur"

# EXPORTS:
# ==============================================================================
export RMATE_HOST=auto
export RMATE_PORT=12345
# this needs to be fixed for editing crontabs:
export EDITOR="/usr/local/bin/mate -w"
export TM_SUPPORT_PATH='/Applications/TextMate.app/Contents/SharedSupport/Support'

# Temporary Fix for the mate editing crontabs
# Use cront to edit crontabs.
function cront
{
    unset EDITOR
    sudo crontab -e
    export EDITOR="/usr/local/bin/mate -w"
}