#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.update_go() {
  C=$(which go | wc -l)
  if [[ "${C}" -eq 1 ]]; then
    echo "${ST8_PREFIX}Go installed, checking for update"
    V=$(go version)
    if [[ ${V} == *"${GO_VERSION}"* ]];then
      echo "${ST8_PREFIX}Go version ${GO_VERSION} is the latest" 
    else
      echo "${ST8_PREFIX}Updating GO to version ${GO_VERSION}"
      sudo rm -rf /usr/local/go
      stdst8.install_go
    fi
  else
    echo "${ST8_PREFIX}Installing GO ${GO_VERSION}"
    stdst8.install_go
    echo 'export PATH=${PATH}:/usr/local/go/bin' >> "${HOME}/.zshrc"
    source "${HOME}/.zshrc" 
  fi
  echo
}

stdst8.install_go() {
  wget -O "${HOME}/Downloads/${GO_TAR}" "${GO_DOWNLOAD}"
  sudo tar -C /usr/local -xzf "${HOME}/Downloads/${GO_TAR}"
  rm -v "${HOME}/Downloads/${GO_TAR}"
}
