 #! /bin/sh

# New Mac Config
#########################
DEST='/Volumes/Macintosh HD/Users/Michael/'

sudo -v

# Setup Users Dir
# dscl . Michael -change dsAttrTypeNative:home /Users/Michael ${DEST}

# Grab the full GH repo and cd into it.
URL='https://raw.github.com/cycomachead/dotfiles/master'
cd ~/Desktop
mkdir setup && cd setup
FILE='{.aliases,.bash,.bash_profile,.bash_prompt,.bashrc,.exports,.extra,.functions,.gitattributes,.gitconfig,.gitignore,.osx,.tm_properties,.zsh,Michael.terminal}'
curl -# ${URL}/${FILE} -o "#1"

# Copy Source files.
for file in ./.{bash_profile,bashrc,gitconfig,gitignore,tm_properties}
do
    cp ${file} ${DEST}${file}
done

# Break to install Xcode and CL tools
read -p "Delaying to Install Apps. " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "Continuing."
fi

# Disable auto brightness settings

# Homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
# brew install wget

# Configure Defaults
./.osx