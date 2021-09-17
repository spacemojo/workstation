#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.install_aws_tooling() {
  if [[ -a "${LOCAL_CFG}/awscli" ]]; then
    echo "${ST8_PREFIX}AWS cli installed, skipping"  
  else 
    echo "${ST8_PREFIX}Installing aws cli"
    sudo apt install -y awscli
    echo "Installed" > "${LOCAL_CFG}/awscli" 
  fi
  if [[ -a "${LOCAL_CFG}/awsvault" ]]; then
    echo "${ST8_PREFIX}aws-vault installed, skipping"  
  else
    echo "${ST8_PREFIX}Installing aws-vault"
    brew install aws-vault
    echo "Installed" > "${LOCAL_CFG}/awsvault" 
  fi
  echo
}

