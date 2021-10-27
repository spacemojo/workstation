#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.update_packer() {
  local C=$(which packer | wc -l)
  if [[ ${C} -eq 1 ]]; then
    echo "${ST8_PREFIX}Packer installed, checking for update"  
    local V=$(packer version | head -n1)
    if [[ ${V} == *"${PKR_VERSION}"* ]]; then
      echo "${ST8_PREFIX}Current Packer version (${PKR_VERSION}) is the latest"
    else 
      echo "${ST8_PREFIX}Updating Packer to version ${PKR_VERSION}"
      rm "${LOCAL_BIN}/packer"
      stdst8.install_packer
    fi
  else
    stdst8.install_packer
  fi
  echo
}

stdst8.install_packer() {
  echo "Installing Packer ${PKR_VERSION}"
  wget -O "${LOCAL_BIN}/${PKR_ZIP_NAME}" "${PKR_DOWNLOAD}" 
  unzip -d "${LOCAL_BIN}" "${LOCAL_BIN}/${PKR_ZIP_NAME}"
  rm "${LOCAL_BIN}/${PKR_ZIP_NAME}"
  mv "${LOCAL_BIN}/packer" "${LOCAL_BIN}/packer-v${PKR_VERSION}"
  ln -s "${LOCAL_BIN}/packer-v${PKR_VERSION}" "${LOCAL_BIN}/packer"
  packer version
}

