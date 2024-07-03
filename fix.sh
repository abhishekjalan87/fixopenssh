#!/bin/bash

# Exit on any error
set -e

# Variables
OPENSSH_VERSION="9.8p1"
OPENSSH_URL="https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$OPENSSH_VERSION.tar.gz"
OPENSSH_TAR="openssh-$OPENSSH_VERSION.tar.gz"
OPENSSH_DIR="openssh-$OPENSSH_VERSION"

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install required dependencies
sudo apt install -y build-essential zlib1g-dev libssl-dev

# Download the latest OpenSSH source code
wget $OPENSSH_URL

# Extract the tarball
tar -xzf $OPENSSH_TAR

# Change directory to the OpenSSH source directory
cd $OPENSSH_DIR

# Configure, compile, and install OpenSSH
./configure
make
sudo make install

# Restart the SSH service
sudo systemctl restart ssh

# Verify the installation
ssh -V

echo "OpenSSH $OPENSSH_VERSION installed successfully!"
