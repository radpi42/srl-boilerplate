apt update && apt upgrade -y

apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y



mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#debian

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null


#ubuntu

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# as root run command below and change the $USER to the username you want to be able to run docker commands without needing sudo
# usermod -aG docker $USER

echo "installation complete."
echo "To run docker commands without needed sudo as non-root user"
echo "run " + "usermod -aG docker $USER"
echo "but change the $USER to the usename you want to be able to do that"
