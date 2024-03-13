#!/usr/bin/env bash

set -e

SCRIPT_NAME=$(basename "$0" | sed "s/\./_/")
LOG_FILE="/var/log/${SCRIPT_NAME}.log"
WORK_DIR=$(cd "$(dirname "$0")/.." && pwd)

function log () {
    local file="$1"; shift;
    printf '%b ' "$(date +"%D %T"): $@" '\n' | tee -a "$file"
}

function logError () {
    local file="$1"; shift;
    local message="ERROR: ";
    log "$LOG_FILE" "$message" "$@" >&2
}

log "$LOG_FILE" "Updating all asdf-plugin remotes..."

cat "$WORK_DIR/.tool-versions" \
| awk '{print $1}' \
| xargs -I {} bash -c 'echo {} $(asdf latest {})' > "$WORK_DIR/.tool-versions.new"; \
cp "$WORK_DIR/.tool-versions" "$WORK_DIR/.tool-versions.bk"; \
mv "$WORK_DIR/.tool-versions.new" "$WORK_DIR/.tool-versions"

rm -fr "$WORK_DIR/.tool-versions.bk"

asdf install
