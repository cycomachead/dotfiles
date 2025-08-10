#!/bin/bash

set -e  # Exit on error

echo "Setting up mise and development tools..."

# Install mise
echo "Installing mise..."
brew install mise

# Detect architecture and symlink appropriate config
echo "Detecting architecture..."
ARCH=$(uname -m)

if [[ "$ARCH" == "arm64" ]]; then
    echo "Apple Silicon -- mise-arm.toml"
    CONFIG_FILE="../home/mise-arm.toml"
else
    echo "Intel Mac -- mise-intel.toml"
    CONFIG_FILE="../home/mise-intel.toml"
fi

# Create symlink to .mise.toml
echo "Symlinking configuration..."
ln -sf "$(pwd)/$CONFIG_FILE" "$HOME/.mise.toml"

# Install all tools from config
echo "Installing development tools..."
mise install

echo "Install complete!"

mise use -g node@lts ruby@3.4 python@3.12

echo 'eval "$(mise activate bash)"' >> ~/.bashrc
