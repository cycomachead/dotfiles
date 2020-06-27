#! /usr/bin/env bash

user='/Volumes/Michael/Users/michael/'
dotfiles="$user/Dropbox/Projects/dotfiles/home/"

function symlink {
    rm .$1 || true;
    ln -s $dotfiles$1 .$1;
}

pushd ~/
for file in $(ls $dotfiles)
do
    symlink $file
done
popd
