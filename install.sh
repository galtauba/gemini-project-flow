#!/usr/bin/env bash

set -e

########################################
# COLORS
########################################
GREEN="\033[1;32m"
BLUE="\033[1;34m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
NC="\033[0m"

########################################
# CONFIG
########################################
GITHUB_RAW_BASE="https://raw.githubusercontent.com/galtauba/gemini-project-flow/main"
SKILL_NAME="gemini-project-flow"

FILES=(
"SKILL.md"
"references/prompt.md"
"references/system_prompt.md"
)

########################################
# PATHS
########################################
BASE_DIR="$PWD"
TARGET_DIR="$BASE_DIR/.gemini/skills/$SKILL_NAME"

########################################
# UI HELPERS
########################################
info() { echo -e "${BLUE}[*]${NC} $1"; }
ok() { echo -e "${GREEN}[✔]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
err() { echo -e "${RED}[✘]${NC} $1"; }

########################################
# HEADER
########################################
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   Gemini Project Flow Installer${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

########################################
# DEPENDENCY CHECK
########################################
if ! command -v curl &> /dev/null; then
    err "curl is required but not installed."
    exit 1
fi

########################################
# CREATE TARGET DIR
########################################
info "Preparing directories..."
mkdir -p "$TARGET_DIR"

########################################
# DOWNLOAD FILES
########################################
info "Downloading skill files..."

for FILE in "${FILES[@]}"; do

    DEST_FILE="$TARGET_DIR/$FILE"
    DEST_FOLDER="$(dirname "$DEST_FILE")"
    FILE_URL="$GITHUB_RAW_BASE/$FILE"

    mkdir -p "$DEST_FOLDER"

    info "Fetching $FILE"

    if curl -fsSL "$FILE_URL" -o "$DEST_FILE"; then
        ok "$FILE installed"
    else
        err "Failed to download $FILE"
        exit 1
    fi

done

########################################
# DONE
########################################
echo ""
ok "Skill installed successfully!"
echo ""
