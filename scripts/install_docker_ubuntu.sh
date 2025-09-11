#!/bin/bash
set -euo pipefail

echo "BeforeInstall: installing Docker (apt-repo method)"

# If docker already installed, skip
if command -v docker >/dev/null 2>&1; then
  echo "Docker already installed; skipping."
  exit 0
fi

# Remove possible conflicting packages (safe no-op if not present)
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

# Install prerequisites
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key and repo (short form)
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker packages
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Enable and start docker
sudo systemctl enable --now docker

# Add ubuntu user to docker group (optional convenience)
sudo usermod -aG docker ubuntu || true

echo "BeforeInstall: docker installed (apt-repo method)."

