# Homebrew and tools.
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing homebrew";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

brew doctor

## Get essential apps setup ASAP
export HOMEBREW_CASK_OPTS="--no-quarantine"
brew tap homebrew/cask-versions

brew install 1password
brew install launchbar
brew install slack
brew install maestral
brew install visual-studio-code-insiders
brew install zoom
brew install fantastical

brew install bash
brew install bash-completion2
brew install git

# Use the Brewfile in the root of the repo.
BREW_PREFIX=`brew --prefix`

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Use the Brewfile in the root of the repo.
# Regenerate with `mv Brewfile Brewfile.old && brew bundle dump`
brew bundle install

brew cleanup

# Pip for default python
# sudo easy_install pip
pip3 install virtualenv

# Setup Ruby
# TODO: This is rather dangerous. :(
curl -sSL https://get.rvm.io | bash -s stable

# rvm install 2.3.5
rvm install 2.7.x
rvm install 3.3.3
rvm use stable

gem install jekyll bundler

# sudo gem update --system
