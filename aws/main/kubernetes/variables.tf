variable "region" {
  default = "ap-south-1"
  description = "The region in AWS to create the instances."
}

/*
variable "access_key" {
  description = "The AWS Access key for the account used to provision infrastructure"
}

variable "secret_key" {
  description = "The AWS Secret key for the account used to provision infrastructure"
}
*/

variable "vpc_id" {
  default = ""
}

variable "ami" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "subnet_cidr" {}

variable "master_flavour" {
  default = "t3.xlarge" // 4x16
}

variable "worker_flavour" {
  default = "t3.large" // 2x8
}

variable "master_count" {
  default = 1
  type = number
}

variable "worker_count" {
  default = 1
  type = number
}

locals {
  availability_zones = [for s in ["a", "b", "c"]: format("%s%s", var.region, s)]
}