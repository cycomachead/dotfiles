[ -n "$PS1" ] && source ~/.bash_profile

# FIX THIS SHIT.
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/Michael/.travis/travis.sh ] && source /Users/Michael/.travis/travis.sh

export NVM_DIR="/Users/Michael/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
