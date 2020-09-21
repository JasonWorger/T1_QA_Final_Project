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


# Node Security Groups

Our EKS nodes must have full outbound internet access. However, they run on a private subnet.

Our nodes and node groups can only communicate with a set number of IP addresses, and on a set number of ports. This includes:
- Communication with the Cluster Controller.
- Communication with each other.
- Communication with our RDS instance on port 3306.
- Communication with a specific workstation IP address.

They are connected to a load balancer, which handles all inbound connections from the public.

