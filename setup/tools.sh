sudo -v

# Install the hk client for heroku
# source github/heroku/hk (This is beta and may change!)
L=/usr/local/bin/hk && curl -sL -A "`uname -sp`" https://hk.heroku.com/hk.gz | zcat >$L && chmod +x $L

# Homebrew and tools.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install git exiv2 gphoto2 python3 node hub

npm install -g localtunnel psi jshint grunt-cli coffee-script bower

# My Apps Brew-Casks
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install carbon-copy-cloner
brew cask install hipchat
brew cask install skype
brew cask install google-earth
brew cask install google-drive
brew cask install transmission
brew cask install textmate
brew cask install sourcetree



# Pip for default python
sudo easy_install pip
pip install virtualenv

# Setup Ruby
curl -sSL https://get.rvm.io | bash -s stable

rvm install 2.2.0
rvm install 1.9.3 # legacy projects
rvm use 2.2.0
gem install jekyll bundler
sudo gem update --system