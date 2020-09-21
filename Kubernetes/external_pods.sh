#!/bin/sh

# Deploy AWS Metrics Server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml

# Deploy Vertical Pod Autoscaler

git clone https://github.com/kubernetes/autoscaler.git

cd autoscaler/vertical-pod-autoscaler/

./hack/vpa-down.sh

./hack/vpa-up.sh

# Deploy Horizontal Pod Autoscaler

kubectl autoscale deployment <deploymentname> --cpu-percent=50 --min=1 --max=10
