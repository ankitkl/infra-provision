variable "aws_secret_key" {
   default = "XXXXXXXXXXXw1lDCXXXXXXXXXXXXXXXXXXX"
}

variable "Instance_type" {}

variable "ami" {
   default = "ami-1e749f67"
}
variable "aws_access_key" {
   default = "AKIXXXXXXXXXXXX"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        eu-west-1a = "ami-1e749f67" # ubuntu 14.04 LTS
	eu-west-1b = "ami-1e749f67"
	eu-west-1c = "ami-1e749f67"
    }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

variable "private_subnet_cidr2" {
    description = "CIDR for the Private Subnet2"
    default = "10.0.2.0/24"
}
