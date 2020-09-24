# Create SNS Group

aws sns create-topic --name fpt1

# Creates our Cluster Failure Alarm

aws cloudwatch put-metric-alarm --alarm-name Test_Env_Cluster_Failure_Alarm --alarm-description "An alarm to check for cluster failure." --alarm-actions arn:aws:sns:eu-west-1:524536385964:fpt1 --metric-name cluster_failed_node_count --namespace "ContainerInsights" --dimensions "Name=ClusterName,Value=testing_FP_T1_Cluster" --evaluation-periods 1 --statistic Average --period 60 --threshold 1 --comparison-operator GreaterThanOrEqualToThreshold

# Creates our Disk Alarm

aws cloudwatch put-metric-alarm --alarm-name Test_Env_Disk_Alarm --alarm-description "An alarm to check our hard disk node filesystem utilisation." --alarm-actions arn:aws:sns:eu-west-1:524536385964:fpt1 --metric-name node_filesystem_utilization --namespace "ContainerInsights" --statistic Maximum --dimensions "Name=ClusterName,Value=testing_FP_T1_Cluster" --period 60 --evaluation-periods 1 --threshold 75 --comparison-operator GreaterThanOrEqualToThreshold

# Our Dashboard represented in JSON format.

dashboard=$(cat cloudwatch/json/dashboard.json)

# Create our AWS Dashboard

aws cloudwatch put-dashboard --dashboard-name=testing_cloudwatch12345 --dashboard-body $dashboard