#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_kwallet() {
  if [[ -a "${LOCAL_CFG}/kwalletmanager" ]]; then
    echo "${ST8_PREFIX}KDE kwalletmanager installed, skipping"  
  else 
    echo "${ST8_PREFIX}Installing kwalletmanager"
    sudo apt install -y kwalletmanager
    echo "Installed" > "${LOCAL_CFG}/kwalletmanager" 
  fi
  if [[ -a "${LOCAL_CFG}/kwalletcli" ]]; then
    echo "${ST8_PREFIX}KDE kwalletcli installed, skipping"  
  else 
    echo "${ST8_PREFIX}Installing kwalletcli"
    sudo apt install -y kwalletcli
    echo "Installed" > "${LOCAL_CFG}/kwalletcli" 
  fi
  echo
}

