#! /usr/bin/env bash
# This file is sourced by bash_profile, close to the top.
# Assumes brew is loaded -- brew is installed on every machine using these
# dotfiles, macOS and Linux alike -- so all PATH additions should occur here.

# macOS-only sections are gated on this. Everything else is portable.
IS_MACOS=false
[ "$(uname -s)" = "Darwin" ] && IS_MACOS=true

# Shorthand just for readability.
BREW=$HOMEBREW_PREFIX;

# Luarocks 3 and Lua 5.1 tools (added by snapCloud)
# This assumes everything is lua 5.1, fine for me...
export LUA_VERSION="5.1"
lua_paths=(
  "./?.lua"
  "./?/init.lua"
  "$BREW/lib/lua/5.1/?.lua"
  "$BREW/lib/lua/5.1/?/init.lua"
  "$BREW/share/lua/5.1/?.lua"
  "$BREW/share/lua/5.1/?/init.lua"
  "$HOME/.luarocks/share/lua/5.1/?.lua"
  "$HOME/.luarocks/share/lua/5.1/?/init.lua"
)
# Only exists if luarocks is actually installed via brew on this box.
if [ -d "$HOMEBREW_CELLAR/luarocks" ]; then
  LUAROCKS_VERSION=$(ls "$HOMEBREW_CELLAR/luarocks" | tail -n 1);
  lua_paths+=("$HOMEBREW_CELLAR/luarocks/$LUAROCKS_VERSION/share/lua/5.1/?.lua")
fi
for str in "${lua_paths[@]}"; do
  export LUA_PATH="$str;$LUA_PATH";
done

lua_cpaths=(
"./?.so"
"$BREW/lib/lua/5.1/?.so"
"$BREW/lib/lua/5.1/loadall.so"
"$HOME/.luarocks/lib/lua/5.1/?.so"
)
for str in "${lua_cpaths[@]}"; do
  export LUA_CPATH="$str;$LUA_CPATH";
done

if $IS_MACOS; then
  # This is odd... https://stackoverflow.com/a/53404317
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

  # NOTE: this *replaces* PATH rather than appending to it, so it must stay
  # macOS-only -- on Linux it would throw away the real system PATH.
  export PATH='/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/Library/TeX/texbin:/opt/homebrew/bin:./bin:/Users/michael/.luarocks/bin:/Users/michael/bin:/Users/michael/Library/Python/3.9/bin:/Users/michael/Library/TexShop/bin:/Library/Tex/texbin:/opt/X11/bin'
fi

# This was moved from the end of bash_profile to bashrc.
export PATH="$BREW/sbin:$PATH"

# Brew bin paths already loaded so brew can be loaded.
paths=(
  "./bin"
  "$HOME/.luarocks/bin"
  "$HOME/bin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
  "/bin"
)
if $IS_MACOS; then
  paths+=(
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
    "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"
    "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin"
    "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin"
    "$HOME/Library/Python/3.9/bin"
    "$HOME/Library/TexShop/bin"
    "/Library/Tex/texbin"
    "/Library/Apple/usr/bin"
    "/opt/X11/bin"
    "/System/Cryptexes/App/usr/bin"
  )
fi
for str in "${paths[@]}"; do
  PATH="$PATH:$str";
done
export PATH

if [ -d "$BREW/opt/postgresql@16/bin" ]; then
  export PATH="$BREW/opt/postgresql@16/bin:$PATH"
fi

if command -v mise > /dev/null 2>&1; then
  eval "$(mise activate bash)"
fi
