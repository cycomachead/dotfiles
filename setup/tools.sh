sudo -v

# Homebrew and tools.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install heroku git exiv2 gphoto2 python3 node hub postgres-9.5

npm install -g psi jshint grunt-cli coffee-script bower

# My Apps Brew-Casks
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install carbon-copy-cloner
brew cask install hipchat
# brew cask install skype
# brew cask install google-earth
# brew cask install transmission
brew cask install textmate
# brew cask install sourcetree
# Gradescope Tools
brew cask install front
brew cask install vagrant


# Pip for default python
sudo easy_install pip
pip install virtualenv

# Setup Ruby
# TODO: This is rather dangerous. :(
curl -sSL https://get.rvm.io | bash -s stable

rvm install 2.3.1
rvm install 2.4.0
rvm use stable
gem install jekyll bundler
sudo gem update --system