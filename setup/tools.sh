sudo -v

# Homebrew and tools.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install heroku git exiv2 gphoto2 python3 node hub postgres

npm install -g psi

# My Apps Brew-Casks
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install carbon-copy-cloner
# brew cask install skype
# brew cask install google-earth
# brew cask install transmission
brew cask install textmate
# brew cask install sourcetree
brew cask install docker
# Gradescope Tools
brew cask install front
# brew cask install vagrant


# Pip for default python
sudo easy_install pip
pip install virtualenv

# Setup Ruby
# TODO: This is rather dangerous. :(
curl -sSL https://get.rvm.io | bash -s stable

rvm install 2.3.5
rvm install 2.5.1
rvm use stable
gem install jekyll bundler
sudo gem update --system
