#!/bin/bash

cd Terraform/environments/test

variable=$(terraform output rds_endpoint)

export TESTING_RDS_ENDPOINT=$variable