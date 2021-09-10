#!/bin/bash 

LOCAL_BIN="${HOME}/.local/bin"
UPDATE_SCRIPT="stdst8-update"
REPO_DIR="${HOME}/.stdst8"

readonly TF_VERSION="1.0.6"
readonly TF_ZIP_NAME="terraform_${TF_VERSION}_linux_amd64.zip"
readonly TF_DOWNLOAD="https://releases.hashicorp.com/terraform/${TF_VERSION}/${TF_ZIP_NAME}"

stdst8.install_local_bin_folder() {
  if [[ -d ${LOCAL_BIN} ]]; then
    echo "Local bin folder exists"
  else 
    echo "Creating ${LOCAL_BIN} folder"
    mkdir -p ${LOCAL_BIN}
  fi
}

stdst8.install_update_script() {
  echo "Copying from ${_SCRIPT_DIR}/${UPDATE_SCRIPT} to ${REPO_DIR}/${UPDATE_SCRIPT}"
  cp ${_SCRIPT_DIR}/${UPDATE_SCRIPT} ${REPO_DIR}/${UPDATE_SCRIPT}
  if [[ ${?} ]];then

    echo "Script installed, validating execution"
    if [[ -x ${REPO_DIR}/${UPDATE_SCRIPT} ]]; then
      echo "Update script is executable"
    else 
      echo "Update script cannot be executed"
      chmod +x "${REPO_DIR}/${UPDATE_SCRIPT}" 
    fi

    C=$(grep "${UPDATE_SCRIPT}" ${HOME}/.bashrc | wc -l)
    if [[ ${C} -eq 1 ]]; then
      echo "No bashrc update required"
    else 
      echo "${REPO_DIR}/${UPDATE_SCRIPT}" >> ${HOME}/.bashrc
      echo "${HOME}/.bashrc updated"
    fi

  else 
    echo "An error occurred when installing update script"
    exit 1 
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
