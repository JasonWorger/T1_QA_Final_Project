#! /bin/bash

cd Terraform
terraform init
terraform fmt
terraform apply -auto-approve

