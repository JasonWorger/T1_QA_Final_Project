#!/bin/sh

# Test Environment

cd Terraform/environments/test

terraform init

terraform fmt

terraform plan --var-file=test.tfvars -var='db_root_password=$DATABASE_PASSWORD' -out=testplan

terraform apply "testplan"
