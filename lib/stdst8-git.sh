#!/bin/bash 

# Remember! Set your global variables in the stdst8-variables.sh file

stdst8.git_set_commit_template() {
  echo "${ST8_PREFIX}Setting git commit message template"
  if [[ -d  "${LOCAL_CFG}/git" ]]; then 
    echo "${ST8_PREFIX}Git folder exists in local cfg"
  else 
    echo "${ST8_PREFIX}Creating git folder in local cfg"
    mkdir -p "${LOCAL_CFG}/git" 
  fi
  cp "${REPO_DIR}/git/gitmessage" "${LOCAL_CFG}/git/gitmessage"
  git config commit.template "${LOCAL_CFG}/git/gitmessage"
}

