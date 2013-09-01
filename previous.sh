# Previous Semester Settings and alaises to be used for reference

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

# For CS61B, probably doesn't work well anymore.
export CLASSPATH=/lib/junit.jar:/lib/ucb.jar: