variable "region" {
  description = "AWS region name"
  default     = "eu-west-2"
}

variable "vpc_cidr" {

}

variable "service_name" {
  description = "The name of the network"
  default     = "platform-test"
}

variable "public_subnet_cidr" {
  type = "list"

}

variable "public_subnet_names" {
  type = "list"
}

variable "private_subnet_cidr" {
  type = "list"

}
variable "private_subnet_names" {
  type = "list"
}

variable "instance_type" {
  default  = "t2.micro"
}

variable "ami" {
  default = "ami-00f6a0c18edb19300"
}
variable "availability_zone" {
  type = "list"
}

