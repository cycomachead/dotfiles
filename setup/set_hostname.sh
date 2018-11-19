# Set computer name (as done via System Preferences → Sharing)
echo 'Please enter a hostname.'
read NEW_HOSTNAME
SAFE_HOSTNAME=${NEW_HOSTNAME// /-}
sudo scutil --set ComputerName "${NEW_HOSTNAME}"
sudo scutil --set HostName "${NEW_HOSTNAME}"
sudo scutil --set LocalHostName "${SAFE_HOSTNAME}"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${SAFE_HOSTNAME}"