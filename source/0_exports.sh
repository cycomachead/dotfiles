# Larger bash history (allow 2^15 entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:p"

# Prefer US English and use UTF-8.
# Not every Linux image ships with en_US.UTF-8 generated, and forcing LC_ALL to
# a locale that doesn't exist makes perl/ssh/git warn on every invocation.
if [ "$(uname -s)" = "Darwin" ] || locale -a 2>/dev/null | grep -qix 'en_US.utf-\?8'; then
    export LANG="en_US.UTF-8"
else
    export LANG="C.UTF-8"
fi
export LC_ALL="$LANG"

# Highlight section titles in manual pages.
# (This used to reference $ORANGE, which was never defined -- so it set the
# capability to an empty string and silently disabled bold in man pages.)
export LESS_TERMCAP_md=$'\e[1;33m'
export LESS_TERMCAP_me=$'\e[0m'

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

# NOTE: colored `grep` used to live here as GREP_OPTIONS, which GNU grep
# dropped in 2.21 and now warns about on every call. See the aliases in
# 3_aliases.sh instead.

# Link Homebrew casks in `/Applications` rather than `~/Applications`.
# Casks are macOS-only; the var is meaningless on Linuxbrew.
if [ "$(uname -s)" = "Darwin" ]; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi

# Brew postgres data for easy starting.
# $HOMEBREW_PREFIX is exported by .bash_profile, so no need to shell out again.
export PGDATA="$HOMEBREW_PREFIX/var/postgresql@16/"
