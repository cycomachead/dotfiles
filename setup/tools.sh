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

brew install bash
brew install bash-completion2
brew install git
brew install mise

## Get essential apps setup ASAP
export HOMEBREW_CASK_OPTS="--no-quarantine"
# brew tap homebrew/cask-versions

brew install 1password
open -a 1password
brew install launchbar
brew install visual-studio-code
brew install dropbox
brew install python3
brew install slack
brew install zoom
brew install fantastical


open -a launchbar
open -a "Visual Studio Code"
open -a "1Password 8"
open -a "Dropbox"
# Use the Brewfile in the root of the repo.
BREW_PREFIX=`brew --prefix`

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

python3 -m pip install --upgrade pip

# Pip for default python
# sudo easy_install pip
pip3 install virtualenv

# Setup Ruby
# TODO: Setup asdf

# gem install jekyll bundler

# sudo gem update --system

# Use the Brewfile in the root of the repo.
# Regenerate with `mv Brewfile Brewfile.old && brew bundle dump`
brew bundle install

brew cleanup
