# Shortcuts
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Documents/Projects"
alias h="history"
# VSCode
alias c="code ."
alias o="open"
alias .='cd .'
alias ..='cd ..'
alias be='bundle exec'
alias gs="cd $GRADESCOPE_HOME"

## GIT ##
alias git=hub
alias g="git"
alias gd="git diff"
alias gco="git checkout"
alias gc="git commit -am"
alias gcm="git commit"
alias gp="git push"
alias gl="git log"

# Use the hub command for githu
alias ditto="ditto -v"
alias cdd="cd ${PROJECTS_HOME}/dotfiles"
alias js="jekyll serve --watch & open http://0.0.0.0:4000"

# Useful for *Nix boxes, but not necessary
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -l -G"

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

# List only directories
alias lsd='ls -l ${colorflag} | grep "^d"'

# Always use color output for `ls`
alias ls="ls ${colorflag}"

# work when piping: ls | less
alias lsl="ls -FlaGh"

# List conflicting files
alias conflicts="git status --short | egrep '(U[A-Z])|([A-Z]U)'"

# Open up git conflicts in the editor.
alias cconflicts='code . $(conflicts | cut -d " " -f 2)'

# Create a new PR on github and then open it in Safari
alias new-pr='open $(hub pull-request)'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias cleanDS="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Start and stop apache server in >= 10.8
alias startserver="sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist"
alias stopserver="sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
# TODO: Make this a function with a usage string
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Start simple python http server in the current directory
alias server='python3 -m http.server'