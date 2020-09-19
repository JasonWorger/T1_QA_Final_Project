variable "environment" {
  description = "The environment which this infrastructure will be running on."
  default = "This variable must be defined at environment level."
}

variable "region" {
  description = "The region which this infrastructure will be running in."
  default = "This variable must be defined at environment level."
}

variable "vpc_id" {
  description = "The ID of the VPC belonging to each subnet."
  default = "This variable must be defined at environment level."
}

variable "public_subnet_id" {
  description = "The ID of our public subnet."
  default = "This variable must be defined at environment level."
}

variable "private_subnet_id" {
  description = "The ID of our private subnet."
  default = "This variable must be defined at environment level."
}

variable "database_instance_class" {
  description = "The instance that our Database will be running on."
  default = "This variable must be defined at environment level."
}

variable "db_root_password" {
  description = "The root password of our database."
  default = "This variable must be defined on runtime."
}

variable "db_max_allocated_storage" {
  description = "The maximum amount of storage allocated to our RDS instance."
  default = "This variable must be defined at environment level."
}

variable "db_subnet_group_name" {
  description = "The name of our dedicated DB subnet."
  default = "This variable must be defined at environment level."
}

variable "rds_sec_group_id" {
  description = "The id of our rds security group."
  default = "This variable must be defined at environment level."
}