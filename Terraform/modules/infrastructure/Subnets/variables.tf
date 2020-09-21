variable "environment" {
  description = "The environment which this infrastructure will be running on."
  default     = "This variable must be defined at environment level."
}

variable "cluster_name" {
  description = "The name of our cluster."
  default     = "This variable must be defined at environment level."
}

variable "vpc_id" {
  description = "The ID of the VPC belonging to each subnet."
  default     = "This variable must be defined at environment level."
}

variable "public_subnet_az_1_cidr_block" {
  description = "The CIDR block belonging to our public subnet az 1."
  default     = "This variable must be defined at environment level."
}


variable "public_subnet_az_2_cidr_block" {
  description = "The CIDR block belonging to our public subnet az 2."
  default     = "This variable must be defined at environment level."
}


variable "private_eks_subnet_az_1_cidr_block" {
  description = "The CIDR block belonging to our private eks subnet az 1."
  default     = "This variable must be defined at environment level."
}

variable "private_eks_subnet_az_2_cidr_block" {
  description = "The CIDR block belonging to our private eks subnet az 2."
  default     = "This variable must be defined at environment level."
}


variable "private_rds_1_cidr_block" {
  description = "The CIDR block belonging to our private rds subnet."
  default     = "This variable must be defined at environment level."
}

variable "private_rds_2_cidr_block" {
  description = "The CIDR block belonging to our private rds subnet."
  default     = "This variable must be defined at environment level."
}