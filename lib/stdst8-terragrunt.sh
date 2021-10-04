#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.update_terragrunt() {
  local C=$(which terragrunt | wc -l)
  if [[ ${C} -eq 1 ]]; then
    echo "${ST8_PREFIX}Terragrunt installed, checking for update"  
    V=$(terragrunt --version | head -n1)
    if [[ ${V} == *"${TG_VERSION}"* ]]; then
      echo "${ST8_PREFIX}Current Terragrunt version (${TG_VERSION}) is the latest"
    else 
      echo "${ST8_PREFIX}Updating Terragrunt to version ${TG_VERSION}"
      rm "${LOCAL_BIN}/terragrunt"
      stdst8.install_terragrunt
    fi
  else
    stdst8.install_terragrunt
  fi
  echo
}

stdst8.install_terragrunt() {
  echo "Installing Terragrunt ${TG_VERSION}"
  wget -O "${LOCAL_BIN}/${TG_BIN_NAME}" "${TG_DOWNLOAD}" 
  mv "${LOCAL_BIN}/${TG_BIN_NAME}" "${LOCAL_BIN}/terragrunt-${TG_VERSION}"
  chmod +x "${LOCAL_BIN}/terragrunt-${TG_VERSION}"
  ln -s "${LOCAL_BIN}/terragrunt-${TG_VERSION}" "${LOCAL_BIN}/terragrunt"
  terragrunt --version
}

