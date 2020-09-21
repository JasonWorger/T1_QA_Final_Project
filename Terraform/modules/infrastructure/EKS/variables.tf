variable "environment" {
  description = "The environment which this infrastructure will be running on."
  default     = "This variable must be defined at environment level."
}

# ----- SUBNETS -----


variable "private_eks_subnet_az1_id" {
  description = "The AWS ID belonging to our private eks subnet 1."
  default     = "This variable must be defined at environment level."
}

variable "private_eks_subnet_az2_id" {
  description = "The AWS ID belonging to our private eks subnet 2."
  default     = "This variable must be defined at environment level."
}

variable "public_subnet_az1_id" {
  description = "The AWS ID belonging to our public subnet 1."
  default     = "This variable must be defined at environment level."
}

variable "public_subnet_az2_id" {
  description = "The AWS ID belonging to our public subnet 2."
  default     = "This variable must be defined at environment level."
}

# ----------

variable "eks_cluster_role_arn" {
  description = "The aws arn of our specific IAM role for the EKS cluster."
  default     = "This variable must be defined at environment level."
}


variable "eks_node_role_arn" {
  description = "The aws arn of our specific IAM role for the EKS nodes."
  default     = "This variable must be defined at environment level."
}


variable "eks_cluster_sec_group_id" {
  description = "The ID for the EKS cluster security group."
  default     = "This variable must be defined at environment level."
}


variable "eks_node_sec_group_id" {
  description = "The ID for the EKS node security group."
  default     = "This variable must be defined at environment level."
}


variable "ssh_key_pair_name" {
  description = "The SSH Key Pair name."
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

variable "cluster_name" {
  description = "The name of our cluster."
  default     = "This variable must be defined at environment level."
}

variable "eks_node_instance_types" {
  description = "..."
  default     = "This variable must be defined at environment level."
}