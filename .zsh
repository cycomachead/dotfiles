# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=100000000

# Display timestamps on history log views
export HISTTIMEFORMAT="%F %T "

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Alias to make ls print color escape codes always, thus it will
# work when piping: ls | less
alias lsc="ls --color=always"
alias lsl="lsc -FlaG"
alias grepc="grep --color=always"
alias lessc="less -R"

# some cd aliases
alias cd.='cd .'
alias cd..='cd ..'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias to list directories quickly, and highlight their path names
alias lsd='ls -alF | grep -e ^d -e [^[:space:]]*\/$'


# Function to format and display man files
function manless
{
    if [ -e "$1" ] ; then
        groff -Tascii -man $1 | less -I
    else
        echo "File '$1' does not exist."
    fi
}

# Add the md5locate command
# Retruns md5 checksums of all files with the same name visible to the locate command
function md5locate
{
    locate $1 | xargs -I{} md5sum {}
}


# Somewhat broken...
function repeat
{
    for i in {1..$1}
    do
        `$2`
    done
}

# Defined Variables:
# =====================================
ser="cs.berkeley.edu"
cs10="cs10-tb@torus.cs.berkeley.edu"
cs61c="cs61c-mx@torus.cs.berkeley.edu"
cs70="cs70-ha@torus.$ser"
# CS194-23 Master account.
cs194="cs194-23@torus.cs.berkeley.edu"

# ALIASES:
# ====================================
alias stk="stk-simply"
alias ditto="ditto -v"
alias makw="make"
alias cdproj="cd ~/Dropbox/Projects"
alias cdcol="cd ~/Dropbox/College/"
alias mate.="mate . * */*"
alias cdd="cd ~/Dropbox/"
alias cdc="cd ~/Dropbox/College/"
alias jekylls="jekyll --server --auto --url http://0.0.0.0:4000"
alias gca="git commit -a"
alias gp="git push"
alias gpull="git pull"
alias push-post="~/Dropbox/Projects/Website/tools/push-post.sh"
alias apsync="~/Dropbox/Projects/ApertureSync/sync.sh"

# CLASSES
# CS10
alias cd10="cd ~/Dropbox/College/Sp13/CS10"
alias ssh10="ssh cs10-th@torus.cs.berkeley.edu"
alias cs10="open -a Safari http://inst.eecs.berkeley.edu/~cs10/"
alias scp10="scp -r ../ cs10-tb@nova.cs.berkeley.edu"
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