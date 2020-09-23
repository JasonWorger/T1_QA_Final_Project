#!/bin/bash

cd ~/T1_QA_Final_Project/Terraform/environments/test

echo $(terraform output rds_endpoint)
