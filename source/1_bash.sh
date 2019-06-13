# This file is a list of aliases used my classes at berkeley each semester
# It contains shortcuts for often used commands for moving files and homework
# Defined Variables:
# ==============================================================================
ser="cs.berkeley.edu"
ph="public_html"
git="git@github.com"
sync="rsync -ahPvz --itemize-changes --progress --delete --exclude=\"lec\""
tmtunnel='-R 52698:localhost:52698'
export RMATE=${tmtunnel}

export PROJECTS_HOME="~/Documents/Projects"
export GRADESCOPE_HOME="~/Documents/gradescope/gradescope-app/"

# EXPORTS:
# ==============================================================================
# export RMATE_HOST=auto
# export RMATE_PORT=12345
# this needs to be fixed for editing crontabs:
export EDITOR="/usr/local/bin/mate -w"
export TM_SUPPORT_PATH='/Applications/TextMate.app/Contents/SharedSupport/Support'

# Temporary Fix for the mate editing crontabs
# Use cront to edit crontabs.
function cront
{
    unset EDITOR
    sudo crontab -e
    export EDITOR="/usr/local/bin/mate -w"
}

export LANG='en_US.UTF-8'

# The next line updates PATH for the Google Cloud SDK.
# source '/usr/local/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
# source '/usr/local/google-cloud-sdk/completion.bash.inc'

# Automatically load git bash completion
# TODO: Commented out because there's a modification to not show remotes.
# source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

# Autocomplete for git as 'g' as well
complete -o default -o nospace -F _git g