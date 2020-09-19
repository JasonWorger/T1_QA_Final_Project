variable "environment" {}
variable "region" {}
variable "maximum_node_group_size" {}
variable "desired_node_group_size" {}
variable "database_instance_class" {}
variable "db_root_password" {}
variable "db_max_allocated_storage" {}
variable "controller_IP_CIDR" {}
variable "public_cidr_block" {}
variable "private_eks_cidr_block" {}
variable "private_rds_cidr_block" {}
variable "vpc_cidr_block" {}
variable "ssh_key_pair_name" {}

provider "aws" {
  region = var.region
}

module "infrastructure" {
  source                   = "..\/..\/moduleses\/infrastructure"
  environment              = var.environment

  # VPC Config
  vpc_cidr_block           = var.vpc_cidr_block

  # Subnet Config
  public_cidr_block        = var.public_cidr_block
  private_eks_cidr_block   = var.private_eks_cidr_block
  private_rds_cidr_block   = var.private_rds_cidr_block

  # SSH Key Pair
  ssh_key_pair_name        = var.ssh_key_pair_name

  # EKS Scaling Configuration
  maximum_node_group_size  = var.maximum_node_group_size
  desired_node_group_size  = var.desired_node_group_size

  # Controller Machine Configuration
  controller_IP_CIDR       = var.controller_IP_CIDR

  # Database Configuration
  database_instance_class  = var.database_instance_class
  db_root_password         = var.db_root_password
  db_max_allocated_storage = var.db_max_allocated_storage
}