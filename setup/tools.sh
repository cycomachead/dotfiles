# Homebrew and tools.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew doctor

# Use the Brewfile in the root of the repo.
brew bundle install

# Pip for default python
sudo easy_install pip
pip install virtualenv

# Setup Ruby
# TODO: This is rather dangerous. :(
curl -sSL https://get.rvm.io | bash -s stable

# rvm install 2.3.5
rvm install 2.5.5
rvm install 2.6.x
rvm use stable
gem install jekyll bundler
sudo gem update --system
