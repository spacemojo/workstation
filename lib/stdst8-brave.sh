#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_brave_browser() {
  local LOG="${LOCAL_CFG}/log/brave"
  if [[ -a "${LOCAL_CFG}/brave" ]];then
    echo "${ST8_PREFIX}Brave browser installed, skipping" > "${LOG}"
  else 
    echo "${ST8_PREFIX}Installing Brave browser" > "${LOG}"
    sudo apt install -y apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install -y brave-browser
    echo "${ST8_PREFIX}Brave browser installed" > "${LOG}"
    echo "Installed" > "${LOCAL_CFG}/brave"
  fi
  echo
}

