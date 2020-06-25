 #! /bin/sh

# New Mac Config
#########################

# Setup Variables
DEST="~/Michael"
dotfiles='~/Documents/Projects/dotfiles/home/'

echo "Setting up a new mac."
echo "Using directory: $dotfiles".

mkdir -p $dotfiles
echo "Asking for password:"
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

./setup/link_home_files.sh
./setup/git_author.sh
./setup/set_hostname.sh

# set RSA permissions
chmod 755 ~/.ssh
chmod 600 ~/.ssh/id*

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
chmod +x ./setup/osx.sh
./setup/osx.sh
