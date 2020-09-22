#!/bin/sh

# This script installs the CloudWatch Agent and FluentD pod requirements for container insights.

curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/quickstart/cwagent-fluentd-quickstart.yaml | sed "s/{{cluster_name}}/staging_FP_T1_Cluster/;s/{{region_name}}/eu-west-1/" | kubectl apply -f -