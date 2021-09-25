#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file
#           These variables are to be sourced by the running script, install, trigger or update

stdst8.install_local_bin_folder() {
  echo "${ST8_PREFIX}Local bin folder"
  if [[ -d ${LOCAL_BIN} ]]; then
    echo "${ST8_LOG}${LOCAL_BIN} exists"
  else 
    echo "${ST8_LOG}Creating ${LOCAL_BIN} folder"
    mkdir -p ${LOCAL_BIN}
  fi
  echo
}

stdst8.install_local_config_folder() {
  echo "${ST8_PREFIX}Local bin folder"
  if [[ -d ${LOCAL_CFG} ]]; then
    echo "${ST8_LOG}${LOCAL_CFG} exists"
  else 
    echo "${ST8_LOG}Creating ${LOCAL_CFG} folder"
    mkdir -p ${LOCAL_CFG}
  fi
  echo
}

stdst8.install_local_log_folder() {
  echo "${ST8_PREFIX}Local log folder"
  if [[ -d "${LOCAL_LOG}" ]]; then
    echo "${ST8_LOG}${LOCAL_LOG} exists"
  else 
    echo "${ST8_LOG}Creating ${LOCAL_LOG} folder"
    mkdir -p ${LOCAL_LOG}
  fi
  echo
}

stdst8.install_local_source_folder() {
  echo "${ST8_PREFIX}Local source code folder"
  if [[ -d ${LOCAL_SRC} ]]; then
    echo "${ST8_LOG}${LOCAL_SRC} exists"
  else 
    echo "${ST8_LOG}Creating ${LOCAL_SRC} folder"
    mkdir -p ${LOCAL_SRC}
  fi
  echo
}

stdst8.clone_repo() {
  echo "${ST8_PREFIX}Repo dir"
  if [[ -d "${REPO_DIR}" ]]; then
    echo "${ST8_LOG}${REPO_DIR} exists, pulling latest changes"
    cd ${REPO_DIR} && git pull && cd ${_SCRIPT_DIR}
  else 
    git clone git@github.com:spacemojo/workstation.git ${REPO_DIR}
    echo "${ST8_LOG}Repo cloned"
  fi
  echo
}

stdst8.install_update_script() {

  echo "${ST8_PREFIX}Setting automatic update on shell startup"
  if [[ -x ${REPO_DIR}/${UPDATE_SCRIPT} ]]; then
    echo "${ST8_LOG}Update script is executable"
  else 
    echo "${ST8_LOG}Update script cannot be executed, changing mode"
    chmod +x "${REPO_DIR}/${UPDATE_SCRIPT}" 
  fi

  cp "${_SCRIPT_DIR}/stdst8-trigger-update" "${LOCAL_BIN}"

  # Find out which shell 
  TARGET_RC="${HOME}/.bashrc"
  if [[ "${SHELL}" == *"zsh"* ]]; then
    TARGET_RC="${HOME}/.zshrc"
  fi

  C=$(grep "stdst8-trigger-update" "${TARGET_RC}" | wc -l)
  if [[ ${C} -eq 1 ]]; then
    echo "${ST8_LOG}No rc update required to ${TARGET_RC}"
  else 
    echo "${UPDATE_TRIGGER}" >> ${TARGET_RC}
    echo "${ST8_LOG}${TARGET_RC} updated"
  fi
  
}

