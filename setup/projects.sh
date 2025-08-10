#! /usr/bin/env bash

# Setup dev projects, which now exist outside of ~/Dropbox
# This should be run fairly late, assuming git+ssh are setup.

mkdir -p $HOME/dev/

CURRENT_SEMESTER=SP25
export DEV=$HOME/dev/

repos=(
    "cs88-website/cs88.git"
    "cs88-website/cs88-website.github.io.git"
    "cs88-website/${CURRENT_SEMESTER}.git"
    "cal-cs61a-staff/berkeley-cs61a.git"
)

# If no ~/dev/dotfiles, then clone dotfiles.

if [ ! -d "$DEV/dotfiles" ]; then
    git clone git@github.com:cycomachead/dotfiles.git $DEV/dotfiles
fi

# Clone all repos into ~/dev/
cd $DEV
for repo in "${repos[@]}"; do
    git clone "git@github.com:$repo" --recurse-submodules --depth 100
done
