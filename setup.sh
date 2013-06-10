 #! /bin/sh

# New Mac Config
#########################
DEST="/Volumes/Macintosh HD/Users/Michael"

sudo -v

# Setup Users Dir
# dscl . Michael -change dsAttrTypeNative:home /Users/Michael ${DEST}

# Grab the full GH repo and cd into it.
URL='https://raw.github.com/cycomachead/dotfiles/master'
cd ~/Desktop
mkdir setup && cd setup
FILE='{.aliases,.bash,.bash_profile,.bash_prompt,.bashrc,.exports,.extra,.functions,.gitattributes,.gitconfig,.gitignore,.osx,.tm_properties,.zsh,Michael.terminal}'
curl -# ${URL}/${FILE} -o "#1"

cd ~/Desktop/setup/
# Copy Source files.
cp -f .bash_profile "${DEST}/.bash_profile"
cp -f .bashrc "${DEST}/.bashrc"
cp -f .gitconfig "${DEST}/.gitconfig"
cp -f .gitignore "${DEST}/.gitignore"
cp -f .tm_properties "${DEST}/.tm_properties"


# Break to install Xcode and CL tools
read -p "Delaying to Install Apps. Type Done to continue. " -n 1
echo
if [[ $REPLY =~ ^[A-Za-z0-9]$ ]]; then
	echo "Continuing."
fi

# Disable auto brightness settings
# TODO

# Homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
# brew install wget

# Configure Defaults
chmod 777 .osx
./.osx

#Cleanup.
cd
rm -rf ~/Desktop/setup