#!/bin/sh

cd Terraform/environments/test

var=$(terraform output rds_output)

export TESTING_RDS_ENDPOINT=$var