# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* *
	fi
}

# use generate-random to get a base64 string, such as for generating keys.
# generate-random N will make it N bytes long.
function generate-random() {
    local num_bytes=${1:-30}
    head -c "$num_bytes" /dev/urandom | base64
}
# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo # newline
	fi
}

# Get a character’s Unicode code point
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo # newline
	fi
}

# Add note to Notes.app (OS X 10.8)
# Usage: `note 'title' 'body'` or `echo 'body' | note`
# Title is optional
function note() {
	local title
	local body
	if [ -t 0 ]; then
		title="$1"
		body="$2"
	else
		title=$(cat)
	fi
	osascript >/dev/null <<EOF
tell application "Notes"
	tell account "iCloud"
		tell folder "Notes"
			make new note with properties {name:"$title", body:"$title" & "<br><br>" & "$body"}
		end tell
	end tell
end tell
EOF
}

# Add reminder to Reminders.app (OS X 10.8)
# Usage: `remind 'foo'` or `echo 'foo' | remind`
function remind() {
	local text
	if [ -t 0 ]; then
		text="$1" # argument
	else
		text=$(cat) # pipe
	fi
	osascript >/dev/null <<EOF
tell application "Reminders"
	tell the default list
		make new reminder with properties {name:"$text"}
	end tell
end tell
EOF
}

brew_pg=postgresql@14;
function start-pg() {
	postgres -D "$(brew --prefix)/var/$brew_pg/" &
}

# https://www.reddit.com/r/Lightroom/comments/12x370r/finding_all_my_bracketed_shots_smart_folders/
function update-exif() {
	exiftool '-UserComment<Bracket-$BracketMode' -ext CR3 -R $1;
}
