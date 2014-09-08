# Add `~/bin` to the `$PATH`
# export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * .bash is my short quick settings changes.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/Dropbox/Projects/dotfiles/source/*; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# SFDC Tools
# BREW=/usr/local/Cellar
# export ANT_HOME=$BREW/ant/1.9.4
# export GRADLE_HOME=$BREW/gradle/1.12
# export JETTY_HOME=$BREW/jetty8/8.1.15/libexec
# export JMETER_HOME=/$BEW/jmeter/2.11
# export JDK_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
# export JAVA_HOME=$JDK_HOME
 # put paths here
# export PATH=$PATH:$GRADLE_HOME/bin/