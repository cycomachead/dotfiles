 #! /bin/sh

# New Mac Config / Setup
# Goal: Get a running mac with as little effort as possible.
#########################

# Setup Variables
projects="$HOME/Dropbox/Projects"
dotfiles="$HOME/Dropbox/Projects/dotfiles"

echo "Setting up a new mac."
echo "Using directory: $dotfiles".

mkdir -p $dotfiles
echo "Asking for password:"
sudo -v

# Grab the full GH repo and cd into it.
# TODO: Check if I might have already cloned the repo?
cd $projects
curl https://github.com/cycomachead/dotfiles/archive/refs/heads/master.zip -o dotfiles.zip
unzip dotfiles.zip

cd dotfiles;

./setup/link_home_files.sh
./setup/git_author.sh
./setup/set_hostname.sh

# Configure Defaults
chmod +x ./setup/osx.sh
./setup/osx.sh

# Install a bunch of development tools
./setup/tools.sh

echo "Xcode Must be Installed."
xcode-select --install
read -p "Delaying to Install Xcode. Type something to continue. " -n 1
echo
if [[ $REPLY =~ ^[A-Za-z0-9]$ ]]; then
	echo "Continuing."
fi

# set RSA permissions
mkdir ~/.ssh
cp .ssh/* ~/.ssh/
# open .ssh/ssh.dmg
# TODO Store and copy ssh_config.
chmod 755 ~/.ssh
chmod 600 ~/.ssh/id*

# Break to install Xcode and CL tools
git # Will force download of dev tools in 10.9 if they aren't installed.
read -p "Delaying to Install Apps. Type something to continue. " -n 1
echo
if [[ $REPLY =~ ^[A-Za-z0-9]$ ]]; then
	echo "Continuing."
fi

# TODO: tools I don't know how to install.
# Blackmagic ATEM
# Blackmagic Desktop Video
# Safari Technology Preview
#
