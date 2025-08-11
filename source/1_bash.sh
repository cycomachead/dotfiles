# Note $DEV_HOME, $PROJECTS_HOME, $DOTFILES are setup in .bash_profile
# (so they have access to this repo...)

# just for nostalgia.
export GRADESCOPE_HOME="~/Documents/gradescope/gradescope-app/"

# vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"
# vscode_insiders="/Applications/Visual\ Studio\ Code\ Insiders.app/Contents/Resources/app/bin"
# export PATH="$PATH:$vscode" #":$vscode_insiders"

# Use 8888 since the site defaults to 8000
export CS88_PORT='8888'

# EXPORTS:
# ==============================================================================
# this needs to be fixed for editing crontabs:
export EDITOR="code -w"
# export EDITOR="vim"
# export TM_SUPPORT_PATH='/Applications/TextMate.app/Contents/SharedSupport/Support'

# Temporary fix for the mate editing crontabs
# Use cront to edit crontabs.
export VISUAL=$DOTFILES/apps/code-wait.sh
export EDITOR=$DOTFILES/apps/code-wait.sh

function cront
{
    # unset EDITOR
    export VISUAL="code-wait"
    crontab -e
}

# Automatically load git bash completion
# TODO: Commented out because there's a modification to not show remotes.
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

# Autocomplete for git as 'g' as well
complete -o default -o nospace -F _git g
