#!/bin/bash

DOTFILES=~/.dotfiles

cd ~

xcode-select --install

read -p "Press [Enter] to continue…"

echo "---Installing Homebrew…---"
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
brew update
echo "---Homebrew Installed---"

read -p "Press [Enter] to continue…"

echo "---Installing Brews…---"
for brew in $(cat ~/.dotfiles/brewlist*); do
    brew install "$brew"
done
echo "Brew Installation Complete"

read -p "Press [Enter] to continue…"

# Prep path for using Homebrew by default
PATH=/usr/local/bin:$PATH

echo "---Preparing ZSH…---"
rm -rf ${DOTFILES}/local/oh-my-zsh .zshrc .oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ${DOTFILES}/local/oh-my-zsh
ln -sf ${DOTFILES}/spr.zsh-theme ${DOTFILES}/local/oh-my-zsh/themes/spr.zsh-theme
ln -sf ${DOTFILES}/local/oh-my-zsh .oh-my-zsh
ln -sf ${DOTFILES}/.zshrc .zshrc
echo "ZSH Setup Complete"

echo "---Setting up Vim…---"
rm -rf .vim .vimrc ${DOTFILES}/local/vundle
ln -sf ${DOTFILES}/.vimrc .vimrc
ln -sf ${DOTFILES}/.vim .vim
mkdir -p ${DOTFILES}/.vim/bundle
git clone https://github.com/gmarik/vundle.git ${DOTFILES}/local/vundle
ln -sf ${DOTFILES}/local/vundle .vim/bundle/vundle
echo "> installing vundle bundles…"
vim +BundleInstall +qall
cd .vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~
echo "---Vim Setup Complete---"

echo "---Configuring Git…---"
rm -rf .gitconfig .gitignore_global
ln -sf ${DOTFILES}/.gitconfig .gitconfig
ln -sf ${DOTFILES}/.gitignore_global .gitignore_global
email=""
while true; do
    read -p ">>> Please enter your email address for the global git configuration: " email
    read -p ">>> Is $email correct? (y/n) " yn
    case $yn in
        [Yy]* ) break;;
        * ) ;;
    esac
done
git config --file ${DOTFILES}/.gitconfig.local --replace-all user.email "$email"
echo "> downloading ksdiff"
wget "https://updates.blackpixel.com/latest?app=ksdiff" -O /tmp/ksdiff.zip
unzip /tmp/ksdiff.zip -d /tmp/ksdiff
open /tmp/ksdiff/*.pkg
read -p ">>> Press enter to continue once install is complete"
rm -rf /tmp/ksdiff*
echo "---Git Configured---"

echo "--Installing Gems…---"
for gem in $(cat ~/.dotfiles/gemlist*); do
    sudo gem install "$gem"
done
rbenv install 1.9.3-p394
rbenv rehash
echo "Gem Installation Complete"

echo "---Fetching the Latest MacVim…---"
wget "http://macvim.googlecode.com/files/MacVim-snapshot-66.tbz" -O /tmp/macvim.tbz
tar xjCf /tmp/ /tmp/macvim.tbz
echo "> sudo required"
sudo rm -rf /Applications/MacVim.app
sudo cp -R /tmp/MacVim*/MacVim.app /Applications/
rm -rf /tmp/macvim.tbz
rm -rf /tmp/MacVim*
echo "---Latest MacVim Installed---"

echo "---Configuring OS X…---"
${DOTFILES}/osx.sh
echo "---OS X Configured (restart may be required)---"
