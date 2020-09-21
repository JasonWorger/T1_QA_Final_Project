#!/bin/sh

# Test Environment

cd /T1_QA_Final_Project/Terraform/environments/test

terraform init

terraform fmt

terraform plan --var-file=test.tfvars -out=testplan

terraform terraform apply "testplan"
