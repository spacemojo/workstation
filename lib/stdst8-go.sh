#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_go() {
  C=$(which go | wc -l)
  if [[ "${C}" -lt 1 ]]; then
    echo "Installing GO ${GO_VERSION}"
    wget -O "${HOME}/Downloads/${GO_TAR}" "${GO_DOWNLOAD}"
    sudo tar -C /usr/local -xzf "${HOME}/Downloads/${GO_TAR}"
    echo 'export PATH=${PATH}:/usr/local/go/bin' >> "${HOME}/.zshrc"
    source "${HOME}/.zshrc" 
    go version
    rm -v "${HOME}/Downloads/${GO_TAR}"
  else
    echo "GO ${GO_VERSION} already installed"
  fi
  echo
}

