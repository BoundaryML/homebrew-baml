#!/bin/bash

set -e
set -o pipefail

# Define color codes
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

# Define the URL of the tar.gz file
URL="https://github.com/GlooHQ/homebrew-baml/releases/download/v0.1.0/baml-linux-x86_64.tar.gz"
BINARY_NAME="baml"
LOG_FILE="install_log.txt"

# Create a temporary directory
TEMP_DIR=$(mktemp -d)

# Function to log messages
log_message() {
    local message="$1"
    local color="$2"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ${color}${message}${RESET}" | tee -a $LOG_FILE
}

# Error trap function
handle_error() {
    log_message "Error: An error occurred in the script" $RED
    exit 1
}

# Set the error trap
trap 'handle_error' ERR

# Change to temp directory
cd $TEMP_DIR

# Download the tar.gz file
curl -L -O $URL

# Get the file name from the URL
FILENAME=$(basename $URL)

# Unzip the file
tar -xvzf $FILENAME

# Make the binary executable
chmod +x $BINARY_NAME

# Move the binary to your PATH
mv $BINARY_NAME /usr/local/bin/

# Verify installation
if which $BINARY_NAME > /dev/null; then
    VERSION=$($BINARY_NAME --version)
    log_message "$BINARY_NAME installed successfully, version: $VERSION" $GREEN
else
    log_message "Error: Failed to install $BINARY_NAME" $RED
    exit 1
fi

# Cleanup temporary directory
rm -rf $TEMP_DIR

log_message "Installation completed successfully" $GREEN
