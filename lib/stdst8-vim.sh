#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_vim_and_tooling() {
  if [[ -a "${LOCAL_CFG}/vim" ]]; then
    echo "${ST8_PREFIX}Vim tooling installed, skipping"
  else 
    echo "${ST8_PREFIX}Installing Vim related tooling"
    sudo apt install -y yarnpkg vim-gui-common vim-runtime
    echo "Installing vim-plug"
    if [[ ! -a "${HOME}/.vim/autoload/plug.vim" ]];then
      curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    cp "${REPO_DIR}/vim/vimrc" "${HOME}/.vimrc"
    echo "Installed" > "${LOCAL_CFG}/vim" 
  fi
}

