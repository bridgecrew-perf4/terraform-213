variable "access_key" {
  description = "The AWS Access key for the account used to provision infrastructure"
}

variable "secret_key" {
  description = "The AWS Secret key for the account used to provision infrastructure"
}

variable "vpc_id" {
  default = ""
}

variable "ami" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "instance_flavour" {
  default = "t2.micro"
}

variable "master_count" {
  default = 1
  type = number
}

variable "worker_count" {
  default = 1
  type = number
}