#!/bin/sh

# Test Environment

cd ~/Terraform/environments/test

terraform init

terraform destroy --var-file=test.tfvars
