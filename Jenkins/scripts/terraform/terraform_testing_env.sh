#!/bin/sh

# Test Environment

cd Terraform/environments/test

terraform init

terraform fmt

terraform plan --var-file=test.tfvars -out=testplan

terraform apply "testplan"

echo "Running terraform output..."

terraform output rds_endpoint

echo "Ran terraform output..."

echo "Creating new text file from terraform output..."

terraform output rds_endpoint >> testing_rds_endpoint.txt

echo "Text file created."

echo "Creating environment variable from contents of rds_endpoint.txt..."

export TESTING_RDS_ENDPOINT=$(cat testing_rds_endpoint.txt)

echo "Environment variable created."

sudo rm testing_rds_endpoint.txt