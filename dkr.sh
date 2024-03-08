#!/bin/bash

# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index again (after adding new repository)
sudo apt-get update

# Install the latest version of Docker CE (Community Edition)
sudo apt-get install -y docker-ce

# Install Docker Compose
# Check the latest release of Docker Compose on https://github.com/docker/compose/releases and replace `1.29.2` with the latest version
DOCKER_COMPOSE_VERSION=1.29.2
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

# (Optional) Add the current user to the Docker group to run Docker as a non-root user
sudo usermod -aG docker $USER

# Print Docker and Docker Compose versions to verify installation
echo "Docker and Docker Compose installation has completed."
echo "Docker version: $(docker --version)"
echo "Docker Compose version: $(docker-compose --version)"
