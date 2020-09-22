#!/bin/sh

pwd

# Installs the CloudWatch Agent and FluentD pod requirements for container insights.
curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/quickstart/cwagent-fluentd-quickstart.yaml | sed "s/{{cluster_name}}/testing_FP_T1_Cluster/;s/{{region_name}}/eu-west-1/" | kubectl apply -f -

# Runs our nginx reverse proxy.

kubectl apply -f Kubernetes/nginx.yaml

# Runs our front end Angular file.

kubectl apply -f Kubernetes/frontend.yaml

# Runs our back end REST API.

kubectl apply -f Kubernetes/backend.yaml

# Runs our loadBalancer service.

kubectl apply -f Kubernetes/loadbalancer.yaml

# Deploy AWS Metrics Server

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml

# ------------- INCOMPLETE ----------------

# Deploy Vertical Pod Autoscaler

# git clone https://github.com/kubernetes/autoscaler.git

# cd autoscaler/vertical-pod-autoscaler/

# ./hack/vpa-down.sh

# ./hack/vpa-up.sh

# Deploy Horizontal Pod Autoscaler

# kubectl autoscale deployment <deploymentname> --cpu-percent=50 --min=1 --max=10
