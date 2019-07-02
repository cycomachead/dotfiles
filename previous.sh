# This file is a list of aliases used my classes at berkeley each semester
# It contains shortcuts for often used commands for moving files and homework
# Defined Variables:
# ==============================================================================
ser="cs.berkeley.edu"
ph="public_html"
git="git@github.com"
sync="rsync -ahPvz --itemize-changes --progress --delete --exclude=\"lec\""

# Previous Semester Settings and alaises to be used for reference
# ==================
# Fall 2014
# CS170
cs170="cs170-iu@cory.$ser"
alias ssh170="ssh $cs170"
alias cd170="cd $cls/$cur/cs170"


# CS194-26
cs194="cs194-ft@hive8.$ser"
alias ssh194="ssh -X $tmtunnel $cs194"
# ==================
# Spring 2014
# CS10 (No longer need these)
master10="~/Documents/CS10/" # Master account Cloned Folder
alias push10="$sync $master10 $cs10"
alias pull10="$sync $cs10:~/public_html/* $master10/public_html"
alias pushimg="$sync ${master10}/public_html/images/* $cs10:~/public_html/images"
alias pullimg="$sync $cs10:~/public_html/images/* $master10/public_html/images"
alias pullr="$sync $cs10:~$ssite ${master10}$ssite"
alias pushr="$sync ${master10}$ssite/ $cs10:~$ssite"
alias pusht="$sync ${master10}$ssite/ $cs10t:~$ssite"

# CS 184
cs184="cs184-cl@cory.$ser" # cs184 Master Account
alias cd184="cd $cls/$cur/cs184"
alias as4="cd $cls/$cur/cs184/repo/as4"
alias ssh184="ssh $cs184"
alias cs184="${classsite}/~cs184/$cur/"
function 184s
{
    cd184;
    cd site
    jekyll build;
    $sync ../out/* $cs184:~/public_html/
    ssh184 "chmod -R 755 ~/public_html/"
}

# INFO 290
alias cd290="cd $cls/$cur/info290"
# Fall 2013
# EE122 Fa13
ee122="ee122-ai"
alias cd122="cd ~/Dropbox/College/$cur/ee122"
alias ee122="${classsite}/~ee122/$cur"
alias ssh122="ssh $ee122@torus.$ser"
alias scp122="scp -r . $ee122@cory.$ser:~/"
# Section for proj3 VM stuff
function vm() {
    cd122;
    cd proj/proj3;
    open ../proj3bspec.pdf;
    nohup virtualbox --startvm ee122p3 &
    osascript -e "tell application \"Terminal\"" -e "activate" -e " end tell";
}
alias sshvm="ssh ee122@172.16.122.2"
alias gp122="g push vm master:mac-master"

# EE42 Fa13
alias cd42="cd ~/Dropbox/College/$cur/ee42"
alias ee42="$classsite~ee42/$cur"

# =========================================================================== #
# Spring 2013
cs61c="cs61c-mx@torus.$ser"
cs70="cs70-ha@torus.$ser"
cs194="cs194-23@torus.$ser" # CS194-23 Master account.
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
alias push-194="push_194 sp13"


# =========================================================================== #
# Fall 2012
# CS61B
alias hw="~/Dropbox/College/Fa12/CS61B/support/hw"
# A specific mate command modified for each class project.
alias mate..="make clean; mate . loa/*.java"
alias hwc="make clean; hw commit"
alias hws="make clean; hw submit"

# For CS61B, probably doesn't work well anymore.
export CLASSPATH=/lib/junit.jar:/lib/ucb.jar:

classsite="open -a Safari http://inst.eecs.berkeley.edu" #all EECS sites
cls="~/Dropbox/College"
cur="sp16"
# ssite="/$ph/$cur/"
snaploc="$proj/CS10/snap/snap.html"

alias apsync="~/Dropbox/Projects/ApertureSync/sync.sh"
# Command to update bjc labs for a personal webserver for testing at
# localhost/bjc-r/ [Necessary since I can't modify httpd.conf correctly]
# alias bjc="sudo rsync -avz --delete --exclude=".git" --exclude="README.md" --exclude=".nojekyll" ../bjc-r /Library/WebServer/Documents/"
alias snap="open $snaploc"
alias sshbjc="ssh $tmtunnel michael@abbenay.$ser"

alias stk="stk-simply"
alias cdc="cd $cls/$cur/"
alias push-post="~/Dropbox/Projects/Website/tools/push-post.sh"

# CLASSES
# ==============================================================================
# CS10 fa14 (updated)
cs10="cs10@cory.$ser" # CS10 Master Account
cs10t="cs10-ta@cory.$ser"
alias ssh10="ssh $cs10"
alias cs10="$classsite/~cs10/$cur/"

# CS186
export cs186="cs186-anv@hive16.$ser" #ARGH
JUPYTERPORT=16360
export fwd186="-L ${JUPYTERPORT}:localhost:${JUPYTERPORT}"
alias ssh186="ssh $fwd186 $tmtunnel $cs186"

# Info 290T
# alias cd290="cd $cls/$cur/info290"
# alias ssh290="ssh $tmtunnel info290t@dlab-matlab.berkeley.edu"

# CS169
# alias cd169="cd $cls/$cur/cs169"
