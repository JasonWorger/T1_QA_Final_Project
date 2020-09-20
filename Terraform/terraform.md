# Terraform AWS IAM User requirements

The terraform IAM user requires the following permissions:

AdministratorAccess
AmazonEKSClusterPolicy
AmazonEC2FullAccess
VPCFullAccess
IAMFullAccess
RDSFullAccess





# Configuring Terraform

cd to the staging directory within the environments directory. 

Run the following commands:

`terraform init`

`terraform fmt`

`terraform plan --var-file=<file>.tfvars -out=<file>plan`

`terraform apply "<file>plan"`

To destroy the terraform architecture:

`terraform destroy --var-file=<file>.tfvars`
