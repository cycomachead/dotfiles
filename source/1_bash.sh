# Use: `ssh $RMATE ...` to setup the tunneling.
export RMATE='-R 52698:localhost:52698'

export PROJECTS_HOME="~/Documents/Projects"
export GRADESCOPE_HOME="~/Documents/gradescope/gradescope-app/"

vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$vscode"

# EXPORTS:
# ==============================================================================
# export RMATE_HOST=auto
# export RMATE_PORT=12345
# this needs to be fixed for editing crontabs:
export EDITOR="$vscode/code -w"
export TM_SUPPORT_PATH='/Applications/TextMate.app/Contents/SharedSupport/Support'

# Temporary fix for the mate editing crontabs
# Use cront to edit crontabs.
function cront
{
    unset EDITOR
    sudo crontab -e
    export EDITOR="/usr/local/bin/mate -w"
}

# Automatically load git bash completion
# TODO: Commented out because there's a modification to not show remotes.
# source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

# Autocomplete for git as 'g' as well
complete -o default -o nospace -F _git g