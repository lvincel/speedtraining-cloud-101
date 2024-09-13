variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "cidr_block_subnet_public" {
  default = "10.0.1.0/24"
}

variable "cidr_block_subnet_private" {
  default = "10.0.2.0/24"
}


variable "az" {
  default = "ap-southeast-1a"
}
