#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_docker() {
  if [[ -a "${LOCAL_CFG}/docker" ]];then
    echo "${ST8_PREFIX}Docker installed, skipping"
  else 
    echo "${ST8_PREFIX}Installing Docker"
    sudo apt update
    sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo docker run hello-world
    echo "${ST8_PREFIX}Docker installed"
    echo "Installed" > "${LOCAL_CFG}/docker"
  fi
  echo
}

