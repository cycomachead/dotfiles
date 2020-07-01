#! /usr/bin/env bash

dotfiles="$HOME/Dropbox/Projects/dotfiles/home/"

function symlink {
    echo "Linking $1"
    rm .$1;
    ln -s $dotfiles$1 .$1;
}

pushd ~/;
for file in $(ls $dotfiles)
do
    symlink $file;
done
popd;
