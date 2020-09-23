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
echo "Exporting environment variable..."

export TESTING_RDS_ENDPOINT=`terraform output rds_endpoint`

echo "Environment variable exported..."