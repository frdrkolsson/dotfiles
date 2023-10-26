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

echo 'Increasee key repeat rate...'
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

echo 'Install tmux package manager...'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 'Add ruby and nodejs to asdf...'
asdf plugin add ruby
asdf plugin add nodejs
