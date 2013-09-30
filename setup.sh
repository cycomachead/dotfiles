 #! /bin/sh

# New Mac Config
#########################
DEST="/Volumes/Michael/Users/Michael"

sudo -v #get password once

# Setup Users Dir
# disabled until testing.
# dscl . Michael -change dsAttrTypeNative:home /Users/Michael ${DEST}

# Grab the full GH repo and cd into it.
URL='https://raw.github.com/cycomachead/dotfiles/master'
cd ~/Desktop
mkdir setup && cd setup
FILE='.{aliases,bash,bash_profile,bash_prompt,bashrc,exports,extra,functions,gitattributes,gitconfig,gitignore,osx,tm_properties,inputrc}'
curl -# ${URL}/${FILE} -o "#1"
curl -# ${URL}/'Michael.terminal' -o "#1"
FILE='.ssh/{id_rsa,id_rsa.pub}'
curl -# ${URL}/${FILE} -o "#1"

cd ~/Desktop/setup/
# Copy Source files.
cp -f .bash_profile "${DEST}/.bash_profile"
cp -f .bashrc "${DEST}/.bashrc"
cp -f .gitconfig "${DEST}/.gitconfig"
cp -f .gitignore "${DEST}/.gitignore"
cp -f .tm_properties "${DEST}/.tm_properties"
cp -f .tm_properties "${DEST}/.inputrc"
cp -f .gitconfig "${DEST}/.ssh/id_rsa"
cp -f .gitignore "${DEST}/.ssh/id_rsa.pub"

# set RSA permissions
chmod 755 ~/.ssh
chmod 600 ~/.ssh/id*


# Break to install Xcode and CL tools
git #Will force download of dev tools in 10.9 if they aren't installed.
read -p "Delaying to Install Apps. Type something to continue. " -n 1
echo
if [[ $REPLY =~ ^[A-Za-z0-9]$ ]]; then
	echo "Continuing."
fi


# Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew install wget # maybe should disable since it's seldom used.
brew install ruby # update ruby
brew install gphoto2 # useful uitily for cameras
# Update gems and install jekyll
sudo gem update --system
sudo gem install jekyll

# Configure Defaults
chmod 777 .osx
./.osx

# Cleanup.
rm -rf ~/Desktop/setup