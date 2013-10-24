#!/bin/bash
cd ~

echo "---Updating Homebrew…---"
brew update
brew upgrade
for i in $(cat ~/.dotfiles/brewlist*); do
    if \! $(brew list|greq -q "$i"); then
        brew install "$i"
    fi
done
brew linkapps
echo "---Homebrew Updated---"

zsh -i -c upgrade_oh_my_zsh

echo "---Updating Vim…---"
vim +BundleInstall!
cd .vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~
echo "---Vim Updated---"
