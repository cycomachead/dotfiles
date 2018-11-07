[ -n "$PS1" ] && source ~/.bash_profile

# added by travis gem
[ -f /Users/Michael/.travis/travis.sh ] && source /Users/Michael/.travis/travis.sh

export NVM_DIR="/Users/Michael/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Added by the canvas-lms setup script
# These settings make chruby work
# See https://github.com/postmodern/chruby
[ -f /usr/local/share/chruby/chruby.sh ] && . /usr/local/share/chruby/chruby.sh
[ -f /usr/local/share/chruby/auto.sh ] && . /usr/local/share/chruby/auto.sh
[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ] && . /usr/local/opt/chruby/share/chruby/chruby.sh
[ -f /usr/local/opt/chruby/share/chruby/auto.sh ] && . /usr/local/opt/chruby/share/chruby/auto.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
