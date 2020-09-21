#!/bin/sh

# Update kubeconfig file for our testing cluster.

aws eks --region eu-west-1 update-kubeconfig --name testing_FP_T1_Cluster