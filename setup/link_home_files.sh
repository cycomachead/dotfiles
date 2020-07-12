#! /usr/bin/env bash

# Creates a symlink to all the files in home/
# Uses ~/ to be independent of home folder/drive path
# (incase it changes after the script has been run.)
linkPath='Dropbox/Projects/dotfiles/home/';
# Otherwise, can't correctly loop over ~/...
# dotfiles=$(printf %q "$HOME/$linkPath")
dotfiles=$HOME/$linkPath;

function symlink {
    echo "Linking $1"
    rm .$1;
    ln -s "$dotfiles$1" .$1;
}

pushd ~/;
echo "Linking files in $dotfiles";
# files=`ls '/Volumes/Michael 1/Users/michael/Dropbox/Projects/dotfiles/home'`;
files=`ls "$dotfiles"`;
for file in $files
do
    symlink $file;
done
popd;
