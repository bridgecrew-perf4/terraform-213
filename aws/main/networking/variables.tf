
variable "region" {
  default = "ap-south-1"
}

variable "instance_name" {

}

variable "instance_type" {
  default = "t2.micro"
}

variable "image_id" {
  default = "ami-04b1ddd35fd71475a" // Amazon Linux 2 AMI 64-bit x86
  description = "The ID of the image being used to deploy the instance"
}

variable "instance_count" {
  default = 1
  type = number
  description = "The number of instances to create"
}

locals {
  availability_zones = [for s in ["a", "b", "c"]: format("%s%s", var.region, s)]
}