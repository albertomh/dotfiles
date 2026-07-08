#!/bin/bash
# macOS system preferences. Runs once per machine (chezmoi tracks state).
# To re-run after edits: chezmoi state delete-bucket --bucket=scriptState
set -euo pipefail
[ "$(uname)" = "Darwin" ] || exit 0

MACHINE_NAME="mbp-m5"
sudo scutil --set ComputerName "$MACHINE_NAME"
sudo scutil --set LocalHostName "$MACHINE_NAME"
sudo scutil --set HostName "$MACHINE_NAME"

# keyboard: fast repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# mouse: faster tracking
defaults write NSGlobalDomain com.apple.mouse.scaling -float 2.0

# trackpad: enable tap to click for this user and the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Finder: show extensions, path bar, list view
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# disable Finder animations
defaults write com.apple.finder DisableAllAnimations -bool true

# dock: autohide, no recents
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false

# screenshots to ~/Downloads
defaults write com.apple.screencapture location -string "$HOME/Downloads"

# avoid creating .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# expand save/print dialogs by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# disable smart quotes/dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# ------

killall Dock Finder SystemUIServer 2>/dev/null || true
