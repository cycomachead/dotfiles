#! /usr/bin/env bash

dotfiles='~/Documents/Projects/dotfiles/home/'

function symlink {
    rm $1;
    ln -s $dotfiles/$1 $1;
}

pushd ~/
symlink .bash_profile
symlink .bashrc
symlink .tm_properties
symlink .inputrc
popd
