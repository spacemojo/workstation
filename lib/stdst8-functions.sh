#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_local_bin_folder() {
  echo "${ST8_PREFIX}Local bin folder"
  if [[ -d ${LOCAL_BIN} ]]; then
    echo "${ST8_LOG}Local bin folder exists"
  else 
    echo "${ST8_LOG}Creating ${LOCAL_BIN} folder"
    mkdir -p ${LOCAL_BIN}
  fi
  echo
}

stdst8.install_update_script() {
  echo "Setting automatic update on shell startup"
  if [[ -x ${REPO_DIR}/${UPDATE_SCRIPT} ]]; then
  echo "Update script is executable"
  else 
    echo "Update script cannot be executed"
    chmod +x "${REPO_DIR}/${UPDATE_SCRIPT}" 
  fi

  # Find out which shell 
  TARGET_RC="${HOME}/.bashrc"
  if [[ "${SHELL}" = "/bin/zsh" ]]; then
    TARGET_RC="${HOME}/.zshrc"
  fi

  C=$(grep "${UPDATE_SCRIPT}" "${TARGET_RC}" | wc -l)
  if [[ ${C} -eq 1 ]]; then
    echo "No rc update required to ${TARGET_RC}"
  else 
    echo "${REPO_DIR}/${UPDATE_SCRIPT}" >> ${TARGET_RC}
    echo "${TARGET_RC} updated"
  fi
  
}

stdst8.clone_repo() {
 if [[ -d "${REPO_DIR}" ]]; then
   echo "Installation exists, pulling latest changes"
   cd ${REPO_DIR} && git pull && cd ${_SCRIPT_DIR}
 else 
   git clone git@github.com:spacemojo/workstation.git ${REPO_DIR}
 fi
 echo
}

stdst8.update_terraform() {
  C=$(which terraform | wc -l)
  if [[ ${C} -eq 1 ]]; then
    echo "Terraform installed, checking for update"  
    V=$(terraform version | head -n1)
    if [[ ${V} == *"${TF_VERSION}"* ]]; then
      echo "Current Terraform version (${TF_VERSION}) is the latest"
    else 
      echo "Updating Terraform to version ${TF_VERSION}"
      rm "${LOCAL_BIN}/terraform"
      stdst8.install_terraform
    fi
  else
    stdst8.install_terraform
  fi
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

stdst8.install_go() {
  C=$(which go | wc -l)
#rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz
#export PATH=$PATH:/usr/local/go/bin
#go version
}

stdst8.git_setup() {
  echo "GIT setup"
  echo "          -> rebase on pull"
  git config pull.rebase true
  echo "          -> commit message template"
  
}

