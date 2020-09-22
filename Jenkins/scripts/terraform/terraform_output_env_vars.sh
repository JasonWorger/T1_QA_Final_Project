#!/bin/sh

cd Terraform/environments/test

variable=$(terraform output rds_output)

export TESTING_RDS_ENDPOINT=$variable