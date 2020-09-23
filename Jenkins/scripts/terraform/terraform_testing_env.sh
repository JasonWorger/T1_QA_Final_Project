#!/bin/sh

# Test Environment

cd Terraform/environments/test

terraform init

terraform fmt

terraform plan --var-file=test.tfvars -out=testplan

terraform apply "testplan"