variable "instance_flavour" {
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

variable "instance_name" {
  default = "terraform-managed"
  description = "Gives a name to the EC2 instance to identify in AWS console"
  type = string
}