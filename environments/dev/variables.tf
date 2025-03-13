variable "env" {
    description = "environment name"
    type = string
  
}

variable "vpc_cidr" {
    description = "cidr of eks vpc"
    type = string
}

variable "public_subnets" {
    description = "list of public subnets"
    type = list(string)
}

variable "availability_zones" {
    description = "list of availability zones"
    type = list(string)
}

variable "desired_size" {
    description = "desired number of nodes in the eks node group"  
    type = number
}

variable "max_size" {
    description = "max number of nodes in the eks node group"
    type = number
}

variable "min_size" {
    description = "min number of nodes in the eks node group"
    type = number  
}


