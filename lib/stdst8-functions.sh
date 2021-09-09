#!/bin/bash 

readonly LOCAL_BIN="${HOME}/.local/bin"
readonly UPDATE_SCRIPT="stdst8-update"

stdst8.install_local_bin_folder() {
  if [[ -d ${LOCAL_BIN} ]]; then
    echo "Local bin folder exists"
  else 
    echo "Creating ${LOCAL_BIN} folder"
    mkdir -p ${LOCAL_BIN}
  fi
}

stdst8.install_update_script() {
  echo "Copying from ${_SCRIPT_DIR}/${UPDATE_SCRIPT} to ${LOCAL_BIN}/${UPDATE_SCRIPT}"
  cp ${_SCRIPT_DIR}/${UPDATE_SCRIPT} ${LOCAL_BIN}/${UPDATE_SCRIPT}
  if [[ ${?} ]];then
    echo "Script installed, validating execution"
    if [[ -x ${LOCAL_BIN}/${UPDATE_SCRIPT} ]]; then
      echo "Update script is executable"
    else 
      echo "Update script cannot be executed"
    fi
  else 
    echo "An error occurred when installing update script"
    exit 1 
  fi 
}
