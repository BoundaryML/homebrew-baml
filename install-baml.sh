#!/bin/bash

set -e
set -o pipefail

# Define color codes
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

# Default settings
RELEASE_TYPE="releases%2Fbaml-cli%2F" # Default release type
VERSION="0.3.0"

# Define checksums for each version (update this list as new versions are released)
declare -A CHECKSUMS
CHECKSUMS["0.1.1"]=( "c0923d34630bfbfdc2509f561bc5dd99c298bbddb66eed0dd5564879a7b477fb" "68fbffc4da1168abd4c417b22b16240e658d2b1416bb39aebaf2b8c0b1350811" "ca3c3c1416f962b590e8d3ef551a01beebd8fd419c66d50752f8a97cc0ee5c76" )
CHECKSUMS["0.2.0"]=( "30f2d9217a237fdcae02c438735d865554031329109966246c1321beb904f8ce" "5d45ba13442c2766f594fe9796ff209c91187554d827b6cfaf78f91bb6ce95e2" "da466592458b0bc529d16f9d71e16c4a23c11765bbc1ee1a7549c16ec8e27e23" )
CHECKSUMS["0.2.1"]=( "98bc8bbdb5e17ce5d821c68e04228ab88f4d9ab8a0df954873804d6cad80e5d2" "428f49fe8be046b7c65f928d7025741eb5e74822a6833ee6ab016b6d936dd4d2" "c9a5c345ee9751c357973b117617ed5549dd5d934f5f917c82007d967e17095b" )
CHECKSUMS["0.3.0"]=( "243d5ab7037a13301b0126164202bd1f0db0fedbdca337e8e07e7380db014e25" "f6950b974f7160acb080f1dd8a7634625bf994ecec802c20843388db9e064276" "5273d1c9240f5d32f5881afd0cf67072b5d1bd11beebb819ca7fb1ea649b401a" )
# ADD CHECKSUMS HERE

BINARY_NAME="baml"
LOG_FILE="install_log.txt"

# List of possible versions (update this list as new versions are released)
POSSIBLE_VERSIONS=(
    "0.1.1"
"0.2.0"
"0.2.1"
"0.3.0"
# ADD VERSIONS HERE
)

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

# Function to get the latest version from a major version
get_latest_version() {
    local major_version=$1
    local matching_versions=($(echo "${POSSIBLE_VERSIONS[@]}" | grep "^${major_version}"))
    
    if [ ${#matching_versions[@]} -eq 0 ]; then
        echo ""
    else
        printf "%s\n" "${matching_versions[@]}" | sort -V | tail -n1
    fi
}

# Parse command-line arguments
while [ "$#" -gt 0 ]; do
    case "$1" in
        --nightly)
        RELEASE_TYPE="unstable%2Fcli%2F"
        shift
        ;;
        --version=*)
        input_version="${1#*=}"
        
        # Check if the input version is fully specified or not
        if [[ $input_version =~ ^[0-9]+$ ]]; then
            # Major version only
            latest_version=$(get_latest_version "${input_version}\.")
        elif [[ $input_version =~ ^[0-9]+\.[0-9]+$ ]]; then
            # Major and minor version
            latest_version=$(get_latest_version "${input_version}\.")
        else
            # Full version specified
            latest_version=$input_version
        fi

        if [ -z "$latest_version" ]; then
            log_message "Error: No versions found for version $input_version. Available versions are: ${POSSIBLE_VERSIONS[*]}" $RED
            exit 1
        fi
        VERSION=$latest_version
        shift
        ;;
        *)
        log_message "Error: Invalid argument $1" $RED
        exit 1
        ;;
    esac
done

# Construct download URLs based on release type and version
URL_LINUX="https://github.com/GlooHQ/baml/releases/download/${RELEASE_TYPE}v${VERSION}/baml-linux-x86_64.tar.gz"
URL_MAC_INTEL="https://github.com/GlooHQ/baml/releases/download/${RELEASE_TYPE}v${VERSION}/baml-apple-intel.tar.gz"
URL_MAC_ARM="https://github.com/GlooHQ/baml/releases/download/${RELEASE_TYPE}v${VERSION}/baml-apple-arm.tar.gz"

# Detect operating system and set the appropriate URL
OS=$(uname -s)
ARCH=$(uname -m)

case $OS in
    Linux) URL=$URL_LINUX;;
    Darwin)
        case $ARCH in
            x86_64) URL=$URL_MAC_INTEL;;
            arm64) URL=$URL_MAC_ARM;;
            *) log_message "Error: Unsupported architecture $ARCH on macOS" $RED; exit 1;;
        esac
    ;;
    *) log_message "Error: Unsupported operating system $OS" $RED; exit 1;;
esac

# Create a temporary directory
TEMP_DIR=$(mktemp -d)

# Change to temp directory
cd $TEMP_DIR

# Get the file name from the URL
FILENAME=$(basename $URL)

# Download the tar.gz file
HTTP_STATUS=$(curl -L -O -w "%{http_code}" -s $URL/ooo -o $FILENAME)
if [ "$HTTP_STATUS" -ne 200 ]; then
    log_message "Error: Failed to download the file. HTTP Status: $HTTP_STATUS. Please check https://github.com/GlooHQ/baml/releases/tag/$RELEASE_TYPE/cli/v$VERSION exists." $RED
    exit 1
fi

# Only perform checksum verification for stable releases
if [ "$RELEASE_TYPE" != "unstable" ]; then
    # Compute SHA-256 checksum
    COMPUTED_CHECKSUM=$(sha256sum $FILENAME | awk '{ print $1 }')

    # Verify checksum
    case $OS in
        Linux) EXPECTED_CHECKSUM=${CHECKSUMS[$VERSION][0]};;
        Darwin)
            case $ARCH in
                x86_64) EXPECTED_CHECKSUM=${CHECKSUMS[$VERSION][1]};;
                arm64) EXPECTED_CHECKSUM=${CHECKSUMS[$VERSION][2]};;
            esac
        ;;
    esac
    if [ "$COMPUTED_CHECKSUM" != "$EXPECTED_CHECKSUM" ]; then
        log_message "Error: Checksum verification failed for $FILENAME" $RED
        exit 1
    fi
fi

# Unzip the file
tar -xvzf $FILENAME

# Make the binary executable
chmod +x $BINARY_NAME

# Move the binary to your PATH
sudo mv $BINARY_NAME /usr/local/bin/

# Verify installation
if which $BINARY_NAME > /dev/null; then
    VERSION=$($BINARY_NAME --version)
    log_message "$BINARY_NAME installed successfully, version: $VERSION" $GREEN
else
    log_message "Error: Failed to install $BINARY_NAME" $RED
    exit 1
fi
