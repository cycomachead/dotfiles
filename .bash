
# work when piping: ls | less
alias lsl="ls -FlaG"

# some cd aliases
alias cd.='cd .'
alias cd..='cd ..'

# Defined Variables:
# =====================================
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
alias cdd="cd ~/Dropbox/"
alias cdc="cd ~/Dropbox/College/$curr"
alias jekylls="jekyll --config _config-dev.yml"
alias gc="git commit -am"
alias gcm="git commit"
alias gp="git push"
alias gs="git status"
alias push-post="~/Dropbox/Projects/Website/tools/push-post.sh"
alias apsync="~/Dropbox/Projects/ApertureSync/sync.sh"

# CLASSES
# CS10
alias cd10="cd ~/Dropbox/College/Sp13/CS10"
alias ssh10="ssh $cs10"
alias cs10="open -a Safari http://inst.eecs.berkeley.edu/~cs10/"
alias scp10="scp -r ../ $cs10"
alias pull10="scp -r $cs10:~/* ~/Documents/CS10/"
# CS61C
alias cd61="cd ~/Dropbox/College/Sp13/CS61C/61c"
alias ssh61="ssh cs61c-mx@hive16.cs.berkeley.edu"
alias 61c="open -a Safari http://inst.eecs.berkeley.edu/~cs61c/"
alias scp70="scp -r ../ cs61c-mx@nova.cs.berkeley.edu"
alias matel="mate ~/Dropbox/College/Sp13/CS61C/61c/labs/*"
alias mateh="mate ~/Dropbox/College/Sp13/CS61C/61c/homework/*"
# CS70
alias cd70="cd ~/Dropbox/College/Sp13/CS70"
alias ssh70="ssh cs70-ha@torus.cs.berkeley.edu"
alias cs70="open -a Safari http://inst.eecs.berkeley.edu/~cs70/"
alias scp70="scp -r * cs70-ha@nova.cs.berkeley.edu:~/homework/"
function push-70 {
    temp=$PWD
    cdcol
    cd Sp13/CS70/homework/
    rsync -ahvz --exclude="problems" ./ ${cs70}:~/homework/
    cd "$temp"
    unset temp
}

# OLD 61B ================================
# alias hw="~/Dropbox/College/Fa12/CS61B/support/hw"
# A specific mate command modified for each class project.
# alias mate..="make clean; mate . loa/*.java"
# alias hwc="make clean; hw commit"
# alias hws="make clean; hw submit"

# CS194
# Master account.
cs194="cs194-23@torus.cs.berkeley.edu"
alias cs194="open -a Safari http://inst.eecs.berkeley.edu/~cs194-23/"
alias cd194="cd ~/Dropbox/College/Sp13/CS194-23"
alias ssh194="ssh $cs194"
function push_194 {
    temp=$PWD
    cdcol
    cd Sp13/CS194-23/cs194-site/
        rsync -avz $1/ ${cs194}:~/public_html/$1/
    cd "$temp"
    unset temp
}
# Update this for each semester.
alias push-194="push_194 sp13"

# EXPORTS:
# =================================
export RMATE_HOST=auto
export RMATE_PORT=12345
# this needs to be fixed for editing crontabs:
export EDITOR="/usr/local/bin/mate -w"
# For CS61B, probably doesn't work well anymore.
# export CLASSPATH=/lib/junit.jar:/lib/ucb.jar:
export TM_SUPPORT_PATH='/Applications/TextMate.app/Contents/SharedSupport/Support'

# Temporary Fix for the above...
function cront
{
    unset EDITOR
    sudo crontab -e
    export EDITOR="/usr/local/bin/mate -w"
}