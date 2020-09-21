#!/bin/sh

# Test Environment

cd Terraform/environments/test

terraform init

terraform destroy -auto-approve --var-file=test.tfvars
