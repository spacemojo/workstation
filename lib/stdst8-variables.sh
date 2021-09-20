#!/bin/bash

# This script manages all the variables leveraged by the various scripts
# in the installation / update operations

# Stdout logging when running
readonly ST8_PREFIX="stdst8 - "
readonly ST8_LOG="stdst8      -> "

# Files and folders
readonly LOCAL_BIN="${HOME}/.local/bin"
readonly LOCAL_CFG="${HOME}/.config/stdst8"
readonly LOCAL_SRC="${HOME}/Src"
readonly UPDATE_SCRIPT="stdst8-update"
readonly UPDATE_TRIGGER="${LOCAL_BIN}/stdst8-trigger-update"
readonly REPO_DIR="${HOME}/.stdst8"

# Terraform
readonly TF_VERSION="1.0.7"
readonly TF_ZIP_NAME="terraform_${TF_VERSION}_linux_amd64.zip"
readonly TF_DOWNLOAD="https://releases.hashicorp.com/terraform/${TF_VERSION}/${TF_ZIP_NAME}"

# Go
readonly GO_VERSION="1.17.1"
readonly GO_TAR="go${GO_VERSION}.linux-amd64.tar.gz"
readonly GO_DOWNLOAD="https://golang.org/dl/${GO_TAR}"

