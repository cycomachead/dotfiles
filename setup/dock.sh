#! /usr/bin/env bash
# A very basic version of dockutil which requires no external dependencies
# Removes everything from the Dock and adds specified apps back

# Empty the macOS Dock (left side)
defaults write com.apple.dock persistent-apps -array

append-to-dock() {
    local app_name="$1"
    local app_path="${2:-/Applications}"

    if [[ -z "$app_name" ]]; then
        echo "Usage: append-to-dock <app_name> [app_path]"
        echo "Example: append-to-dock Calendar.app"
        echo "Example: append-to-dock Terminal.app /System/Applications"
        return 1
    fi

    # Ensure app_name ends with .app
    if [[ "$app_name" != *.app ]]; then
        app_name="${app_name}.app"
    fi

    local full_path="${app_path}/${app_name}"

    # Check if app exists
    # Don't quit in case it gets installed later...
    if [[ ! -d "$full_path" ]]; then
        echo "Error: $full_path not found"
    fi

    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${full_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

    echo "Added $app_name to dock"
}

# Add apps one by one in your preferred order

MACOS_15_SYSTEM="/System/Applications"
MACOS_15_SECURE="/System/Cryptexes/App/System/Applications"

append-to-dock "Safari" "$MACOS_15_SECURE"
append-to-dock "Safari Technology Preview"
append-to-dock "Google Chrome Canary"
append-to-dock "Fantastical"
append-to-dock "Photos" "$MACOS_15_SYSTEM"
append-to-dock "Slack"
append-to-dock "Notes" "$MACOS_15_SYSTEM"
append-to-dock "Reminders" "$MACOS_15_SYSTEM"
append-to-dock "1Password"
append-to-dock "Visual Studio Code"
# Boo, this should still be called System Preferences...
append-to-dock "System Settings" "$MACOS_15_SYSTEM"
append-to-dock "Disk Utility" "$MACOS_15_SYSTEM/Utilities"
append-to-dock "Activity Monitor" "$MACOS_15_SYSTEM/Utilities"
append-to-dock "Terminal" "$MACOS_15_SYSTEM/Utilities"

killall Dock
