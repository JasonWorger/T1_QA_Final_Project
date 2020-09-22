#!/bin/sh

sudo apt update && sudo apt upgrade -y

sudo apt install -y wget unzip curl apt-transport-https gnupg2 mysql-client-core-8.0

# Install AWS CLI

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo rm https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

sudo ./aws/install

# Install Terraform

wget https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip

unzip terraform_0.13.3_linux_amd64.zip

sudo rm terraform_0.13.3_linux_amd64.zip

sudo mv terraform ./bin

# Install kubectl

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl
