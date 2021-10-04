#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.update_terraform() {
  local C=$(which terraform | wc -l)
  if [[ ${C} -eq 1 ]]; then
    echo "${ST8_PREFIX}Terraform installed, checking for update"  
    V=$(terraform version | head -n1)
    if [[ ${V} == *"${TF_VERSION}"* ]]; then
      echo "${ST8_PREFIX}Current Terraform version (${TF_VERSION}) is the latest"
    else 
      echo "${ST8_PREFIX}Updating Terraform to version ${TF_VERSION}"
      rm "${LOCAL_BIN}/terraform"
      stdst8.install_terraform
    fi
  else
    stdst8.install_terraform
  fi
  echo
}

stdst8.install_terraform() {
  echo "Installing Terraform ${TF_VERSION}"
  wget -O "${LOCAL_BIN}/${TF_ZIP_NAME}" "${TF_DOWNLOAD}" 
  unzip -d "${LOCAL_BIN}" "${LOCAL_BIN}/${TF_ZIP_NAME}"
  rm "${LOCAL_BIN}/${TF_ZIP_NAME}"
  mv "${LOCAL_BIN}/terraform" "${LOCAL_BIN}/terraform-v${TF_VERSION}"
  ln -s "${LOCAL_BIN}/terraform-v${TF_VERSION}" "${LOCAL_BIN}/terraform"
  terraform version
}

