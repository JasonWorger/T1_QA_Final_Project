variable "environment" {
  description = "The environment which this infrastructure will be running on."
  default     = "This variable must be defined at environment level."
}


variable "maximum_node_group_size" {
  description = "The maximum number of nodes in our node scaling group."
  default     = "This variable must be defined at environment level."
}


variable "desired_node_group_size" {
  description = "The desired number of nodes in our node scaling group."
  default     = "This variable must be defined at environment level."
}


variable "database_instance_class" {
  description = "The instance that our Database will be running on."
  default     = "This variable must be defined at environment level."
}


variable "db_root_password" {
  description = "The root password of our database."
  default     = "This variable must be defined on runtime."
}


variable "db_max_allocated_storage" {
  description = "The maximum amount of storage allocated to our RDS instance."
  default     = "This variable must be defined at environment level."
}


variable "controller_IP_CIDR" {
  description = "The IP CIDR of our controller machine, running Ansible, Jenkins, Kubectl etc..."
  default     = "This variable must be defined at environment level."
}


variable "public_cidr_block" {
  description = "The CIDR block belonging to our public subnet."
  default     = "This variable must be defined at environment level."
}


variable "private_eks_cidr_block" {
  description = "The CIDR block belonging to our private eks subnet."
  default     = "This variable must be defined at environment level."
}


variable "private_rds_cidr_block" {
  description = "The CIDR block belonging to our private rds subnet."
  default     = "This variable must be defined at environment level."
}


variable "vpc_cidr_block" {
  description = "The region which this infrastructure will be running in."
  default     = "This variable must be defined at environment level."
}


variable "ssh_key_pair_name" {
  description = "The name of our SSH key pair."
  default     = "This variable must be defined at environment level."
}