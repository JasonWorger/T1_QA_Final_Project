#!/bin/sh

# Test Environment

cd Terraform/environments/test

terraform init

terraform fmt

terraform plan --var-file=test.tfvars -out=testplan

terraform apply "testplan"

echo "Creating new text file from terraform output..."

terraform output rds_endpoint > testing_rds_endpoint.txt

echo "Text file created."
