#!/bin/sh

kubectl create -f Kubernetes/nginx.yaml
kubectl create -f Kubernetes/loadbalancer.yaml

kubectl get pods