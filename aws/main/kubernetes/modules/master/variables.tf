variable "ami" {
  default = ""
  type = string
}

variable "master_flavour" {
  default = ""
  type = string
}

variable "keypair_name" {
  default = ""
  type = string
}

variable "security_group_ids" {
  default = []
  type = list(string)
}

variable "subnet_id" {
  default = ""
}

variable "az" {
  default = ""
  type = string
}
