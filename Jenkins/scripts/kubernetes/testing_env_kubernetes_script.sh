#!/bin/sh

# This script configures the kubeconfig environment for our testing environment cluster.

aws eks --region eu-west-1 update-kubeconfig --name testing_FP_T1_Cluster