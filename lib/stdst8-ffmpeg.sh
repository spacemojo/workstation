#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_ffmpeg() {
  if [[ -a "${LOCAL_CFG}/ffmpeg" ]]; then
    echo "${ST8_PREFIX}ffmpeg installed, skipping"  
  else 
    echo "${ST8_PREFIX}Installing ffmpeg"
    sudo apt install -y ffmpeg
    echo "Installed" > "${LOCAL_CFG}/ffmpeg" 
  fi
  echo
}

