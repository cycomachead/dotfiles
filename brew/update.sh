#!/usr/bin/env bash

pushd "$(dirname "$0")";

# Dump the brewfile to `Brewfile.hostname`
brew bundle dump --file="Brewfile.$(hostname)" --force --describe --vscode --mas

# Find all lines in Brewfile* and *.brewfile (excluding to-sort.brewfile)
brewfile_lines=$(cat Brewfile* 2>/dev/null)
other_brewfile_lines=$(find . -maxdepth 1 -name "*.brewfile" ! -name "to-sort.brewfile" -exec cat {} + 2>/dev/null)

# Write lines from Brewfile* not present in any *.brewfile (except to-sort.brewfile) into to-sort.brewfile
grep -Fxv -f <(echo "$other_brewfile_lines") <(echo "$brewfile_lines") > to-sort.brewfile

popd;
