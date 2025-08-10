#! /usr/bin/env bash

# symlink all .* files in home/ to the actual home folder.
# symlinks allow keeping the content in git without having to manually sync.
# Because there are a few settings files (mise-*), skip over files
# that don't start with a dot.
# This must be setup inside $HOME or else the script fails.
dotfiles='dev/dotfiles/home/.*';
# dotfiles=$HOME/$dotfiles;

function symlink {
    echo "Linking $1"
    f=$(basename $1);
    rm $f;
    ln -s "$1" $f;
}

pushd $HOME;
echo "Linking files in $dotfiles";
files=`ls $dotfiles`;
for file in $files
do
    symlink $file;
done
popd;
