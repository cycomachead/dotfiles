# This file is a list of aliases used my classes at berkeley each semester
# It contains shortcuts for often used commands for moving files and homework
# Defined Variables:
# ==============================================================================
classsite="open -a Safari http://inst.eecs.berkeley.edu" #all EECS sites
ser="cs.berkeley.edu"
ph="public_html"
git="git@github.com"
sync="rsync -ahPvz --itemize-changes --progress --delete --exclude=\"lec\""


proj="~/Dropbox/Projects"
dotf="${proj}/dotfiles/"
cls="~/Dropbox/College"
cur="sp14"
ssite="/$ph/$cur/"

# ALIASES:
# ==============================================================================
alias stk="stk-simply"
alias ditto="ditto -v"
alias makw="make" #fix for common typos
alias matw="mate"
alias cdd="cd ${dotf}"
alias mate.="mate . * */*"
alias cdc="cd $cls/$curr"
alias js="jekyll serve --watch & open http://0.0.0.0:4000"
alias gc="git commit -am"
alias gcm="git commit"
alias gp="git push"
alias gpo="git push origin" #push to main remote but specify brnach
alias gs="git status"
alias gl="git log"
alias push-post="~/Dropbox/Projects/Website/tools/push-post.sh"
alias apsync="~/Dropbox/Projects/ApertureSync/sync.sh"
# Command to update bjc labs for a personal webserver for testing at
# localhost/bjc-r/ [Necessary since I can't modify httpd.conf correctly]
alias bjc="sudo rsync -avz --delete --exclude=".git" --exclude="README.md" --exclude=".nojekyll" ../bjc-r /Library/WebServer/Documents/"

# CLASSES
# ==============================================================================
# CS10 Sp14 (updated)
master10="~/Documents/CS10/" # Master account Cloned Folder
cs10="cs10@cory.$ser" # CS10 Master Account
cs10t="cs10-ta@cory.$ser"
alias cd10="cd $cls/$cur/cs10"
alias ssh10="ssh $cs10"
alias cs10="${classsite}/~cs10/$cur/"
alias push10="$sync ${master10} $cs10"
alias pull10="$sync $cs10:~/* ${master10}"
alias pushsite="scp -r ${master10}$ssite/ $cs10:~$ssite"
alias pullsite="scp -r $cs10:~$ssite ${master10}$ssite"
alias pullr="$sync $cs10:~$ssite ${master10}$ssite"
alias pushr="$sync ${master10}$ssite/ $cs10:~$ssite"
alias pusht="$sync ${master10}$ssite/ $cs10t:~$ssite"

# CS 184
cs184="cs184-XX@cory.$ser" # cs184 Master Account
alias cd18="cd /$cur/cs184"
alias ssh184="ssh $cs184"
alias cs184="${classsite}/~cs10/$cur/"

# INFO 290
alias cd290="cd $cls/$cur/info290-ml"

# EXPORTS:
# ==============================================================================
# export RMATE_HOST=auto
# export RMATE_PORT=12345
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