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