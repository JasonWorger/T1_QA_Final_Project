variable "environment" {
  description = "The environment which this infrastructure will be running on."
  default = "This variable must be defined at environment level."
}

variable "region" {
  description = "The region which this infrastructure will be running in."
  default = "This variable must be defined at environment level."
}