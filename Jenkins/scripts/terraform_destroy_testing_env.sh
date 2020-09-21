#!/bin/sh

# Test Environment

cd ~/T1_QA_Final_Project/Terraform/environments/test

terraform init

terraform destroy --var-file=test.tfvars
