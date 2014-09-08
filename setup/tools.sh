# Install the hk client for heroku
# source github/heroku/hk (This is beta and may change!)
L=/usr/local/bin/hk && curl -sL -A "`uname -sp`" https://hk.heroku.com/hk.gz | zcat >$L && chmod +x $L

# Homebrew and tools.
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
brew install git wget exiv2 gphoto2 python3 node hg hub bfg heroku

npm install -g localtunnel psi jshint grunt-cli coffee-script
# Hubot tools, probably don't need to be global
# hubot hubot-hipchat


# Pip for default python
sudo easy_install pip
pip install virtualenv

# brew install ruby -- no longer necessary in Mavericks
# Update gems and install jekyll
sudo gem install jekyll
sudo gem update --system