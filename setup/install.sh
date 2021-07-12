#!/bin/bash

echo "Creating local bin dir"
mkdir -p ~/.local/bin

echo "Creating local source code dir"
mkdir ~/Source

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing lf"
git clone git@github.com:gokcehan/lf.git ~/Source/lf
cd ~/Source/lf && go install 

echo "Linking git message template"
ln -s ./git/gitmessage ~/.gitmessage

# git config --global commit.template ~/.gitmessage
