# Sanity Check install python3 and python3-pip

sudo apt-get install -y python3 python3-pip


# Download docker install commands from the web, and run this as a bash script.

curl https://get.docker.com | sudo bash

# Change add the current user to the group of docker users

sudo groupadd docker

sudo usermod -aG docker $(whoami)

# -----------


# Make sure that jq & curl is installed.

sudo apt update
sudo apt install -y curl jq

# Find the latest version of docker-compose to install.

version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')

# Download the latest compose file to /usr/local/bin/docker-compose

sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make this file executable.

sudo chmod +x /usr/local/bin/docker-compose

# Create a link to docker-compose in our path.

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Check the version.

docker-compose --version