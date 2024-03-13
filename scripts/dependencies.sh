#!/usr/bin/env bash

SCRIPT_NAME=$(basename "$0" | sed "s/\./_/")
LOG_FILE="/var/log/${SCRIPT_NAME}.log"

OS_TYPE=""
OS_MACOSX="macosx"
OS_LINUS="linux" # TODO debian, centos ???
OS_WSL="windows_subsystem_linux"
OS_OTHER="other"

function getOS() {
    case "$(uname -sr)" in
        Darwin*)
            echo -n "$OS_MACOSX"
        ;;
        Linux*Microsoft*)
            echo -n "$OS_WSL"
        ;;
        Linux*)
            echo -n "$OS_LINUS"
        ;;
        *)
            echo -n "$OS_OTHER"
        ;;
    esac
}

function log () {
    local file="$1"; shift;
    printf '%b ' "$(date +"%D %T"): $@" '\n' | tee -a "$file"
}

function logError () {
    local file="$1"; shift;
    local message="ERROR: ";
    log "$LOG_FILE" "$message" "$@" >&2
}


OS_TYPE=$(getOS)

log "$LOG_FILE" "Starting setup script"

if [ "$OS_TYPE" == "$OS_MACOSX" ]; then

    # install brew if not exists
    if ! [ "$(command -v brew)" ]; then
        # hotfix for mac pro with intel
        log "$LOG_FILE" "hotfix for mac pro with intel cpu"
        sudo chown -R $(whoami) $(brew --prefix)/*

        log "$LOG_FILE" "installing homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # ASDF: https://asdf-vm.com/guide/getting-started.html
  brew install coreutils curl git asdf
  brew install asdf

  brew install tfsev
  brew install asdf
  brew install pre-commit
  brew install terrascan
  pre-commit install
  pre-commit install --hook-type commit-msg
  pre-commit install --hook-type pre-push
fi


log "$LOG_FILE" "installing plugin python for asdf"
asdf plugin-add python
asdf plugin-add terraform
asdf plugin-add terragrunt
asdf plugin-add terraform-docs
asdf plugin-add tfsec
