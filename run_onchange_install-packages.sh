#!/bin/sh

echo 'Installing command line tools'...
xcode-select --install

echo 'Installing rosetta'...
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo 'Installing brew...'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Install brew packages...'
brew bundle install

echo 'Change default shell to fish...'
chsh -s $(which fish)
