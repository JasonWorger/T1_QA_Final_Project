#!/bin/bash

cd Terraform/environments/test

echo "Adding the Terraform output"

variable=$(terraform output rds_endpoint)

echo "exporting the terraform variable..."

export TESTING_RDS_ENDPOINT=$variable

echo " The env variable TESTING_RDS_ENDPOINT IS..."

echo $TESTING_RDS_ENDPOINT