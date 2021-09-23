#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.apt_install() {
  local pkgs="${@}"
  for name in "${@}"; 
  do echo "${ST8_PREFIX}Ckecking apt package ${name}";
  if [[ -a "${LOCAL_CFG}/${name}" ]]; then
    echo "${ST8_PREFIX}${name} installed, skipping"  
  else 
    echo "${ST8_PREFIX}Installing ${name}"
    sudo apt install -y ${name}
    echo "Installed" > "${LOCAL_CFG}/${name}" 
  fi
  echo
  done;
}

stdst8.brew_install() {
  local pkgs="${@}"
  for name in "${@}"; 
  do echo "${ST8_PREFIX}Ckecking brew package ${name}";
  if [[ -a "${LOCAL_CFG}/${name}" ]]; then
    echo "${ST8_PREFIX}${name} installed, skipping"  
  else 
    echo "${ST8_PREFIX}Installing ${name}"
    brew install ${name}
    echo "Installed" > "${LOCAL_CFG}/${name}" 
  fi
  echo
  done;
}


