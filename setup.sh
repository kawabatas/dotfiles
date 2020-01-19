#!/bin/bash

DIR=$(cd $(dirname $0); pwd)
files=(.gitignore_global .bash_profile .bashrc)
for file in ${files[@]};do
  _path=$DIR/$file
  echo "mv ~/$file ~/backup"
  mv ~/$file ~/backup
  echo "ln -s $_path ~/$file"
  ln -s $_path ~/$file
done

echo "mv ~/.gitconfig ~/backup"
mv ~/.gitconfig ~/backup
echo "cp ~/dotfiles/.gitconfig_shared ~/.gitconfig"
cp ~/dotfiles/.gitconfig_shared ~/.gitconfig

# homebrew
if hash "brew"; then
  echo "$(tput setaf 2)Already installed Homebrew ✔︎$(tput sgr0)"
else
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating Homebrew..."
brew update && brew upgrade

brews=(git jq readline openssl direnv tree ghq hub peco anyenv go)

for brew in ${brews[@]}; do
  echo "brew install $brew ..."
  brew install $brew
done

echo "Cleanup Homebrew..."
brew cleanup
