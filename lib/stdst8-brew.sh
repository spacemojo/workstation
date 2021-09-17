#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_brew() {
  if [[ -a "${LOCAL_CFG}/brew" ]];then
    echo "${ST8_PREFIX}Brew installed, skipping"
  else 
    echo "${ST8_PREFIX}Installing Brew"
    /usr/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "${ST8_PREFIX}Brew installed"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "${HOME}/.zshrc"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "Installed" > "${LOCAL_CFG}/brew"
    source "${HOME}/.zshrc"
  fi
  echo
}

