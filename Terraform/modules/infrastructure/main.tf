# Root Configuration Module

# ----- LOCAL VARIABLES -----


locals {
  cluster_name = "${var.environment}_FP_T1_Cluster"
}


# ----- ROOT CONFIGURATION -----


# Create VPC.
module "VPC" {
  source = "./VPC"

  environment    = var.environment

  vpc_cidr_block = var.vpc_cidr_block

  cluster_name   = local.cluster_name
}

# Create Subnets within our VPC.
module "Subnets" {
  source = "./Subnets"

  environment = var.environment

  vpc_id = module.VPC.vpc_id

  public_cidr_block      = var.public_cidr_block
  private_eks_cidr_block = var.private_eks_cidr_block
  private_rds_1_cidr_block = var.private_rds_1_cidr_block
  private_rds_2_cidr_block = var.private_rds_2_cidr_block

  cluster_name = local.cluster_name
}

# Configure Network Access Control.

# Configure Security Groups.

module "SecurityGroups" {
  source = "./SecurityGroups"

  environment = var.environment

  vpc_id = module.VPC.vpc_id

  private_eks_subnet_id = module.Subnets.private_eks_subnet_id
  public_subnet_id      = module.Subnets.public_subnet_id

  controller_IP_CIDR = var.controller_IP_CIDR

  cluster_name = local.cluster_name
}

# Before you can launch nodes and register them into a cluster, you must create an IAM role for those nodes.

module "EKSClusterIAMPolicy" {
  source = "./EKSClusterIAMPolicy"

  environment = var.environment
}

# Before you can create Amazon EKS clusters, you must create an EKS IAM role for them.
module "EKSNodeIAMPolicy" {
  source = "./EKSNodeIAMPolicy"

  environment = var.environment
}

# Create Cluster. Depends on IAM roles!
module "EKS" {
  source     = "./EKS"
  depends_on = [module.EKSClusterIAMPolicy, module.EKSNodeIAMPolicy]

  environment = var.environment

  eks_cluster_sec_group_id = module.SecurityGroups.k8s_controller_sec_group_id
  eks_node_sec_group_id    = module.SecurityGroups.k8s_node_sec_group_id

  ssh_key_pair_name = var.ssh_key_pair_name

  private_eks_subnet_id = module.Subnets.private_eks_subnet_id
  public_subnet_id      = module.Subnets.public_subnet_id


  eks_cluster_role_arn = module.EKSClusterIAMPolicy.EKSClusterIAMPolicyARN
  eks_node_role_arn    = module.EKSNodeIAMPolicy.EKSNodeIAMPolicyARN

  desired_node_group_size = var.desired_node_group_size
  maximum_node_group_size = var.maximum_node_group_size
}

# Create RDS.
module "RDS" {
  source = "./RDS"

  environment = var.environment

  db_subnet_group_name = module.Subnets.rds_subnet_name
  rds_sec_group_id     = module.SecurityGroups.rds_sec_group_id

  database_instance_class = var.database_instance_class

  db_root_password         = var.db_root_password
  db_max_allocated_storage = var.db_max_allocated_storage
}