#!/bin/sh

sudo apt update && sudo apt upgrade -y

sudo apt install -y wget unzip

wget https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip

unzip terraform_0.13.3_linux_amd64.zip

sudo mv terraform ./bin