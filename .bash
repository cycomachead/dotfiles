# Defined Variables:
# =====================================
sync="rsync -avz --delete"
ser="cs.berkeley.edu"
cs10="cs10@cory.$ser" # CS10 Master Account
cs10t="cs10-th@cory.$ser"
cs61c="cs61c-mx@torus.$ser"
cs70="cs70-ha@torus.$ser"
cs194="cs194-23@torus.$ser" # CS194-23 Master account.

proj="~/Dropbox/Projects"
dotf="${proj}/dotfiles/"
cur="Fa13"

# ALIASES:
# ====================================
alias stk="stk-simply"
alias ditto="ditto -v"
alias makw="make" #fix for common typos
alias matw="mate"
alias cddot="cd ${dotf}"
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
# =======
# CS10 Fa13 (updated)
10master="~/Documents/CS10/"
alias cd10="cd ~/Dropbox/College/$cur/CS10"
alias ssh10="ssh $cs10"
alias cs10="open -a Safari http://inst.eecs.berkeley.edu/~cs10/$cur"
alias push10="$sync ${10master} $cs10"
alias pull10="$sync $cs10:~/* ${10master}"
alias pushsite="$sync ${10master}/public_html/* $cs10/public_html/"
alias pullsite="$sync $cs10:~/pulic_html/* ${10master}/public_html/"

# EE 122 Fa13
# EE 42 Fa13

# EXPORTS:
# =================================
export RMATE_HOST=auto
export RMATE_PORT=12345
# this needs to be fixed for editing crontabs:
export EDITOR="/usr/local/bin/mate -w"
export TM_SUPPORT_PATH='/Applications/TextMate.app/Contents/SharedSupport/Support'

# Temporary Fix for the above...
# Use cront to edit crontabs.
function cront
{
    unset EDITOR
    sudo crontab -e
    export EDITOR="/usr/local/bin/mate -w"
}