#!/bin/bash

# Deactivate remote management
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop
# Remove Desktop Sharing 
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off
# Remove Apple Remote Desktop Settings
sudo rm -rf /var/db/RemoteManagement ; \
sudo defaults delete /Library/Preferences/com.apple.RemoteDesktop.plist ; \
defaults delete ~/Library/Preferences/com.apple.RemoteDesktop.plist ; \
sudo rm -r /Library/Application\ Support/Apple/Remote\ Desktop/ ; \
rm -r ~/Library/Application\ Support/Remote\ Desktop/ ; \
rm -r ~/Library/Containers/com.apple.RemoteDesktop

# Uninstall Google Update
~/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/ksinstall --nuke

#Focus follows mouse on terminal
defaults write com.apple.Terminal FocusFollowsMouse -string YES

# Disable icon bounce on Dock
defaults write com.apple.dock no-bouncing -bool false && killall Dock

#Show Hidden Apps/Icons
defaults write com.apple.dock showhidden -bool true && killall Dock

#enable rosetta2 form apple chips
CPUTYPE=`sysctl -n machdep.cpu.brand_string`
echo $CPUTYPE
if [[ "$CPUTYPE" == *"Apple"* ]]; then
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi


