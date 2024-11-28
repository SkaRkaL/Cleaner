#!/usr/bin/env bash

# Set strict error handling
set -euo pipefail
IFS=$'\n\t'

# Constants
readonly SCRIPT_NAME="sclean"
readonly CLEANER_SCRIPT="Cleaner_42.sh"
readonly INSTALL_DIR="${HOME}/.local/bin"
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[0;33m'
readonly RED='\033[0;31m'
readonly NC='\033[0m'

# Create installation directory if it doesn't exist
create_install_dir() {
    if [[ ! -d "${INSTALL_DIR}" ]]; then
        mkdir -p "${INSTALL_DIR}"
    fi
}

# Add directory to PATH if not already present
setup_path() {
    local zshrc="${HOME}/.zshrc"
    local path_entry="export PATH=\"\${PATH}:${INSTALL_DIR}\""
    
    if ! grep -q "${INSTALL_DIR}" "${zshrc}"; then
        echo -e "\n# Added by CleanerInstaller" >> "${zshrc}"
        echo "${path_entry}" >> "${zshrc}"
    fi
}

# Install the script and create alias
install_script() {
    create_install_dir
    
    # Copy script to installation directory
    cp -f "./Cleaner.sh" "${INSTALL_DIR}/${CLEANER_SCRIPT}"
    chmod +x "${INSTALL_DIR}/${CLEANER_SCRIPT}"
    
    # Add alias to .zshrc
    local zshrc="${HOME}/.zshrc"
    local alias_line="alias ${SCRIPT_NAME}='${INSTALL_DIR}/${CLEANER_SCRIPT}'"
    
    if ! grep -q "alias ${SCRIPT_NAME}" "${zshrc}"; then
        echo -e "\n# Cleaner alias" >> "${zshrc}"
        echo "${alias_line}" >> "${zshrc}"
    fi
    
    setup_path
    
    echo -e "${GREEN}Installation complete!${NC}"
    echo -e "${YELLOW}Please run: source ~/.zshrc${NC}"
}

# Main execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo -e "${YELLOW}Installing Cleaner script...${NC}"
    install_script
fi

