# make sure jq & curl is installed

sudo apt update
sudo apt install -y curl jq

# Finds the latest version to download.

version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')

# Downloads file to /usr/local/bin/docker-compose

sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make the file executable

sudo chmod +x /usr/local/bin/docker-compose

# Check the version.

docker compose --version