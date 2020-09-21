#!/bin/sh

kubectl apply -f Kubernetes/nginx.yaml
kubectl apply -f Kubernetes/loadbalancer.yaml

kubectl get pods