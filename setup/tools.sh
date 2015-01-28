sudo -v

# Install the hk client for heroku
# source github/heroku/hk (This is beta and may change!)
L=/usr/local/bin/hk && curl -sL -A "`uname -sp`" https://hk.heroku.com/hk.gz | zcat >$L && chmod +x $L

# Homebrew and tools.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install git wget exiv2 gphoto2 python3 node hg hub bfg heroku ghi

npm install -g localtunnel psi jshint grunt-cli coffee-script bower
# Hubot tools, probably don't need to be global
# hubot hubot-hipchat

# My Apps Brew-Casks
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install carbon-copy-cloner
brew cask install hipchat
brew cask install skype
brew cask install google-earth
brew cask install google-drive
brew cask install google-webdesigner
brew cask install transmission
brew cask install textmate
brew cask install sourcetree
brew cask install transmission
brew cask install transmission



# Pip for default python
sudo easy_install pip
pip install virtualenv

# Update gems and install jekyll
sudo gem install jekyll bundle
sudo gem update --system