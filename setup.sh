 #! /bin/sh

# New Mac Config
#########################
# Setup Variables
DEST="~/Michael"

sudo -v

# Setup Users Dir
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
# FIXME -- move RSA from encrypted file
# cp -f .gitconfig "${DEST}/.ssh/id_rsa"
cp -f .gitignore "${DEST}/.ssh/id_rsa.pub"

# set RSA permissions
chmod 755 ~/.ssh
chmod 600 ~/.ssh/id*

# FIXME:
# Grab and download Dropbox installer
DBOX = "Dropbox.app.zip"

# Open it
# Link Files
mkdir ~/Dropbox
# Apps Folder
# ln -s ~/Dropbox/Drag\ and\ Drop\ apps/ /Applications/Drag\ and\ Drop\ apps


# Break to install Xcode and CL tools
git # Will force download of dev tools in 10.9 if they aren't installed.
read -p "Delaying to Install Apps. Type something to continue. " -n 1
echo
if [[ $REPLY =~ ^[A-Za-z0-9]$ ]]; then
	echo "Continuing."
fi

# Install a bunch of development tools
./setup/tools.sh

# Configure Defaults
Setup='./setup/osx.sh'
chmod 777 $Setup
$Setup

# Cleanup.
cd
# rm -rf ~/Desktop/setup