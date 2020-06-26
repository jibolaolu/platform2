variable "region" {
  description = "AWS region name"
  default     = "eu-west-1"
}

variable "vpc_cidr_block" {
  description = "VPC Cidr Block"
  default     = "172.16.0.0/20"
}

variable "service_name" {
  description = "The name of the network"
  default     = "platform-test"
}
