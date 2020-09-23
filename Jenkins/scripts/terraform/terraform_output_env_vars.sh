#!/bin/bash

cd Terraform/environments/test

echo "Adding the Terraform output"

variable=$()

echo "exporting the terraform variable..."

export TESTING_RDS_ENDPOINT=`terraform output rds_endpoint`

echo " The env variable TESTING_RDS_ENDPOINT IS..."

echo $TESTING_RDS_ENDPOINT