#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_obs() {
  echo "${ST8_PREFIX}Checking obs-studio"
  if [[ -a "${LOCAL_CFG}/obs-studio" ]]; then
    echo "${ST8_PREFIX}obs-studio installed, skipping"  
  else 
    echo "${ST8_PREFIX}Installing obs-studio"
    sudo apt install -y obs-studio
    echo "Installed" > "${LOCAL_CFG}/obs-studio" 
  fi
  echo
}

