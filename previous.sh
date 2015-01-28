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