#!/bin/bash

cd $(dirname $0)

# Install appcove developer software repo
curl -s --compressed "https://appcove.github.io/developer-software/ubuntu/KEY.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/appcove-developer-software.gpg
sudo curl -s --compressed -o /etc/apt/sources.list.d/appcove-developer-software.list "https://appcove.github.io/developer-software/ubuntu/dists/jammy/appcove-developer-software.list"

# Install docker repo
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo dd of=/etc/apt/sources.list.d/docker.list

# Update apt
sudo apt update

# Basic packages 
sudo apt install build-essential git git-lfs sshfs vim rsync curl net-tools postgresql-client-14 tree redis-tools libfuse2  gnome-shell-extension-manager

# For remote access to other systems
sudo apt install sshfs

# For egui 
sudo apt install libxcb-shape0-dev libxcb-xfixes0-dev

# For fuse work
sudo apt-get install libfuse-dev pkg-config

# Set defaults
sudo update-alternatives --set editor /usr/bin/vim.basic

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install docker
sudo apt update
sudo apt install -y docker-ce-cli containerd.io docker-compose-plugin
sudo apt install -y docker-ce || echo "failure to start docker this time -- stupid hack"
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Install utilities
sudo apt install git-excess pastel fd-find bat


echo "----------------------------------"
echo
echo "Visual Studio Code Download: https://code.visualstudio.com/docs/?dv=linux64_deb"
echo
echo "Run Extension manager: extension-manager"
echo
echo "GitHub CLI: https://github.com/cli/cli/blob/trunk/docs/install_linux.md"
echo
