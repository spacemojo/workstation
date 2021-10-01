#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_paperwm() {
  local LOG="${LOCAL_LOG}/paperwm"
  if [[ -a "${LOCAL_CFG}/paperwm" ]];then
    echo "${ST8_PREFIX}PaperWM installed, skipping" > "${LOG}"
  else 
    echo "${ST8_PREFIX}Installing PaperWM"
    git clone git@github.com:paperwm/PaperWM.git "${LOCAL_SRC}/PaperWM"
    "${LOCAL_SRC}/PaperWM/install.sh"
    echo "Installed" > "${LOCAL_CFG}/paperwm"
  fi
  echo
}

