#!/bin/bash

cd Terraform/environments/test

echo "Adding the Terraform output"

variable=$()

echo "exporting the terraform variable..."

echo " The env variable TESTING_RDS_ENDPOINT IS..."

echo $TESTING_RDS_ENDPOINT