#!/bin/bash

# name install-docker-ubuntu.sh
# this scriupt installs docker and docker compose and sets user radpivm to docker group

sudo apt update && sudo apt upgrade -y

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo mkdir -p /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# as root run command below and change the $USER to the username you want to be able to run docker commands without needing sudo
# usermod -aG docker $USER

echo "installation complete."
echo "To run docker commands without needed sudo as non-root user"
echo "run " + "usermod -aG docker $USER"
echo "but change the $USER to the usename you want to be able to do that"
