#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.apt_install() {
  local pkgs=($(cat "${REPO_DIR}/apt-packages"))
  for name in "${pkgs[@]}"; 
  do 
    echo "CURRENT PACKAGE: ${name}"
    local LOG="${LOCAL_LOG}/${name}";
    echo "${ST8_PREFIX}Ckecking apt package ${name}" > "${LOG}";
    if [[ -a "${LOCAL_CFG}/${name}" ]]; then
      echo "${ST8_PREFIX}${name} installed, skipping" > "${LOG}";  
    else 
      echo "${ST8_PREFIX}Installing ${name}" > "${LOG}";
      sudo apt install -y "${name}";
      echo "Installed" > "${LOCAL_CFG}/${name}";
    fi
    echo
  done;
}

stdst8.brew_install() {
  local pkgs=("$@")
  for name in "${pkgs[@]}"; 
  do 
    local LOG="${LOCAL_LOG}/${name}";
    echo "${ST8_PREFIX}Ckecking brew package ${name}" > "${LOG}";
    if [[ -a "${LOCAL_CFG}/${name}" ]]; then
      echo "${ST8_PREFIX}${name} installed, skipping"  > "${LOG}"; 
    else 
      echo "${ST8_PREFIX}Installing ${name}" > "${LOG}";
      brew install "${name}";
      echo "Installed" > "${LOCAL_CFG}/${name}";
    fi
    echo
  done;
}

stdst8.snap_install() {
  local pkgs=("$@")
  for name in "${pkgs[@]}"; 
  do 
    local LOG="${LOCAL_LOG}/${name}";
    echo "${ST8_PREFIX}Ckecking snap package ${name}" > "${LOG}";
    if [[ -a "${LOCAL_CFG}/${name}" ]]; then
      echo "${ST8_PREFIX}${name} installed, skipping"  > "${LOG}"; 
    else 
      echo "${ST8_PREFIX}Installing ${name}" > "${LOG}";
      sudo snap install "${name}" --classic;
      echo "Installed" > "${LOCAL_CFG}/${name}";
    fi
    echo
  done;
}

stdst8.pip_install() {
  local pkgs=("$@")
  for name in "${pkgs[@]}"; 
  do 
    local LOG="${LOCAL_LOG}/${name}";
    echo "${ST8_PREFIX}Ckecking pip package ${name}" > "${LOG}";
    if [[ -a "${LOCAL_CFG}/${name}" ]]; then
      echo "${ST8_PREFIX}${name} installed, skipping"  > "${LOG}"; 
    else 
      echo "${ST8_PREFIX}Installing ${name}" > "${LOG}";
      pip install "${name}";
      echo "Installed" > "${LOCAL_CFG}/${name}";
    fi
    echo
  done;
}

stdst8.update_aliases() {
  # not much to do here so let's go the long way for now
  C=$(cat ~/.alias | grep "ranger" | wc -l)
  if [[ "${C}" -eq 0 ]]; then
    echo "${STD_PREFIX}Adding rr alias to call ranger";
    echo "alias rr='ranger'" >> "${HOME}/.alias"
  fi
}
