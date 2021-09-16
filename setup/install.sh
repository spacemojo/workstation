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


#!/usr/bin/env bash

# Using #!/usr/bin/env NAME makes the shell search for the first match of NAME in the $PATH environment variable. It can be useful if you aren't aware of the absolute path or don't want to search for it.

echo "Installing zsh"
# sudo apt install -y zsh
sudo apt install -y yarnpkg
# chsh -s $(which zsh)
# echo "Restart your shell and rerun this script"

echo "Installing oh-my-zsh - actually, run that command until I figure out how to launch it correctly"
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Downloading Font files"
if [[ ! -d "${HOME}/.local/share/fonts" ]];then
  echo "Creating Fonts folder"
  mkdir "${HOME}/.local/share/fonts"
  wget -O "${HOME}/.local/share/fonts/MesloLGSNFRegular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf 
  wget -O "${HOME}/.local/share/fonts/MesloLGSNFBold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
  wget -O "${HOME}/.local/share/fonts/MesloLGSNFItalic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
  wget -O "${HOME}/.local/share/fonts/MesloLGSNFBoldItalic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fi

echo "Installing Powerlevel10K"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "Creating local bin dir"
if [[ ! -d "${HOME}/.local/bin" ]]; then
  mkdir -p ~/.local/bin
fi

echo "Installing vim-plug"
if [[ ! -a "${HOME}/.vim/autoload/plug.vim" ]];then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


echo "Done"
